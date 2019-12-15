<?php

namespace coreBundle\Form;



use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Doctrine\ORM\EntityRepository;
use Symfony\Component\Validator\Constraints\Regex;
use Symfony\Component\Form\Extension\Core\Type\EmailType;

class peliculaType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('anio', IntegerType::class, array(
                'label' => 'Año',
                'required'=>true,
                "attr" => array("class" => "form-control required", 'min' => 1920,'max'=>2019)
            ))    
            ->add('nombre', TextType::class, array(
                'label' => 'Nombre',
                'required'=>true,
                "attr" => array("class" => "form-control", 'placeholder' => 'Nombre')
            ))
            
            ->add('director', TextType::class, array(
                'label' => 'Director',
                'required'=>false,
                "attr" => array("class" => "form-control", 'placeholder' => 'Director')
            ))
            ->add('descripcion', TextareaType::class, array(
                'label' => 'Descripción',
                'required'=>false,
                "attr" => array("class" => "form-control", 'placeholder' => 'Descripción')
            ))   
            ->add('actores', TextType::class, array(
                'label' => 'Actores',
                'required'=>false,
                "attr" => array("class" => "form-control", 'placeholder' => 'Actores')
            )) 
            
            
             
        ;
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'coreBundle\Entity\pelicula',
            'allow_extra_fields' => true
        ));
    }

    public function getName()
    {
        return 'pelicula';
    }
}
