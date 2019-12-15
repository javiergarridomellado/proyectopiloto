
var convert = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
               "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
                "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"];
            
$('document').ready(function(){
    fecha_devolucion();
    fecha_recogida();
   calcularTotal();
});

function fecha_devolucion(){
    fechadevolucion = $('#fechaEstimadaDevolucion').val();
    $('.fechadevolucion').val(fechadevolucion);
}
function fecha_recogida(){
   fecharecogida =  $('#fechaRecogida').val();
   $('.fechaentrega').val(fecharecogida);
}
$('#fechaEstimadaDevolucion').on('change', function(){
    var dias = calcularDiasPedido();
    var diasMinimosPedido = $('#diasMinimos').val();
    fecha_devolucion();
    //if (dias != 0 && dias < diasMinimosPedido){
    if(dias <= 0){
        $('#modalDias').modal();
        $('#fechaEstimadaDevolucion').val('');
        setTimeout(function() {$('#modalDias').modal('hide');}, 2000);
        var from = Date.parseDate($('#fechaRecogida').val(), "d/m/Y");
        from.setDate(from.getDate()); 
        var fecha2 = convert[from.getDate()] + "/" + convert[from.getMonth()] + "/" + from.getFullYear();
        $('.fechadevolucion').val(fecha2);
        $('#fechaEstimadaDevolucion').val(fecha2);
    }
    recalcularDias();
    calcularTotal();
});



$('#fechaRecogida').on('change', function(){
    var dias = calcularDiasPedido();
    var diasMinimosPedido = $('#diasMinimos').val();
    fecha_recogida();
    //if (dias != 0 && dias < diasMinimosPedido){
    if(dias <= 0){
        $('#fechaEstimadaDevolucion').val('');
        $('#modalDias').modal();
        setTimeout(function() {$('#modalDias').modal('hide');}, 2000);
        var from = Date.parseDate($('#fechaRecogida').val(), "d/m/Y");
        from.setDate(from.getDate()); 
        var fecha2 = convert[from.getDate()] + "/" + convert[from.getMonth()] + "/" + from.getFullYear();
        $('.fechadevolucion').val(fecha2);
        $('#fechaEstimadaDevolucion').val(fecha2);
    } 
    recalcularDias();
    calcularTotal();
});

$('.cantidad').on('change', function(){
    calcularTotal();
});

function calcularDiasPedido(){
    var fechaEntrega = $('#fechaRecogida').val();
    var fechaEstimadaDevolucion = $('#fechaEstimadaDevolucion').val();
    var dias = 0;
    if (fechaEntrega && fechaEstimadaDevolucion){
        var dEntre = Date.parseDate(fechaEntrega, "d/m/Y");
        var dEstima = Date.parseDate(fechaEstimadaDevolucion, "d/m/Y");
        if (dEntre && dEstima){
            var fecha1 = Date.UTC(dEntre.getFullYear(),dEntre.getMonth(),dEntre.getDate()); 
            var fecha2 = Date.UTC(dEstima.getFullYear(),dEstima.getMonth(),dEstima.getDate());
            var dif = fecha2 - fecha1;
            dias = Math.floor(dif / (1000 * 60 * 60 * 24));
        }        
    }
    return dias;
}



