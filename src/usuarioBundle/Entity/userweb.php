<?php

namespace usuarioBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * userweb
 *
 * @ORM\Table(name="userweb")
 * @ORM\Entity(repositoryClass="usuarioBundle\Repository\userwebRepository")
 */
class userweb extends user
{
    /**
     * @var string
     *
     * @ORM\Column(name="facebookid", type="string", length=255, nullable=true)
     */
    private $facebookid;
   
    /**
     * @var string
     *
     * @ORM\Column(name="googleid", type="string", length=255, nullable=true)
     */
    private $googleid;
   
   
   
    
   
    /**
     * @var string
     *
     * @ORM\Column(name="pathimage", type="string", length=255, nullable=true)
     */
    private $pathimage;
   
    /**
     * @var string
     *
     * @ORM\Column(name="codigorecuperacion", type="string", length=255, nullable=true)
     */
    private $codigorecuperacion;
   
    /**
     * @var string
     *
     * @ORM\Column(name="fecharecuperacion", type="datetime", nullable=true)
     */
    private $fecharecuperacion;
   
    /**
     * @var string
     *
     * @ORM\Column(name="cif", type="string", length=255, nullable=true)
     */
    private $cif;
   
    /**
     * @var string
     *
     * @ORM\Column(name="movil", type="string", length=255, nullable=true)
     */
    private $movil;
   
    /**
     * @var string
     *
     * @ORM\Column(name="empresa", type="string", length=255, nullable=true)
     */
    private $empresa;
    
    
    
    public function removeupload(){
        if ($this->pathimage){
            $file = "." . $this->pathimage;
            if (file_exists($file)){
                unlink($file);
            }
        }
    }
    
    public function getTelefonohtml(){
        $telefono = "";
        if ($this->getPhonenumber()){
            $telefono .= $this->getPhonenumber() . "<br>";
        }
        if ($this->getMovil()){
            $telefono .= $this->getMovil() . "<br>";
        }
        return $telefono;
    }
    
    public function getTelefonoform(){
        $telefono = "";
        $guion = false;
        if ($this->getPhonenumber()){
            $guion = true;
            $telefono .= $this->getPhonenumber();
        }
        if ($this->getMovil()){
            if ($guion){
                $telefono .= " - ";
            }
            $telefono .= $this->getMovil();
        }
        return $telefono;
    }
    
    

    public function __construct() {
        parent::__construct();
        $this->setRole("ROLE_USER");
    }

    /**
     * Set facebookid
     *
     * @param string $facebookid
     *
     * @return userweb
     */
    public function setFacebookid($facebookid)
    {
        $this->facebookid = $facebookid;

        return $this;
    }

    /**
     * Get facebookid
     *
     * @return string
     */
    public function getFacebookid()
    {
        return $this->facebookid;
    }

    /**
     * Set googleid
     *
     * @param string $googleid
     *
     * @return userweb
     */
    public function setGoogleid($googleid)
    {
        $this->googleid = $googleid;

        return $this;
    }

    /**
     * Get googleid
     *
     * @return string
     */
    public function getGoogleid()
    {
        return $this->googleid;
    }

  
    /**
     * Set pathimage
     *
     * @param string $pathimage
     *
     * @return userweb
     */
    public function setPathimage($pathimage)
    {
        $this->pathimage = $pathimage;

        return $this;
    }

    /**
     * Get pathimage
     *
     * @return string
     */
    public function getPathimage()
    {
        return $this->pathimage;
    }

    /**
     * Set codigorecuperacion
     *
     * @param string $codigorecuperacion
     *
     * @return userweb
     */
    public function setCodigorecuperacion($codigorecuperacion)
    {
        $this->codigorecuperacion = $codigorecuperacion;

        return $this;
    }

    /**
     * Get codigorecuperacion
     *
     * @return string
     */
    public function getCodigorecuperacion()
    {
        return $this->codigorecuperacion;
    }

    /**
     * Set fecharecuperacion
     *
     * @param \DateTime $fecharecuperacion
     *
     * @return userweb
     */
    public function setFecharecuperacion($fecharecuperacion)
    {
        $this->fecharecuperacion = $fecharecuperacion;

        return $this;
    }

    /**
     * Get fecharecuperacion
     *
     * @return \DateTime
     */
    public function getFecharecuperacion()
    {
        return $this->fecharecuperacion;
    }

    /**
     * Set cif
     *
     * @param string $cif
     *
     * @return userweb
     */
    public function setCif($cif)
    {
        $this->cif = $cif;

        return $this;
    }

    /**
     * Get cif
     *
     * @return string
     */
    public function getCif()
    {
        return $this->cif;
    }

    /**
     * Set movil
     *
     * @param string $movil
     *
     * @return userweb
     */
    public function setMovil($movil)
    {
        $this->movil = $movil;

        return $this;
    }

    /**
     * Get movil
     *
     * @return string
     */
    public function getMovil()
    {
        return $this->movil;
    }

  
    /**
     * Set empresa
     *
     * @param string $empresa
     *
     * @return userweb
     */
    public function setEmpresa($empresa)
    {
        $this->empresa = $empresa;

        return $this;
    }

    /**
     * Get empresa
     *
     * @return string
     */
    public function getEmpresa()
    {
        return $this->empresa;
    }
}
