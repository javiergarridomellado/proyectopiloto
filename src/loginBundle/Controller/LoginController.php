<?php

namespace loginBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use CoreBundle\Entity\utils;
use UsuarioBundle\Form\usuariopassType;

/**
 * Class DefaultController
 * @package loginBundle\Controller
 */
class LoginController extends Controller
{
    public function loginAction(Request $request){
        $kernel = $this->get('kernel');
        $devMode = $kernel->isDebug();
        $seguro = $request->isSecure();
        if ($devMode == true || $seguro) {
            $authenticationUtils = $this->get('security.authentication_utils'); 
            // get the login error if there is one 
            $error = $authenticationUtils->getLastAuthenticationError(); 
            // last username entered by the user 
            $lastUsername = $authenticationUtils->getLastUsername();

            return $this->render( 'loginBundle:login:index.html.twig', array( 
                // last username entered by the user 
                'last_username' => $lastUsername, 'error' => $error, ) );
        }else{
            return $this->redirectToRoute("homepage");
        }
    }
    
    public function recordarcodeAction(Request $request, $code)
    {
        $em = $this->getDoctrine()->getManager();
        $usuario = $em->getRepository('UsuarioBundle:usuario')
                                ->findOneBy(array('code'=> $code));
        if ($usuario != NULL){
            $form = $this->createForm(usuariopassType::class, $usuario,
                    array("attr" => array()));   
            if ($request->getMethod() == "POST"){
                $form->handleRequest($request);
                if ($form->isSubmitted() && $form->isValid()) {
                    $usuario->setSalt(md5(time()));   
                    $encoder = $this->get('security.encoder_factory')->getEncoder($usuario);
                    $passwordCodificado = $encoder->encodePassword($usuario->getPassword(), $usuario->getSalt());
                    $usuario->setPassword($passwordCodificado);
                    $usuario->setCode(NULL);
                    $em->persist($usuario);
                    $em->flush();
                    return $this->render( 'LoginBundle:login:cambiocorrecto.html.twig', 
                            array("form" => $form->createView(), "usuario" => $usuario));
                }
            }

            return $this->render( 'LoginBundle:login:recordarcode.html.twig', 
                    array("form" => $form->createView(), "usuario" => $usuario));
        }
        return $this->redirectToRoute("login");
    }
    
    public function recordarAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $error = "";
        if ($request->getMethod() == "POST"){
            $email = $request->request->get("email");
            if ($email != NULL){
                $usuario = $em->getRepository("UsuarioBundle:usuario")->findUser($email);
                if ($usuario != NULL){
                    $codigorecuperacion = md5(microtime());
                    $existe = $em->getRepository('UsuarioBundle:usuario')
                            ->findOneBy(array('code'=>$codigorecuperacion));
                    while($existe){
                        $codigorecuperacion = md5(microtime());
                        $existe = $em->getRepository('UsuarioBundle:usuario')
                                ->findOneBy(array('code'=>$codigorecuperacion));
                    }
                    
                    $usuario->setCode($codigorecuperacion);
                    $em->persist($usuario);
                    $em->flush();
                    
                    $host = $request->getHost();
                    $protocol = $request->getScheme();
                    $urlrecovery = $protocol . "://" . $host . $this->generateUrl("recordar_pass_code", 
                            array("code" => $codigorecuperacion));
                            
                    $body = $this->renderView("LoginBundle:login:mailrecordar.html.twig", 
                                array("urlrecovery" => $urlrecovery, 
                                    "usuario" => $usuario));

                    $kernel = $this->get('kernel');
                    $devMode = $kernel->isDebug();
                    if ($devMode == FALSE){
                        $subject = "Recodar contraseña - Cloud ExamsAndalucia";
                        $message = \Swift_Message::newInstance()
                            ->setSubject($subject)
                            ->setFrom('info@examsandalucia.com')
                            ->addTo($usuario->getEmail())
                            ->setContentType("text/html")
                            ->setBody($body, 'text/html');
                        $this->get('mailer')->send($message);
                        
                        return $this->render("LoginBundle:login:mailenviado.html.twig", 
                            array("urlrecovery" => $urlrecovery, 
                                    "usuario" => $usuario));
                    }else{
                        return $this->render("LoginBundle:login:mailrecordar.html.twig", 
                            array("urlrecovery" => $urlrecovery, 
                                    "usuario" => $usuario));
                    }
                }else{
                    $error = "El email no pertenece a ningún usuario dado de alta en el sistema.";
                }
            }else{
                $error = "Email no válido";
            }
        }
        
        return $this->render( 'LoginBundle:login:recordar.html.twig', array("error" => $error));
    }
}
