var rendicion=document.getElementById("rendicion");
var comision=document.getElementById("comision");
		function calcular(evt){
      
      var k = evt.keyCode ? evt.keyCode : evt.charCode;
      if(k==13){
                evt.keyCode = 9; evt.charCode = 9;         
                evt.preventDefault();
               }
      
      if(rendicion.value!=''){
        var result = parseInt(rendicion.value)*0.25;
        if(k===13){
            comision.value=result
        }
      }  
		}

rendicion.addEventListener("keypress",calcular)

