<?php

namespace backendBundle\Controller;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\Tools\Pagination\Paginator;
use coreBundle\Entity\pelicula;
use coreBundle\Form\peliculaType;
use Symfony\Component\Filesystem\Filesystem;
use coreBundle\Entity\votacion;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class BackendController extends Controller
{   
    public static function añadirpeliculas($em){
        for($i=0;$i<200;$i++){
            $pelicula = new pelicula();
            $randanio = rand(1920, 2019);
            $randnombre = md5($randanio);
            $randirectorn = rand(2000,5000);
            $randdirector = md5($randirectorn);
            $randactorres = md5($randdirector);
            $pelicula->setNombre($randnombre);
            $pelicula->setAnio($randanio);
            $pelicula->setDirector($randdirector);
            $pelicula->setDescripcion('pelicula de prueba');
            $pelicula->setActores($randactorres);
            $em->persist($pelicula);
            $em->flush();
            $pelicula->setPath($pelicula->getId().".jpg");
            $em->persist($pelicula);
            $em->flush();
        }
    }
    
    
    
    public function indexAction(Request $request, $page)
    {
        if( $this->get('security.authorization_checker')->isGranted('ROLE_SUPER_ADMIN') === true
                ||
                $this->get('security.authorization_checker')->isGranted('ROLE_USER') === true
            ){
            $usuario = $this->get('security.token_storage')->getToken()->getUser();
            $em = $this->getDoctrine()->getManager();
            $peliculasQuery = $em->getRepository('coreBundle:pelicula')
                    ->findAllQuery();
            $arraydisponibles = array();
            //$this->añadirpeliculas($em);
           
            if ($page == NULL){
                $page = 1;
            }
            $pageSize = 20;
            $peliculas = $this->getPaginate($pageSize, $page, $peliculasQuery);
            $totalItems = count($peliculas);
            $pagescount = ceil($totalItems / $pageSize);
            return $this->render('backendBundle:Backend:index.html.twig' ,
                                array(  "peliculas" => $peliculas,
                                        "totalItems" => $totalItems,
                                        "pagesCount" => $pagescount,
                                        "currentpage" => $page,
                                        'usuario' => $usuario
                                    )
                                );
        }
        return $this->redirectToRoute('homepage');
        
    }
    
    public function getPaginate($pageSize, $currentPage, $queryBuilder){
        if ($currentPage > 0){
            $queryBuilder->setFirstResult($pageSize * ($currentPage - 1))->setMaxResults($pageSize);
        }
        $paginator = new Paginator($queryBuilder, $fetchJoinCollection = true);
        return $paginator;
    }
    
    public function newfilmAction(Request $request, $id){
        if( $this->get('security.authorization_checker')->isGranted('ROLE_SUPER_ADMIN') === true
                
            ){
            $usuario = $this->get('security.token_storage')->getToken()->getUser();
            $em = $this->getDoctrine()->getManager();
            if($id == NULL){
                $pelicula = new pelicula();
                $titulo = "Nueva pelicula";
            }
            $form = $this->createForm(peliculaType::class, $pelicula);   
            $error = "";
            if ($request->getMethod() == "POST"){
                $form->handleRequest($request);
                if ($form->isSubmitted() && $form->isValid()) {
                    $em->persist($pelicula);
                    $em->flush();
                    $fs = new Filesystem();
                    $dir = "./caratulas/" ;
                    try {
                        $fs->mkdir($dir, 0755);
                    } catch (IOExceptionInterface $e) {
                        
                    }
                    foreach ($_FILES as $k => $key) {
                        if($key['error'] == UPLOAD_ERR_OK ){                        
                            $name = $key['name'];
                            $ext = pathinfo($key['name'], PATHINFO_EXTENSION);
                            $rand = rand(1, 100);
                            $name = $pelicula->getId() . "-" . $rand . "." . $ext;
                            $temporal = $key['tmp_name'];
                            if ($key['type'] == 'image/png' || 
                                $key['type'] == 'image/jpg' || 
                                $key['type'] == 'image/jpeg' 
                                ){
                                $pelicula->removeupload();
                                move_uploaded_file($temporal, $pelicula->getRuta() . $name);
                                $ruta = $pelicula->getRuta() . $name;
                                $pelicula->setPath($name);
                                $em->persist($pelicula);
                                $em->flush();
                                }
                        }  
                    }    
                    return $this->redirectToRoute('backend_homepage');
                }
            }
            return $this->render('backendBundle:Backend:newfilm.html.twig',
                    array('form' => $form->createView(),'titulo'=>$titulo,
                          'pelicula' => $pelicula,
                          "error" => $error));
            
        }
        return $this->redirectToRoute('homepage');
    }
    
    public function addfavoritaAction(Request $request,$id)
    {
        if( $this->get('security.authorization_checker')->isGranted('ROLE_SUPER_ADMIN') === true
                ||
                $this->get('security.authorization_checker')->isGranted('ROLE_USER') === true
            ){
            $usuario = $this->get('security.token_storage')->getToken()->getUser();
            $em = $this->getDoctrine()->getManager();
            $pelicula = $em->getRepository('coreBundle:pelicula')->find($id);
            if($pelicula){
                $estadofavorita = $pelicula->isFavourite($usuario->getId());
                if($estadofavorita == FALSE){
                    $pelicula->addPeliculaFavoritum($usuario);
                }else{
                    $pelicula->removePeliculaFavoritum($usuario);
                }
                $em->persist($pelicula);
                $em->flush();
                $origen = intval($request->query->get('origen'));
                if($origen){
                    return $this->redirectToRoute('backend_favoritas');
                }
                return $this->redirectToRoute('backend_homepage');
            }
            
        }
        return $this->redirectToRoute('homepage');
        
    }
    
    public function favoritasAction(Request $request, $page)
    {
        if( $this->get('security.authorization_checker')->isGranted('ROLE_SUPER_ADMIN') === true
                ||
                $this->get('security.authorization_checker')->isGranted('ROLE_USER') === true
            ){
            $usuario = $this->get('security.token_storage')->getToken()->getUser();
            $em = $this->getDoctrine()->getManager();
            $peliculasQuery = $em->getRepository('coreBundle:pelicula')
                    ->findAllFavoritasQuery($usuario->getId());
            $arraydisponibles = array();
            
            
            if ($page == NULL){
                $page = 1;
            }
            $pageSize = 20;
            $peliculas = $this->getPaginate($pageSize, $page, $peliculasQuery);
            $totalItems = count($peliculas);
            $pagescount = ceil($totalItems / $pageSize);
            return $this->render('backendBundle:Backend:favoritas.html.twig' ,
                                array(  "peliculas" => $peliculas,
                                        "totalItems" => $totalItems,
                                        "pagesCount" => $pagescount,
                                        "currentpage" => $page,
                                        'usuario' => $usuario
                                    )
                                );
        }
        return $this->redirectToRoute('homepage');
        
    }
    
    public function addvotoAction(Request $request,$id)
    {
        if( $this->get('security.authorization_checker')->isGranted('ROLE_SUPER_ADMIN') === true
                ||
                $this->get('security.authorization_checker')->isGranted('ROLE_USER') === true
            ){
            $usuario = $this->get('security.token_storage')->getToken()->getUser();
            $em = $this->getDoctrine()->getManager();
            $pelicula = $em->getRepository('coreBundle:pelicula')->find($id);
            if($pelicula){
                
                $votacion = $em->getRepository('coreBundle:votacion')->findOneBy(array('user'=>$usuario,'pelicula'=>$pelicula));
                if($votacion == NULL){
                    $votacion = new votacion();
                    $votacion->setUser($usuario);
                    $votacion->setPelicula($pelicula);
                }
                $votosold = $votacion->getPuntuacion();
                if($request->getMethod() == 'POST'){
                    $voto = intval($request->request->get('voto'));
                    $pelicula->setVotaciontotal($pelicula->getVotaciontotal()+$voto-$votosold);
                    $votacion->setPuntuacion($voto);
                    $em->persist($pelicula);
                    $em->persist($votacion);
                    $em->flush();
                    return $this->redirectToRoute('backend_homepage');
                }
                return $this->render('backendBundle:Backend:addvoto.html.twig' ,
                                array(  "votacion" => $votacion
                                    )
                                );
            }
            
        }
        return $this->redirectToRoute('homepage');
        
    }
}
