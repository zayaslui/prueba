var info = {
  nombre:"luis",
  apellido:"zayas",
  getNombre:function(n){
    return (n)?n:this.nombre;
  },
  getApellido:function(a){
    return (a)?a:this.apellido
  },
  getNombreCompleto:function(){
    console.log("me llamo "+info.getNombre()+" y mi apellido es "+info.getApellido());
  }
  
}

var accion = document.getElementById("accion_");
accion.addEventListener("click",info.getNombreCompleto);

  function executeFunctionByName(functionName, context , args ) {
  console.log(context)
  
  var args = [].slice.call(arguments).splice(2);
  console.log(args)
  var namespaces = functionName.split(".");
  console.log(namespaces)
  var func = namespaces.pop();
  console.log(func)
  accion.removeEventListener("click",context[func])
  //return context[func].apply(context, args);
  addToarray();
}
function addToarray(){
  
}

executeFunctionByName("info.getNombreCompleto", info);


