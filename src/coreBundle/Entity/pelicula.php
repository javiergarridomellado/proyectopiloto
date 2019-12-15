<?php

namespace coreBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * pelicula
 *
 * @ORM\Table(name="pelicula")
 * @ORM\Entity(repositoryClass="coreBundle\Repository\peliculaRepository")
 */
class pelicula
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
     * @var datetime
     *
     * @ORM\Column(name="fechadealta", type="datetime")
     */
    private $fechadealta;
   
    /**
    * @var \UsuariosBundle\Entity\usuario
    *
    * @ORM\ManyToOne(targetEntity="\usuarioBundle\Entity\user")
    */
    private $usuario;
    
   
    
    /**
     * @var integer
     *
     * @ORM\Column(name="anio", type="integer")
     */
    private $anio;

    /**
     * @var string
     *
     * @ORM\Column(name="nombre", type="string")
     */
    private $nombre;
    
    /**
     * @var string
     *
     * @ORM\Column(name="director", type="string",nullable=true)
     */
    private $director;
    
    
    /**
     * @var datetime
     *
     * @ORM\Column(name="descripcion", type="text", nullable=true)
     */
    private $descripcion;
    
    /**
     * @var datetime
     *
     * @ORM\Column(name="actores", type="text", nullable=true)
     */
    private $actores;
    
    
    /**
     * @var string
     *
     * @ORM\Column(name="path", type="string", length=255, nullable = true)
     */
    private $path;
    
    /**
     * tiposcentro
     * 
     * @var \coreBundle\Entity\votacion
     * @ORM\OneToMany(targetEntity="\coreBundle\Entity\votacion", mappedBy="pelicula" , cascade={"persist", "remove"})
     */
    private $votaciones;
    
    /**
     * @var string
     *
     * @ORM\Column(name="votaciontotal", type="float")
     */
    private $votaciontotal;
    
    /**
     * @ORM\ManyToMany(targetEntity="usuarioBundle\Entity\user", inversedBy="peliculasfavoritas")
     * @ORM\JoinTable(name="pelicula_favorita",
     *      joinColumns={@ORM\JoinColumn(name="pelicula_id", referencedColumnName="id")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="user_id", referencedColumnName="id")}
     *      )
     **/
    private $pelicula_favorita;
    
    public function __construct(){
        $this->anio = date('Y');
        $this->fechadealta = new \DateTime();
        $this->nombre = "";
        $this->pelicula_favorita = new \Doctrine\Common\Collections\ArrayCollection();
        $this->votaciontotal = 0;
    }
    
    public function getRuta(){
        return "./caratulas/";
    }
    public function removeUpload()
    {
        if ($this->path){
            $file = $this->getRuta() . $this->path;
            if (file_exists($file)){
                unlink($file);
            }
        }
    }
    public function getPathcaratula()
    {
        return "/caratulas/".$this->path;
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
     * Set fechadealta
     *
     * @param \DateTime $fechadealta
     *
     * @return pelicula
     */
    public function setFechadealta($fechadealta)
    {
        $this->fechadealta = $fechadealta;

        return $this;
    }

    /**
     * Get fechadealta
     *
     * @return \DateTime
     */
    public function getFechadealta()
    {
        return $this->fechadealta;
    }

    /**
     * Set anio
     *
     * @param integer $anio
     *
     * @return pelicula
     */
    public function setAnio($anio)
    {
        $this->anio = $anio;

        return $this;
    }

    /**
     * Get anio
     *
     * @return integer
     */
    public function getAnio()
    {
        return $this->anio;
    }

    /**
     * Set nombre
     *
     * @param string $nombre
     *
     * @return pelicula
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * Get nombre
     *
     * @return string
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * Set director
     *
     * @param string $director
     *
     * @return pelicula
     */
    public function setDirector($director)
    {
        $this->director = $director;

        return $this;
    }

    /**
     * Get director
     *
     * @return string
     */
    public function getDirector()
    {
        return $this->director;
    }

    /**
     * Set descripcion
     *
     * @param string $descripcion
     *
     * @return pelicula
     */
    public function setDescripcion($descripcion)
    {
        $this->descripcion = $descripcion;

        return $this;
    }

    /**
     * Get descripcion
     *
     * @return string
     */
    public function getDescripcion()
    {
        return $this->descripcion;
    }

    /**
     * Set actores
     *
     * @param string $actores
     *
     * @return pelicula
     */
    public function setActores($actores)
    {
        $this->actores = $actores;

        return $this;
    }

    /**
     * Get actores
     *
     * @return string
     */
    public function getActores()
    {
        return $this->actores;
    }

    /**
     * Set path
     *
     * @param string $path
     *
     * @return pelicula
     */
    public function setPath($path)
    {
        $this->path = $path;

        return $this;
    }

    /**
     * Get path
     *
     * @return string
     */
    public function getPath()
    {
        return $this->path;
    }

    /**
     * Set usuario
     *
     * @param \usuarioBundle\Entity\usuario $usuario
     *
     * @return pelicula
     */
    public function setUsuario(\usuarioBundle\Entity\usuario $usuario = null)
    {
        $this->usuario = $usuario;

        return $this;
    }

    /**
     * Get usuario
     *
     * @return \usuarioBundle\Entity\usuario
     */
    public function getUsuario()
    {
        return $this->usuario;
    }

    /**
     * Add votacione
     *
     * @param \coreBundle\Entity\votacion $votacione
     *
     * @return pelicula
     */
    public function addVotacione(\coreBundle\Entity\votacion $votacione)
    {
        $this->votaciones[] = $votacione;

        return $this;
    }

    /**
     * Remove votacione
     *
     * @param \coreBundle\Entity\votacion $votacione
     */
    public function removeVotacione(\coreBundle\Entity\votacion $votacione)
    {
        $this->votaciones->removeElement($votacione);
    }

    /**
     * Get votaciones
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getVotaciones()
    {
        return $this->votaciones;
    }

    /**
     * Add peliculaFavoritum
     *
     * @param \usuarioBundle\Entity\user $peliculaFavoritum
     *
     * @return pelicula
     */
    public function addPeliculaFavoritum(\usuarioBundle\Entity\user $peliculaFavoritum)
    {
        $existe = false;
        if ($this->pelicula_favorita != NULL){
            foreach ($this->pelicula_favorita as $ae){
                if ($ae->getId() == $peliculaFavoritum->getId()){
                    $existe = true;
                }
            }
        }
        if ($existe == false){
           $this->pelicula_favorita[] = $peliculaFavoritum;
        }
        return $this;
    }

    /**
     * Remove peliculaFavoritum
     *
     * @param \usuarioBundle\Entity\user $peliculaFavoritum
     */
    public function removePeliculaFavoritum(\usuarioBundle\Entity\user $peliculaFavoritum)
    {
        $this->pelicula_favorita->removeElement($peliculaFavoritum);
    }

    /**
     * Get peliculaFavorita
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getPeliculaFavorita()
    {
        return $this->pelicula_favorita;
    }

    /**
     * Set votaciontotal
     *
     * @param integer $votaciontotal
     *
     * @return pelicula
     */
    public function setVotaciontotal($votaciontotal)
    {
        $this->votaciontotal = $votaciontotal;

        return $this;
    }

    /**
     * Get votaciontotal
     *
     * @return integer
     */
    public function getVotaciontotal()
    {
        return $this->votaciontotal;
    }
    
    public function getVotos()
    {
        $votos = $this->votaciontotal;
        if($this->votaciontotal < 0){
           $votos = 0; 
        }elseif($this->votaciontotal > 10){
            $votos = 10;
        }
        return $votos;
    }
    
    function isFavourite($iduser){
        $estamarcada = false;
        if ($this->pelicula_favorita != NULL){
            foreach ($this->pelicula_favorita as $ae){
                if ($ae->getId() == $iduser){
                    $estamarcada = true;
                }
            }
        }
        return $estamarcada;
    }
}