function calcularTotal(){
    var diasPedido = calcularDiasPedido();
    $('#diasPedido').val(diasPedido);
    if (!diasPedido){
        $('#diasPedido').val(1);
        diasPedido = 1;
    }
    
    var total = 0;
    var subtotal = 0;
    var subtotalacumulado = 0;
    var ivaacumulado = 0;
    var baseacumulada = 0;
    var fianzas = 0;
    var precioDesgaste = 0;
    var desc = 0;
    var descuentoAcumulado = 0;
    for(i=1 ; i<=numProductos ; i++){
        subtotal = 0;
        precioDesgaste = 0;
        var lCant = parseFloat($('#cantidad' + i).val());
        var lPrecio = parseFloat($('#precio' + i).val());
        if (lCant && lPrecio){
            var lFia = parseFloat($('#fianza' + i).val());
            var lDesc31 = parseFloat($('#descuento31' + i).val());
            var lDesc37 = parseFloat($('#descuento37' + i).val());
            var lDesc830 = parseFloat($('#descuento830' + i).val());
            var lDesgaste = $('#desgaste' + i).val();
            var lPrecioDesg = parseFloat($('#precioDesgaste' + i).val());
            var lTipo = $('#tipo' + i).val();
            var lEntr = parseFloat($('#entrega' + i).val());
            var lDev = parseFloat($('#devolucion' + i).val());
            var lTempoR = parseFloat($('#impTem' + i).val());
            var lCargoR = parseFloat($('#cargoR' + i).val());
            var lSuci = parseFloat($('#suciedad' + i).val());
            var iva = parseFloat($('#iva' + i).val());
            var ivarec = parseFloat($('#ivarec' + i).val());
            subtotal = lCant * lPrecio;
            
            if (lTipo == 1){
                fianzas += lFia;
                if (lDesgaste == "true"){
                    if (lEntr && lDev){
                        precioDesgaste = lPrecioDesg * (lEntr - lDev);
                    }
                }
                var diaTemporal = parseInt($('#dias' + i).val());
                if (diaTemporal && diaTemporal > 0){
                    diasPedido = diaTemporal;
                }
                subtotal = subtotal * diasPedido;
                desc = 0;
                if (diasPedido >= 3 && diasPedido <7 && lDesc37){
                    desc = lDesc37 / 100;
                }else if(diasPedido >= 7 && diasPedido <= 30 && lDesc830){
                    desc = lDesc830 / 100;
                }else if(diasPedido >= 31 && lDesc31){
                    desc = lDesc31 / 100;
                }
                // Se calcula el subtotal acumulado
                subtotalacumulado += subtotal;
                // Se calcula el descuento de la linea
                desc = subtotal * desc;
                
                // Se suma el descuento
                descuentoAcumulado += desc;
                
                //subtotal -= desc;
                if (lTempoR){
                    subtotal += lTempoR;                    
                }else if (lCargoR){
                    subtotal += lCargoR;
                }
                if ($('#sucia' + i).is(':checked')){
                    if (lSuci){
                        subtotal += lSuci;
                    }
                }
                
                subtotal += precioDesgaste;
                
                var sumiva = subtotal - desc;
                ivaacumulado += (iva/100) * sumiva;
                baseacumulada += sumiva;
            }
            $("#tdTotal" + i).html(subtotal.toFixed(2) + " €");
        }
    }
    
    var baserecargos = 0;
    
    var recarDEV = parseFloat($('#recargoEntrega').val());
    if (recarDEV){
        baserecargos += recarDEV;
        $('#recarDev').html(recarDEV.toFixed(2) + " €");
    }
    
    if ($('#servicioExpress').is(':checked')){
        var recExpres = parseFloat($('#inputRecargoExpress').val());
        if (recExpres){
            baserecargos += recExpres;
        }
        if (!$('.tdServicioExpress').is(":visible")){
            $('.tdServicioExpress').toggle();
        }
    }else{
        $('.tdServicioExpress').hide();        
    }
    
    if ($('#serviciodomicilio').is(':checked')){
        var recExpres = parseFloat($('#inputRecargoDomicilio').val());
        if (recExpres){
            baserecargos += recExpres;
        }
        if (!$('.tdServicioDomicilio').is(":visible")){
            $('.tdServicioDomicilio').toggle();
        }
        $('.divdireccion').css("display", "inline-block");
    }else{
        $('.tdServicioDomicilio').hide();
        $('.divdireccion').css("display", "none");  
        $('#direccion').val("");
        $('#cp').val("");
        $('#localidad').val("");
        $('#provincia').val("");
    }
    $('#totalFianza').html(fianzas.toFixed(2) + " €");
    $('#totalDescuento').html(descuentoAcumulado.toFixed(2) + " €");
    
    var recargo1 = parseFloat($('#recargo1').val());
    var recargo2 = parseFloat($('#recargo2').val());
    var recargo3 = parseFloat($('#recargo3').val());
    var rangoinferior = parseFloat($('#rangoinferior').val());
    var rangointermedioinf = parseFloat($('#rangointermedioinf').val());
    var rangointermediosup = parseFloat($('#rangointermediosup').val());
    var rangosuperior = parseFloat($('#rangosuperior').val());
    
    if (baseacumulada >= rangosuperior){
        $('#recargodistribuidor').html(recargo3.toFixed(2) + " €");
        if (recargo3 == 0){
            $('#cargologistico').css("display", "none");            
        }
        baserecargos += recargo3;
    }else if (baseacumulada >= rangointermedioinf && baseacumulada < rangointermediosup){
        $('#recargodistribuidor').html(recargo2.toFixed(2) + " €");
        if (recargo2 == 0){
            $('#cargologistico').css("display", "none");            
        }
        baserecargos += recargo2;        
    }else if (baseacumulada < rangoinferior){
        $('#recargodistribuidor').html(recargo1.toFixed(2) + " €");
        if (recargo1 == 0){
            $('#cargologistico').css("display", "none");            
        }
        baserecargos += recargo1;        
    }else{
        $('#cargologistico').css("display", "none");
        $('#recargodistribuidor').html("0 €");        
    }
    
    // Se obtiene el iva por defecto 
    var ivadefecto = parseFloat($('#ivadefecto').val());
    if (!ivadefecto || ivadefecto === 0){
        ivadefecto = 21;
    }
    
    var ivarecargos = baserecargos * (ivadefecto / 100);  
    
    console.log("BASE: " + baseacumulada + " " + baserecargos);  
    console.log("IVA: " + ivaacumulado + " " + ivarecargos);
    
    baseacumulada = baseacumulada + baserecargos;
    ivaacumulado = ivaacumulado + ivarecargos;
    
    total = baseacumulada + ivaacumulado;
    
    var apagar = total + fianzas;
    
    $('#suma').html(subtotalacumulado.toFixed(2) + " €");
    $('#totalDescuento').html(descuentoAcumulado.toFixed(2) + " €");
    $('#base').html(baseacumulada.toFixed(2) + " €");
    $('#baseinput').val(baseacumulada.toFixed(2));
    $('#iva').html(ivaacumulado.toFixed(2) + " €");
    $('#ivainput').val(ivaacumulado.toFixed(2));
    $('#totalSuma').html(total.toFixed(2) + " €");
    $('#totalSumainput').val(total.toFixed(2));
    $('#totalFianza').html(fianzas.toFixed(2) + " €");
    $('#totalFianzainput').val(fianzas.toFixed(2));
    $('#totalConFianza').html(apagar.toFixed(2) + " €");
    $('#totalConFianzainput').val(apagar.toFixed(2));
    $('#numProductosRellenos').val(numProductos);
}


