var rendicion=document.getElementById("rendicion");
var comision=document.getElementById("comision");
		function calcular(e){
      console.log("entro"+e.keyCode)
      if(rendicion.value!=''){
        var result = parseInt(rendicion.value)*0.25;
        if(e.keyCode==9){
            comision.value=result
        }
      }  
		}

rendicion.addEventListener("keypress",calcular)
