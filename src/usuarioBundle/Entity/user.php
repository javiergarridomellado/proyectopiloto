<?php

namespace usuarioBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\AdvancedUserInterface;

/**
 * user
 *
 * @ORM\Table(name="user")
 * @ORM\Entity(repositoryClass="usuarioBundle\Repository\userRepository")
 * @ORM\InheritanceType("JOINED")
 * @ORM\DiscriminatorColumn(name="tipo", type="string")
 * @ORM\DiscriminatorMap({"user" = "user", "userweb" = "userweb", "superadministrador" = "superadministrador"})
 */
class user implements AdvancedUserInterface
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
     * @var string
     *
     * @ORM\Column(name="fullname", type="string", length=255)
     */
    private $fullname;

    /**
     * @var string
     *
     * @ORM\Column(name="lastname", type="string", length=255, nullable=true)
     */
    private $lastname;

    /**
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=255, unique=true)
     */
    private $email;

    /**
     * @var string
     *
     * @ORM\Column(name="password", type="string", length=255)
     */
    private $password;

    /**
     * @var string
     *
     * @ORM\Column(name="address", type="string", length=255, nullable=true)
     */
    private $address;

    /**
     * @var string
     *
     * @ORM\Column(name="postalcode", type="string", length=255, nullable=true)
     */
    private $postalcode;

    /**
     * @var string
     *
     * @ORM\Column(name="city", type="string", length=255, nullable=true)
     */
    private $city;

    /**
     * @var string
     *
     * @ORM\Column(name="country", type="string", length=255, nullable=true)
     */
    private $country;

    /**
     * @var string
     *
     * @ORM\Column(name="phonenumber", type="string", length=255, nullable=true)
     */
    private $phonenumber;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="datecreated", type="datetime")
     */
    private $datecreated;

    /**
     * @var string
     *
     * @ORM\Column(name="role", type="string", length=255)
     */
    private $role;

    /**
     * @var string
     *
     * @ORM\Column(name="salt", type="string", length=255)
     */
    private $salt;

    /**
     * @var Boolean
     *
     * @ORM\Column(name="enable", type="boolean")
     */
    private $enable;

    /**
     * @var Boolean
     *
     * @ORM\Column(name="looked", type="boolean")
     */
    private $looked;

    /**
     * @var Boolean
     *
     * @ORM\Column(name="expires", type="boolean")
     */
    private $expires;

   /**
     * @ORM\ManyToMany(targetEntity="coreBundle\Entity\pelicula", mappedBy="pelicula_favorita", cascade={"persist","remove"})
     */
    private $peliculasfavoritas;
    
    public function __toString() {
        return $this->fullname . " " . $this->lastname;
    }

    public function __construct() {
        $this->datecreated = new \DateTime();
        $this->enable = true;
        $this->expires = true;
        $this->looked = true;
        $this->role = "ROLE_USER";
        $this->peliculasfavoritas = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set fullname
     *
     * @param string $fullname
     *
     * @return user
     */
    public function setFullname($fullname)
    {
        $this->fullname = $fullname;

        return $this;
    }

    /**
     * Get fullname
     *
     * @return string
     */
    public function getFullname()
    {
        return $this->fullname;
    }

    /**
     * Set lastname
     *
     * @param string $lastname
     *
     * @return user
     */
    public function setLastname($lastname)
    {
        $this->lastname = $lastname;

        return $this;
    }

    /**
     * Get lastname
     *
     * @return string
     */
    public function getLastname()
    {
        return $this->lastname;
    }

    /**
     * Set email
     *
     * @param string $email
     *
     * @return user
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email
     *
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set password
     *
     * @param string $password
     *
     * @return user
     */
    public function setPassword($password)
    {
        $this->password = $password;

        return $this;
    }

    /**
     * Get password
     *
     * @return string
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * Set address
     *
     * @param string $address
     *
     * @return user
     */
    public function setAddress($address)
    {
        $this->address = $address;

        return $this;
    }

    /**
     * Get address
     *
     * @return string
     */
    public function getAddress()
    {
        return $this->address;
    }

    /**
     * Set postalcode
     *
     * @param string $postalcode
     *
     * @return user
     */
    public function setPostalcode($postalcode)
    {
        $this->postalcode = $postalcode;

        return $this;
    }

    /**
     * Get postalcode
     *
     * @return string
     */
    public function getPostalcode()
    {
        return $this->postalcode;
    }

    /**
     * Set city
     *
     * @param string $city
     *
     * @return user
     */
    public function setCity($city)
    {
        $this->city = $city;

        return $this;
    }

    /**
     * Get city
     *
     * @return string
     */
    public function getCity()
    {
        return $this->city;
    }

    /**
     * Set country
     *
     * @param string $country
     *
     * @return user
     */
    public function setCountry($country)
    {
        $this->country = $country;

        return $this;
    }

    /**
     * Get country
     *
     * @return string
     */
    public function getCountry()
    {
        return $this->country;
    }

    /**
     * Set datecreated
     *
     * @param \DateTime $datecreated
     *
     * @return user
     */
    public function setDatecreated($datecreated)
    {
        $this->datecreated = $datecreated;

        return $this;
    }

    /**
     * Get datecreated
     *
     * @return \DateTime
     */
    public function getDatecreated()
    {
        return $this->datecreated;
    }

    /**
     * Set salt
     *
     * @param string $salt
     *
     * @return user
     */
    public function setSalt($salt)
    {
        $this->salt = $salt;

        return $this;
    }

    /**
     * Get salt
     *
     * @return string
     */
    public function getSalt()
    {
        return $this->salt;
    }

    public function eraseCredentials() {
        
    }

    public function getRoles() {
        return array($this->getRole());
    }

    public function getUsername() {
        return $this->getEmail();
    }

    public function isAccountNonExpired() {
        return $this->getExpires();
    }

    public function isAccountNonLocked() {
        return $this->getLooked();
    }

    public function isCredentialsNonExpired() {
        return true;
    }

    public function isEnabled() {
        return $this->getEnable();
    }


    /**
     * Set enable
     *
     * @param boolean $enable
     *
     * @return user
     */
    public function setEnable($enable)
    {
        $this->enable = $enable;

        return $this;
    }

    /**
     * Get enable
     *
     * @return boolean
     */
    public function getEnable()
    {
        return $this->enable;
    }

    /**
     * Set looked
     *
     * @param boolean $looked
     *
     * @return user
     */
    public function setLooked($looked)
    {
        $this->looked = $looked;

        return $this;
    }

    /**
     * Get looked
     *
     * @return boolean
     */
    public function getLooked()
    {
        return $this->looked;
    }

    /**
     * Set expires
     *
     * @param boolean $expires
     *
     * @return user
     */
    public function setExpires($expires)
    {
        $this->expires = $expires;

        return $this;
    }

    /**
     * Get expires
     *
     * @return boolean
     */
    public function getExpires()
    {
        return $this->expires;
    }

    /**
     * Set phonenumber
     *
     * @param string $phonenumber
     *
     * @return user
     */
    public function setPhonenumber($phonenumber)
    {
        $this->phonenumber = $phonenumber;

        return $this;
    }

    /**
     * Get phonenumber
     *
     * @return string
     */
    public function getPhonenumber()
    {
        return $this->phonenumber;
    }

    /**
     * Set role
     *
     * @param string $role
     *
     * @return user
     */
    public function setRole($role)
    {
        $this->role = $role;

        return $this;
    }

    /**
     * Get role
     *
     * @return string
     */
    public function getRole()
    {
        return $this->role;
    }

    /**
     * Set codigovalidacion
     *
     * @param string $codigovalidacion
     *
     * @return user
     */
    public function setCodigovalidacion($codigovalidacion)
    {
        $this->codigovalidacion = $codigovalidacion;

        return $this;
    }

    /**
     * Get codigovalidacion
     *
     * @return string
     */
    public function getCodigovalidacion()
    {
        return $this->codigovalidacion;
    }

    /**
     * Add peliculasfavorita
     *
     * @param \coreBundle\Entity\pelicula $peliculasfavorita
     *
     * @return user
     */
    public function addPeliculasfavorita(\coreBundle\Entity\pelicula $peliculasfavorita)
    {
        $existe = false;
        if ($this->peliculasfavoritas != NULL){
            foreach ($this->peliculasfavoritas as $ae){
                if ($ae->getId() == $peliculasfavorita->getId()){
                    $existe = true;
                }
            }
        }
        if ($existe == false){
           $this->peliculasfavoritas[] = $peliculasfavorita;
        }
        return $this;
    }

    /**
     * Remove peliculasfavorita
     *
     * @param \coreBundle\Entity\pelicula $peliculasfavorita
     */
    public function removePeliculasfavorita(\coreBundle\Entity\pelicula $peliculasfavorita)
    {
        $this->peliculasfavoritas->removeElement($peliculasfavorita);
    }

    /**
     * Get peliculasfavoritas
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getPeliculasfavoritas()
    {
        return $this->peliculasfavoritas;
    }
}