function recalcularDias(){
    var maximo = 0;
    console.log("Recallar dias");
    var fecha = $('#fechaEstimadaDevolucion').val();
    var fechaEntr = $('#fechaRecogida').val();
    var d = calcularDiasFecha(fechaEntr, fecha);
    console.log('numeroproductos '+numProductos);
    for (var i=1 ; i<= numProductos ; i++){
        // Se calcula el numero de días
        if (d >= 0){
            // Se compara con los días mínimos
            var diasmin = parseInt($('#diasminimos' + i).val());
            if (diasmin){
                if (diasmin >= d){
                    d = diasmin;
                    $('#etiquetadiasminimos' + i).css("display", "block");
                }else{
                    $('#etiquetadiasminimos' + i).css("display", "none");                    
                }
            }          
            $('#dias' + i).val(d);
            if (d > maximo){
                maximo = d;
            }
        }else{
            $('#dias' + i).val(0);            
        }
    }
    $('#diasPedido').val(maximo);
    calcularTotal(); 
}

function calcularDiasFecha(fechaAnterior, fechaSiguiente){
    var dias = 0;
    if (fechaAnterior && fechaSiguiente){
        var dEntre = Date.parseDate(fechaAnterior, "d/m/Y");
        var dEstima = Date.parseDate(fechaSiguiente, "d/m/Y");
        //var dReal = Date.parseDate(fechaDevolucion, "d/m/Y");
        
        var fecha1 = Date.UTC(dEntre.getFullYear(),dEntre.getMonth(),dEntre.getDate()); 
        var fecha2 = Date.UTC(dEstima.getFullYear(),dEstima.getMonth(),dEstima.getDate());
        var dif = fecha2 - fecha1;
        dias = Math.floor(dif / (1000 * 60 * 60 * 24));
    }
    return dias;
}

$('.borrarLinea').on('click', function(){
    var num= $(this).attr("id");
    $('#borrarLinea').modal();
    $('.eliminarlinea').on('click', function(){
        limpiarValores(num);
        calcularTotal();
        $('#borrarLinea').modal('hide');
    });    
});
function limpiarValores(num){
    var idproducto =  $('#idProducto' + num).val();
    $('#idProducto' + num).val("");
    $('#codigo' + num).val("");
    $('#fianza' + num).val("");
    $('#descuento31' + num).val("");
    $('#descuento37' + num).val("");
    $('#descuento830' + num).val("");
    $('#descuento830' + num).val("");
    $('#desgaste' + num).val("");
    $('#precioDesgaste' + num).val("");
    $('#tipoDesgaste' + num).val("");
    $('#tdNombre' + num).html("");
    $('#tdPrecio' + num).html("");
    $('#precio' + num).val("");
    $('#tipo' + num).val("");
    $('#dias' + num).val("");    
    $('#tdDesgaste' + num  + " .texto").html("");
    $('#tdDesgaste' + num + ' .mostrarDesgaste').css("display", "none");
    $('#tdSuciedad' + num + ' label').css("display", "none");
    $('#tdSuciedad' + num + ' input').css("display", "none");
    $('#tdRotura' + num + ' .mostrarRotura').css("display", "none");
    $('#tdimagen' + num + '').html("");
    $('#tdTotal' + num).html("");
    $('#tdFianza' + num).html("");
    $('#suciedad' + num).val("");
    $('.divRoturas' + num).val("");
    $('#codigo' + num).focus();
    $('#linea'+ num).remove();
    $.ajax({
        url: urlEliminarProducto,
        data:  {'idProducto': idproducto},
        type: "POST", 
        success:function(result){
            if (result != ""){
                var obj = JSON.parse(result);
                $('#articulosTotal').html("( " + obj.numeroProductos + " )");
                console.log(obj.numeroProductos);
            }
        }
    });
}



