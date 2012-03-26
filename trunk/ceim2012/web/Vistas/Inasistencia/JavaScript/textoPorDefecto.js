$(function() {
    $('#nombreCaso').focus(function(){
        if($(this).attr("value") == 'Desorden en salon de clases') $(this).attr("value", "");
    });
   $('#nombreCaso').blur(function(){
        if($(this).val() == "") $(this).html("<i>"+$(this).attr("value", "Desorden en salon de clases")+"</i>");
    });
});