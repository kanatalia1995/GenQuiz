function validateText(id){
	if ($("#"+id).val()==null || $("#"+id).val()==""){
		var div = $("#"+id).closest("div");
		div.addClass("has-error");
			//alert(id+"Error de validación")
		return false;
	}
	else{
		var div = $("#"+id).closest("div");
		div.removeClass("has-error");
		return true;
	}
};

function validarLogIn(){
	$("#bLogIn").click(function(){
		if(!validateText("correo")){
			return false;
		}
		if(!validateText("contrasena")){
			return false;
		}
		$("form#formularioIngreso").submit();
	});
};

/*
$('.tree-toggle').click(function () {
	$(this).parent().children('ul.tree').toggle(200);
});
$(function(){
	$('.tree-toggle').parent().children('ul.tree').toggle(200);
})*/