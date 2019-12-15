<?php

namespace usuarioBundle\Form;



use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Doctrine\ORM\EntityRepository;
use Symfony\Component\Validator\Constraints\Regex;
use Symfony\Component\Form\Extension\Core\Type\EmailType;

class usuariowebType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('fullname', TextType::class, array(
                'label' => 'Nombre',
                'required'=>true,
                "attr" => array("class" => "form-control required", 'placeholder' => 'Nombre')
            ))    
            ->add('lastname', TextType::class, array(
                'label' => 'Apellidos',
                'required'=>false,
                "attr" => array("class" => "form-control", 'placeholder' => 'Apellidos')
            ))
            
            ->add('phonenumber', TextType::class, array(
                'label' => 'Teléfono',
                'required'=>false,
                "attr" => array("class" => "form-control", 'placeholder' => 'Teléfono')
            ))
            ->add('country', TextType::class, array(
                'label' => 'País',
                'required'=>false,
                "attr" => array("class" => "form-control", 'placeholder' => 'País')
            ))   
            ->add('city', TextType::class, array(
                'label' => 'Ciudad',
                'required'=>false,
                "attr" => array("class" => "form-control", 'placeholder' => 'Ciudad')
            )) 
            ->add('address', TextType::class, array(
                'label' => 'Dirección',
                'required'=>false,
                "attr" => array("class" => "form-control", 'placeholder' => 'Dirección')
            ))   
            ->add('postalcode', TextType::class, array(
                'label' => 'Código postal',
                'required'=>false,
                "attr" => array("class" => "form-control", 'placeholder' => 'Código postal')
            ))     
            ->add('email', EmailType::class, array(
                'label' => 'Email (username)',
                'required'=>true,
                "attr" => array("class" => "form-control required", 'placeholder' => 'Email')
            ))    
            ;    
            if (isset($options["attr"]["password"]) && $options["attr"]["password"] == false){              
                $builder->add('password', RepeatedType::class, array(
                        'type' => PasswordType::class,
                        'invalid_message' => 'Introduzca la contraseña',
                        'options' => array('attr' => array('class' => 'password-field')),
                        'required' => false,
                        'first_options'  => array('label' => 'Contraseña', "attr" => array("class" => "form-control",'placeholder'=> 'Contraseña')),
                        'second_options' => array('label' => 'Repita contraseña', "attr" => array("class" => "form-control",'placeholder'=> 'Repita contraseña')),
                    ));
            }else{
                $builder->add('password', RepeatedType::class, array(
                        'type' => PasswordType::class,
                        'invalid_message' => 'Introduzca la contraseña',
                        'options' => array('attr' => array('class' => 'password-field')),
                        'required' => true,
                        'first_options'  => array('label' => 'Contraseña', "attr" => array("class" => "form-control required",'placeholder'=> 'Contraseña')),
                        'second_options' => array('label' => 'Repita contraseña', "attr" => array("class" => "form-control required",'placeholder'=> 'Repita contraseña')),
                    ));
            }
            
             
        ;
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'usuarioBundle\Entity\userweb',
            'allow_extra_fields' => true
        ));
    }

    public function getName()
    {
        return 'userweb';
    }
}
