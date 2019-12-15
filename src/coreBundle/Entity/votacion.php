<?php

namespace coreBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * notificacion
 *
 * @ORM\Table(name="votacion")
 * @ORM\Entity(repositoryClass="coreBundle\Repository\votacionRepository")
 */
class votacion
{   
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;
    
    
    /**
     * @var \DateTime
     *
     * @ORM\Column(name="eliminado", type="boolean")
     */
    private $eliminado;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="fechavotaciona", type="datetime", nullable=true)
     */
    private $fechavotacion;

  
     
    /**
     * @var integer     de 0 a 10
     * @ORM\Column(name="puntuacion", type="integer")
     */
    private $puntuacion;
    
    /**
     * tiposcentro
     * 
     * @var pelicula
     * @ORM\ManyToOne(targetEntity="\coreBundle\Entity\pelicula",  inversedBy="votaciones")
     */
    private $pelicula;
    
    /**
     * academia
     * 
     * @var user
     * @ORM\ManyToOne(targetEntity="\usuarioBundle\Entity\user",  inversedBy="votaciones") 
     */
    private $user;
    
    public function __construct() {
        $this->eliminado  = 0;
        $this->fechavotacion = new \DateTime();
        $this->puntuacion = 0;
    }

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set eliminado
     *
     * @param boolean $eliminado
     *
     * @return votacion
     */
    public function setEliminado($eliminado)
    {
        $this->eliminado = $eliminado;

        return $this;
    }

    /**
     * Get eliminado
     *
     * @return boolean
     */
    public function getEliminado()
    {
        return $this->eliminado;
    }

    /**
     * Set fechavotacion
     *
     * @param \DateTime $fechavotacion
     *
     * @return votacion
     */
    public function setFechavotacion($fechavotacion)
    {
        $this->fechavotacion = $fechavotacion;

        return $this;
    }

    /**
     * Get fechavotacion
     *
     * @return \DateTime
     */
    public function getFechavotacion()
    {
        return $this->fechavotacion;
    }

    /**
     * Set puntuacion
     *
     * @param integer $puntuacion
     *
     * @return votacion
     */
    public function setPuntuacion($puntuacion)
    {
        $this->puntuacion = $puntuacion;

        return $this;
    }

    /**
     * Get puntuacion
     *
     * @return integer
     */
    public function getPuntuacion()
    {
        return $this->puntuacion;
    }

    /**
     * Set pelicula
     *
     * @param \coreBundle\Entity\pelicula $pelicula
     *
     * @return votacion
     */
    public function setPelicula(\coreBundle\Entity\pelicula $pelicula = null)
    {
        $this->pelicula = $pelicula;

        return $this;
    }

    /**
     * Get pelicula
     *
     * @return \coreBundle\Entity\pelicula
     */
    public function getPelicula()
    {
        return $this->pelicula;
    }

    /**
     * Set user
     *
     * @param \usuarioBundle\Entity\user $user
     *
     * @return votacion
     */
    public function setUser(\usuarioBundle\Entity\user $user = null)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user
     *
     * @return \usuarioBundle\Entity\user
     */
    public function getUser()
    {
        return $this->user;
    }
}
