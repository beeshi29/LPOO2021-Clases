class Agente{
	var codigo
	var energia
	var orden_de_entrega = []
	var ubicacion
	
	method desplazarse(destino){
		if(energia >= 2){
			ubicacion = destino
			
			energia = energia - 1
			
			}
			else{
				ubicacion = plaza
			}
		
		}
	method descansar(plaza){
		if (ubicacion == plaza){
			energia = energia + 5
			return "estoy_bien"
		}
	 	else{
	 		return "necesito_descansar"
	 	}
	}			
}

class Destinos{
	var codigo
	
	method codigo(){ 
               return codigo 
        }	
}
const agente1 = new Agente(codigo = "a_1", energia = 4, ubicacion = plaza)
const plaza = new Destinos(codigo = "b" )
