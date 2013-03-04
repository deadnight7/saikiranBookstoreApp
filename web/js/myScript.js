


$(document).ready(function (){
    $('#step1Feedback').hide();
    $('#step1Feedback1').hide();
    $('#targetPrev').hide();
    $('#step2Feedback').hide();
    $ ('#sort').click(function (){
        alert ($(this).attr('value')+" "+document.URL);
        location.loadOverlay(document.URL)
    });
    /*Company add*/
    
    $('#addProductNameBtn').click (function(){
        var companyName = $('#companyName').val();
        
        if (companyName == ""){
            $('#step1Feedback').html("Please enter in some Company Name");
            
            $('#step1Feedback').addClass("red");
            $('#step1Feedback').slideDown(700, function (){
                $('#step1Feedback').slideUp(5000, function (){
                        //location.reload();
                    });
            });
        }
        else {
            $.post('addCompany',{
                companyName:companyName
            }, function (data){
                //alert (" "+data);
                $('#step1Feedback').html(data);
                //location.reload();
                $('#step1Feedback').slideDown(700, function (){
                    $('#step1Feedback').slideUp(5000, function (){
                        if (data.indexOf('inserted', data.length-9)){
                            
                        //-----location.reload();
                        ////alert ("Ok Inserted");
                            var present = $('#company').html();
                            $('#company').html(present + '<option value="'+companyName+'">'+companyName+'</option>');
                        }
                    });
                });
            });
        }
    });
    
    /*Category add*/
    
    $('#addCategoryNameBtn').click (function(){
        var categoryName = $('#categoryName').val();
        
        if (categoryName == ""){
            $('#step2Feedback').html("Please enter in some Category Name");
            
            $('#step2Feedback').addClass("red");
            $('#step2Feedback').slideDown(700, function (){
                $('#step2Feedback').slideUp(5000, function (){
                        //location.reload();
                    });
            });
        }
        
        else {
            $.post('addCategory',{
                categoryName:categoryName
            }, function (data){
                //alert (" "+data);
                $('#step2Feedback').html(data);
                //location.reload();
                
                $('#step2Feedback').slideDown(700, function (){
                    $('#step2Feedback').slideUp(5000, function (){
                        //-----location.reload();
                        if (data.indexOf('inserted', data.length-9)){
                            
                        //-----location.reload();
                        ////alert ("Ok Inserted");

                            var present = $('#selectMenuCategory').html();
                            $('#selectMenuCategory').html(present + '<option value="'+categoryName+'">'+categoryName+'</option>');

                        }
                    });
                });
            });
        }
            $('#step2Feedback').removeClass("red");
    });
     
    /*Sub-Category add*/
    
    $('#addSubCategoryBtn').click (function(){
        var SubCategoryName = $('#SubCategoryName').val();
        
        var categoryName = $('#categoryName').val();
        
        if (categoryName == ""){
            categoryName = $('#selectMenuCategory').val();
        }
        
        if (SubCategoryName == "" || categoryName == ""){
            $('#step2Feedback1').html("Please enter in Sub Category Name or Select Category name");
            
            $('#step2Feedback1').addClass("red");
            $('#step2Feedback1').slideDown(700, function (){
                $('#step2Feedback1').slideUp(5000, function (){
                        location.reload();
                    });
            });
        }
        else {
            $.post('addSubCategory',{
                SubCategoryName:SubCategoryName,
                categoryName:categoryName
            }, function (data){
                //alert (" "+data);
                $('#step2Feedback1').html(data);
                //location.reload();
                $('#step2Feedback1').slideDown(700, function (){
                    $('#step2Feedback1').slideUp(5000, function (){
                        //-----location.reload();
                         if (data.indexOf('inserted', data.length-9)){
                            
                        //-----location.reload();
                        ////alert ("Ok Inserted");

                            var present = $('#selectMenuSubCategory').html();
                            $('#selectMenuSubCategory').html(present + '<option value="'+SubCategoryName+'">'+SubCategoryName+'</option>');

                        }
                    });
                });
            });
        }
            $('#step2Feedback1').removeClass("red");
    });
});
   