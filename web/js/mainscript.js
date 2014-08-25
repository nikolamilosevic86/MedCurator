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
   //new_property
    $(document).on('click', ".new_property", function() {
         if(isInEdit===true){
            alert("Already in edit mode");
            return;
        }
        isInEdit = true;
        var newhtml = "<input style='width:70px' id='"+"-1"+"' class='edit_attr_name' type='text' placeholder='attribute' value=''><input style='width:50px' class='edit_attr_value'  id='-1' type='text' placeholder='value' value=''><input style='width:50px' class='edit_attr_unit'  id='-1' type='text' placeholder='unit' value=''><input id='-1' class='save_button' type='button' value='save'><input id='-1' type='button' class='cancel_button' value='cancel'><br/><br/>";
        $(this).parent().append(newhtml);
        $(this).remove();
        $(this).parent().append("<br/><br/><br/>");  
    }),
    
        $(document).on('click', ".new_arm", function() {
         if(isInEdit===true){
            alert("Already in edit mode");
            return;
        }
        isInEdit = true;
        var document_id = $(this).parent().attr("document_id");
        var newhtml = "<input style='width:70px' id='"+"-1"+"' document_id='"+document_id+"' class='edit_arm_name' type='text' placeholder='Arm name' value=''><input id='-1' class='arm_save_button' document_id='"+document_id+"' type='button' value='save'><input id='-1' type='button' class='cancel_button' value='cancel'><br/><br/>";
        $(this).parent().append(newhtml);
        $(this).remove();
        $(this).parent().append("<br/><br/><br/>");  
    }),
   
       $(document).on('click', "input.arm_delete_button", function() {
            if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
  	 xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
   	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function()
    {
   	if (xmlhttp.readyState==4 && xmlhttp.status==200)
     	{
     	 rstr =xmlhttp.responseText;
    	 location.reload();
     	}
   }
xmlhttp.open("POST","databaseEditor.jsp",true);
var ArmId = $(this).attr("id");
var parameters="table=Arm&type="+encodeURIComponent("delete")+"&ArmId="+encodeURIComponent(ArmId);
xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlhttp.setRequestHeader("Content-length", parameters.length);
xmlhttp.setRequestHeader("Connection", "close");

 xmlhttp.send(parameters);
       }),
       
        $(document).on('click', "input.delete_button", function() {
            if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
  	 xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
   	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function()
    {
   	if (xmlhttp.readyState==4 && xmlhttp.status==200)
     	{
     	 rstr =xmlhttp.responseText;
    	 location.reload();
     	}
   }
xmlhttp.open("POST","databaseEditor.jsp",true);
var id = $(this).attr("id");
var parameters="table=ArmProperty&type="+encodeURIComponent("delete")+"&id="+encodeURIComponent(id);
xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlhttp.setRequestHeader("Content-length", parameters.length);
xmlhttp.setRequestHeader("Connection", "close");

 xmlhttp.send(parameters);
       }),

    $(document).on('click', "input.save_button", function() {
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
  	 xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
   	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function()
    {
   	if (xmlhttp.readyState==4 && xmlhttp.status==200)
     	{
     	 rstr =xmlhttp.responseText;
    	 location.reload();
     	}
   }
xmlhttp.open("POST","databaseEditor.jsp",true);
var attribute_name = $(".edit_attr_name").val();
var attribute_val = $(".edit_attr_value").val();
var attribute_unit = $(".edit_attr_unit").val();
var ArmID = $(this).parent().attr("id");
var id = $(this).attr("id");
var command = "update";
if(id<0)
    command = "insert";
var parameters="table=ArmProperty&ArmId="+encodeURIComponent(ArmID)+"&type="+encodeURIComponent(command)+"&PropertyName="+encodeURIComponent(attribute_name)+"&PropertyValue="+encodeURIComponent(attribute_val)+"&PropertyUnit="+encodeURIComponent(attribute_unit)+"&id="+encodeURIComponent(id);
xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlhttp.setRequestHeader("Content-length", parameters.length);
xmlhttp.setRequestHeader("Connection", "close");

 xmlhttp.send(parameters);
    }),
    
     $(document).on('click', "input.arm_save_button", function() {
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
  	 xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
   	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function()
    {
   	if (xmlhttp.readyState==4 && xmlhttp.status==200)
     	{
     	 rstr =xmlhttp.responseText;
    	 location.reload();
     	}
   }
xmlhttp.open("POST","databaseEditor.jsp",true);
var arm_name = $(".edit_arm_name").val();
var ArmID = $(this).attr("id");
var document_id = $(this).attr("document_id");
var command = "update";
if(ArmID<0)
    command = "insert";
var parameters="table=Arm&ArmId="+encodeURIComponent(ArmID)+"&type="+encodeURIComponent(command)+"&DocumentID="+encodeURIComponent(document_id)+"&ArmName="+encodeURIComponent(arm_name);
xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlhttp.setRequestHeader("Content-length", parameters.length);
xmlhttp.setRequestHeader("Connection", "close");

 xmlhttp.send(parameters);
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
        var newhtml = "<input style='width:70px' id='"+liId+"' class='edit_attr_name' type='text' placeholder='attribute' value='"+attribute+"'><input style='width:50px' class='edit_attr_value'  id='"+liId+"' type='text' placeholder='value' value='"+value+"'><input style='width:50px' class='edit_attr_unit'  id='"+liId+"' type='text' placeholder='unit' value='"+unit+"'><input id='"+liId+"' class='save_button' type='button' value='save'><input id='"+liId+"' type='button' class='cancel_button' value='cancel'><input id='"+liId+"' type='button' class='delete_button' value='delete'><br/><br/>";
        $(this).html(newhtml);
        $(this).parent().append("<br/><br/><br/>");        
}),
    $(document).on('click', "li.arm", function() {
        if(isInEdit===true){
            alert("Already in edit mode");
            return;
        }
        isInEdit = true;
        var ArmId = $(this).attr("id");
        var DocumentId = $(this).attr("document_id");
        $(this).removeClass("arm");
        var armname = $(this).text();
        var newhtml = "<input style='width:120px' id='"+ArmId+"' document_id='"+DocumentId+"' class='edit_arm_name' type='text' placeholder='Arm Name' value='"+armname+"'><input id='"+ArmId+"' document_id='"+DocumentId+"' class='arm_save_button' type='button' value='save'><input id='"+ArmId+"' document_id='"+DocumentId+"' type='button' class='cancel_button' value='cancel'><input id='"+ArmId+"' document_id='"+DocumentId+"' type='button' class='arm_delete_button' value='delete'><br/><br/>";
        $(this).html(newhtml);
        $(this).parent().append("<br/><br/><br/>");        
})
        
        );
      