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
    
   
}
