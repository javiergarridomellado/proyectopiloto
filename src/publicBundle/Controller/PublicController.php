<?php

namespace publicBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use usuarioBundle\Entity\userweb;
use Symfony\Component\HttpFoundation\Request;
use usuarioBundle\Form\usuariowebType;

class PublicController extends Controller
{
    public function indexAction()
    {
        return $this->render('publicBundle:Principal:index.html.twig');
    }
    
    public function registerAction(Request $request,$id){
        $em = $this->getDoctrine()->getManager();
        $passwordobligatorio = true;
        if($id == NULL){
            $user = new userweb();
            $titulo = "Nuevo usuario web";
        }
        $form = $this->createForm(usuariowebType::class, $user,
                array("attr" => array( "password" => $passwordobligatorio)));   
        $error = "";
        if ($request->getMethod() == "POST"){
            $form->handleRequest($request);
            if ($form->isSubmitted() && $form->isValid()) {
                $repetido = $em->getRepository("usuarioBundle:user")->findUseremail($user->getEmail(), $user->getId());
                    if ($repetido == NULL){
                        if($user->getDatecreated()==NULL){
                            $user->setDatecreated(new \DateTime('now'));
                        }
                        $newpass = $user->getPassword();
                        if ($newpass != NULL){
                            $user->setSalt(md5(time()));   
                            $encoder = $this->get('security.encoder_factory')->getEncoder( $user);
                            $passwordCodificado = $encoder->encodePassword($user->getPassword(), $user->getSalt());
                            $user->setPassword($passwordCodificado);
                            $user->setLooked(true);
                            $user->setExpires(true);
                            $user->setEnable(true);
                            $em->persist($user);
                            $em->flush();
                            $usuario = $this->get('security.token_storage')->getToken()->getUser();
                            return $this->redirectToRoute('homepage');
                        }else{
                            $error = "contraseña requerida";
                        }
                        
                    }else{
                        $error = "El email ya está registrado";
                    }
            }
        }
        return $this->render('publicBundle:Registro:newuser.html.twig',
                array('form' => $form->createView(),'titulo'=>$titulo,
                      'user' => $user,
                      "error" => $error));
    }
    
    
    
    public function newsuperadministradorAction(Request $request, $id){
        if (($this->get('security.authorization_checker')->isGranted('ROLE_SUPER_ADMIN') === true)||
                ($this->get('security.authorization_checker')->isGranted('ROLE_ADMINISTRADOR') === true)){
            $titulo = "";
            $em = $this->getDoctrine()->getManager();
            $passwordobligatorio = true;
            if($id == NULL){
                $usersuperadmin = new superadministrador();
                $titulo = "Nuevo superadministrador";
            }else{
                $usersuperadmin = $em->getRepository('UsuarioBundle:superadministrador')->find($id);
                $titulo = "Editar superadministrador";
                if($usersuperadmin == NULL){
                    $usersuperadmin = new superadministrador();
                }else{
                    $passwordobligatorio = false;
                }
            }
            $form = $this->createForm(superadministradorType::class, $usersuperadmin,
                    array("attr" => array( "password" => $passwordobligatorio)));   
            $error = "";
            if ($request->getMethod() == "POST"){
                $lastpass = $usersuperadmin->getPassword();     
                $form->handleRequest($request);
                if ($form->isSubmitted() && $form->isValid()) {
                    $repetido = $em->getRepository("UsuarioBundle:usuario")->findUseremail($usersuperadmin->getEmail(), $usersuperadmin->getId());
                    if ($repetido == NULL){
                        if($usersuperadmin->getDate()==NULL){
                            $usersuperadmin->setDate(new \DateTime('now'));
                        }
                        $newpass = $usersuperadmin->getPassword();
                        if ($newpass != NULL){
                            $usersuperadmin->setSalt(md5(time()));   
                            $encoder = $this->get('security.encoder_factory')->getEncoder( $usersuperadmin);
                            $passwordCodificado = $encoder->encodePassword($usersuperadmin->getPassword(), $usersuperadmin->getSalt());
                            $usersuperadmin->setPassword($passwordCodificado);
                        }else{
                            $usersuperadmin->setPassword($lastpass);
                        }
                        $usersuperadmin->setUsuario($usersuperadmin->getEmail());
                        $usersuperadmin->setBloqueado(true);
                        $usersuperadmin->setExpirado(true);
                        $usersuperadmin->setActivo(true);
                        $em->persist($usersuperadmin);
                        $em->flush();
                        $usuario = $this->get('security.token_storage')->getToken()->getUser();
                        \LogBundle\Controller\LogController::escribirLog($request,$usuario,$titulo);
                        return $this->redirectToRoute('listado_usuarios');
                    }else{
                        $error = "El email ya está registrado";
                    }
                }  
            }
            return $this->render('UsuarioBundle:superadministrador:newsuperadministrador.html.twig',
                array('form' => $form->createView(),'titulo'=>$titulo,
                      'usersuperadmin' => $usersuperadmin,
                      "error" => $error));
        }
        return $this->redirectToRoute('listado_usuarios');
    }
    
}
