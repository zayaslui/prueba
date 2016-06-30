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

function aa(){
			var entrada = document.getElementById("entrada");
			var str = entrada.value;
			console.log("probando..."+str);
			
			var hr = new XMLHttpRequest();
			var url = "respuesta.php";
			var vars = "entrada="+str;
			hr.open("POST", url, true);
			
			hr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			
			hr.onreadystatechange = function() {
				if(hr.readyState == 4 && hr.status == 200) {
					var return_data = hr.responseText;
					document.getElementById("respuesta").innerHTML = return_data;
				}
			}
			
			hr.send(vars);
			
		}
