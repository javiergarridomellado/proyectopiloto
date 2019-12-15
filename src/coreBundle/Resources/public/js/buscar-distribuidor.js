$('.distribuidorView').click(function(e){
   e.preventDefault();
   var id = $(this).attr("id");
   $('#modalDistribuidor').modal();
   $.ajax({
        url: urlBuscardistribuidor,
        data:  {'iddistribuidor': id},
        type: "POST", 
        success:function(result){
            if (result != ""){
                $('.fichaDistribuidor').html(result);
            }
        }
    });
});

$('#closemodalficha').click(function(e){
   e.preventDefault();
   $('#modalDistribuidor').modal("hide");
});

$('#btnSeleccionarficha').click(function(e){
   e.preventDefault();
   $('#modalDistribuidor').modal("hide");
});

$('.usuarioView').click(function(e){
   e.preventDefault();
   var id = $(this).attr("id");
   $('#modalCliente').modal();
   $.ajax({
        url: urlBuscarcliente,
        data:  {'iduser': id},
        type: "POST", 
        success:function(result){
            if (result != ""){
                $('.fichacliente').html(result);
            }
        }
    });
});

$('#closemodalfichacliente').click(function(e){
   e.preventDefault();
   $('#modalCliente').modal("hide");
});

$('#btnSeleccionarfichacliente').click(function(e){
   e.preventDefault();
   $('#modalCliente').modal("hide");
});