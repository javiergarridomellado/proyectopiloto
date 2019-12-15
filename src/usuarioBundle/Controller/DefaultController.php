<?php

namespace usuarioBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('usuarioBundle:Default:index.html.twig');
    }
}
