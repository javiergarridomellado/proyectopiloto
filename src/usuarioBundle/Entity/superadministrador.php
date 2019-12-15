<?php

namespace usuarioBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * superadministrador
 *
 * @ORM\Table(name="superadministrador")
 * @ORM\Entity(repositoryClass="usuarioBundle\Repository\superadministradorRepository")
 */
class superadministrador extends user{
    public function __construct() {
        parent::__construct();
        $this->setRole("ROLE_SUPER_ADMIN");
    }
}
