$(document).ready(function (){
    $('#selectMenuCategory').click (function (){
        var category = $(this).attr("value");
        //alert (" "+category);
        $.get('getSubCategory', { category:category }, function (data){
                $('#selectMenuSubCategory').html(data);
        })
    });
});