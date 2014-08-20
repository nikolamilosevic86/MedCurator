/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var isInEdit = false;

$(
       $(document).on('click', "input.cancel_button", function() {
        location.reload();
        
   }),

    $(document).on('click', "div.arm_property", function() {
        if(isInEdit===true){
            alert("Already in edit mode");
            return;
        }
        isInEdit = true;
        var liId = $(this).attr("id");
        $(this).removeClass("arm_property");
        var attribute = $(this).find("#property_name").text();
        var value = $(this).find("#property_val").text();
        var unit = $(this).find("#property_unit").text();
        var newhtml = "<input style='width:70px' id='"+liId+"' type='text' placeholder='attribute' value='"+attribute+"'><input style='width:50px'  id='"+liId+"' type='text' placeholder='value' value='"+value+"'><input style='width:50px'  id='"+liId+"' type='text' placeholder='unit' value='"+unit+"'><input id='"+liId+"' type='button' value='save'><input id='"+liId+"' type='button' class='cancel_button' value='cancel'><input id='"+liId+"' type='button' value='delete'><br/><br/>";
        $(this).html(newhtml);
        $(this).parent().append("<br/><br/><br/>");        
})
        
        );
      