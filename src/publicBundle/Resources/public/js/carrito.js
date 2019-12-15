$('.aniadir').on('click', function(){
    $('#tituloModal').html("Se agregó correctamente el producto");
   var id = parseInt($(this).attr('id'));
   $.ajax({
        url: urlAniadirProducto,
        data:  {'idProducto': id},
        type: "POST", 
        success:function(result){
            if (result != ""){
                var obj = JSON.parse(result);
                $('#articulosTotal').html("( " + obj.numeroProductos + " )");
                // Reemplazamos el aniadir para procesarlo de forma distinta
                var r = obj.relacionados.replace(/aniadir/g, 'aniadir2');
                $('#divrelacionados').html(r);
                $('#modalAdd').modal();
                
                if (obj.numrelacionados > 0){
                    $('#tituloModal').html("Productos relacionados");
                    $('.aniadir2').unbind('click').bind('click', function(){
                        var id = parseInt($(this).attr('id'));
                        $.ajax({
                             url: urlAniadirProducto,
                             data:  {'idProducto': id},
                             type: "POST", 
                             success:function(result){
                                 if (result != ""){
                                     var obj = JSON.parse(result);
                                    $('#modalAdd2').modal();
                                     $('#articulosTotal').html("( " + obj.numeroProductos + " )");
                                     setTimeout(function() {$('#modalAdd2').modal('hide');}, 2000);
                                 }
                             }
                         });
                     });
                }else{
                    $('#tituloModal').html("Se agregó correctamente el producto");
                    setTimeout(function() {$('#modalAdd').modal('hide');}, 2000);
                }
            }
        }
    });
});

