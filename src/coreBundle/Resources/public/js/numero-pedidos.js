$(document).ready( function() {
   $.ajax({
        url: urlNumeroPedidos,
        type: "POST", 
        success:function(result){
            if (result != ""){
               var obj = JSON.parse(result);
               $('#pedpendientes').html("(" + obj.alquilados+ ")");
               $('#pedpendientes').html("(" + obj.pendientes + ")");
               $('#pedenviados').html("(" + obj.enviados + ")");
               $('#pedalquilados').html("(" + obj.alquilados + ")");
               $('#pedrecogidas').html("(" + obj.recogidas + ")");
               $('#pedcancelados').html("(" + obj.cancelados + ")");
               $('#pedhistorico').html("(" + obj.cerrados + ")");
               $('#pedtodos').html("(" + obj.todos + ")");
               $('#peddistribuidores').html("(" + obj.distribuidores + ")");
            }
        }
    });
});