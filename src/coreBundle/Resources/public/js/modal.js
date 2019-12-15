function bindmodal(){
    $('.eliminar').unbind("click").bind("click", function(e){
        e.preventDefault();
        var url = $(this).attr("href");
        $('#btnborrar').attr("href", url);
        $('#modalborrar').modal('toggle');
    });

    $('.close').unbind("click").bind("click", function(e){
        e.preventDefault();
        $('#modalborrar').modal('toggle');
    });
    $('#closemodal').unbind("click").bind("click", function(e){
        e.preventDefault();
        $('#modalborrar').modal('toggle');
    });
}

bindmodal();