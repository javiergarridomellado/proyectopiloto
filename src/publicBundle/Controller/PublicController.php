<?php

namespace publicBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use usuarioBundle\Entity\userweb;
use Symfony\Component\HttpFoundation\Request;
use usuarioBundle\Form\usuariowebType;
use Doctrine\ORM\Tools\Pagination\Paginator;

class PublicController extends Controller
{
    /** indice pagina publica **/
    public function indexAction(Request $request, $page)
    {
        $em = $this->getDoctrine()->getManager();
        $peliculasQuery = $em->getRepository('coreBundle:pelicula')
                    ->findAllQuery();
        
        if ($page == NULL){
            $page = 1;
        }elseif($page > 5){
            return $this->redirectToRoute('homepage',array('page'=>5));
        }
        $pageSize = 20;
        $peliculas = $this->getPaginate($pageSize, $page, $peliculasQuery);
        $totalItems = count($peliculas);
        $pagescount = ceil($totalItems / $pageSize);
        if($pagescount > 5){
            $pagescount = 5;
        }
        return $this->render('publicBundle:Principal:index.html.twig',
                array('peliculas'=>$peliculas,
                      "totalItems" => $totalItems,
                      "pagesCount" => $pagescount,
                      "currentpage" => $page));
    }
    
    /** pagina top de parte publica **/
    public function toppeliculasAction(Request $request, $page)
    {
        $em = $this->getDoctrine()->getManager();
        $peliculasQuery = $em->getRepository('coreBundle:pelicula')
                    ->findAllTopQuery();
        
        if ($page == NULL){
            $page = 1;
        }elseif($page > 5){
            return $this->redirectToRoute('homepage',array('page'=>5));
        }
        $pageSize = 20;
        $peliculas = $this->getPaginate($pageSize, $page, $peliculasQuery);
        $totalItems = count($peliculas);
        $pagescount = ceil($totalItems / $pageSize);
        if($pagescount > 5){
            $pagescount = 5;
        }
        return $this->render('publicBundle:Principal:index.html.twig',
                array('peliculas'=>$peliculas,
                      "totalItems" => $totalItems,
                      "pagesCount" => $pagescount,
                      "currentpage" => $page,
                      "top"=> 1));
    }
    
    /** paginador **/
    public function getPaginate($pageSize, $currentPage, $queryBuilder){
        if ($currentPage > 0){
            $queryBuilder->setFirstResult($pageSize * ($currentPage - 1))->setMaxResults($pageSize);
        }
        $paginator = new Paginator($queryBuilder, $fetchJoinCollection = true);
        return $paginator;
    }
    
    
    /** registro usuario **/
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
    
    
    
    
    
}
