class Agente{
    var codigo
    var energia
    var orden_de_entrega = []
    var ubicacion
    const cantmax = 5
    const veripaque = {nuevo_paq => return orden_de_entrega.any({paquete => nuevo_paq == paquete})}
    const veridirecc = {nueva_ubi => return nueva_ubi == ubicacion}

    method ver_ubicacion(){
        return "Tu destino es : " + ubicacion.codigo()
    }
    
    method ver_energia(){
        return "Tu energia es : " + energia
    }
    
     method ver_codigo(){
        return codigo
    }

    method ver_orden(){
        return orden_de_entrega.map({paquete => paquete.ver_codigo()})
    } 
    
    method procesar_destino(){
    	const primerPaquete = orden_de_entrega.get(0)
		const destinoSiguiente = primerPaquete.ver_destinoobj()
		return self.desplazarse(destinoSiguiente)
    }

    method desplazarse(destino){
    	 if (veridirecc.apply(destino)){
    	 	return "Ya estoy ahi"
        }
         if(energia >= 1){
         	destino.agregar_agente(self)
         	ubicacion.irme(self)
            ubicacion = destino
            energia = energia -1
            return "Ya llegue al destino"
        }
        if(energia <= 1){
        	return "Necesito ir a al plaza para descanzar"
        }
        else{
            return "No tengo energia"
        }
       }
       
    method descansar(){
        if (ubicacion.codigo()== "plaza"){
            energia = energia + 5
            return "Termine de descansar, ya puedo seguir"
        }
        else{
        	return "No estoy en la plaza"
        }
    }
      
    method retirar_paquete(paquete){
    	if (veripaque.apply(paquete)){
    	 	return "Ya lo tengo"
        }
        if(orden_de_entrega.size() == cantmax){
            return "Ya estoy lleno"
        }
        if (ubicacion.codigo() != "deposito"){
            return "No estoy en el deposito"
        }
        orden_de_entrega.add(paquete)
           return "Paquete retirado"
      }
      
       method procesar_entrega(){
       	return orden_de_entrega.map({
       		paquete => 
       		if(paquete.ver_destinoobj() == ubicacion)
       			 self.entregar_paquete(paquete)
       			 else 
       			 return "No entregado"
       	})
    }
      	
      method entregar_paquete(paquete){
          if(ubicacion != paquete.ver_destinoobj()){
              return "El destino del paquete es incorrecto"
          }
          orden_de_entrega.remove(paquete)
          ubicacion.agregar_paquete(paquete)
          return "Paquete entregado"
      }
}    

class Destinos{
    var codigo
    var paquetes = []
    var agentes = []
    
    method codigo(){ 
        return codigo 
       } 
       
    method estado(){ 
       	return "Paquetes en el lugar: " + self.ver_paquetes() + " Agentes en el lugar: " + self.ver_agentes()
       }
       
    method agregar_paquete(paquete){
    	paquetes.add(paquete)
    }
    
     method agregar_agente(agente){
    	agentes.add(agente)
    }
    
    method ver_paquetes(){
    	 return paquetes.map({paquete => paquete.ver_codigo()})
    }
    
    method ver_agentes(){
    	 return agentes.map({agente => agente.ver_codigo()})
    }
    
    method irme(agente){
        agentes.remove(agente)
    }
}

class Paquete{
    var codigo
    var ubicacion
    var destino
    
    method ver_destino(){ 
        return destino.codigo()
    }
    method ver_destinoobj(){ 
        return destino
    }
    
    method ver_codigo(){ 
        return codigo
    }
}
