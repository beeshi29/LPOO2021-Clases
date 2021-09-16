class Agente{
    var codigo
    var energia
    var orden_de_entrega = []
    var ubicacion
    const cantmax = 5
    const veripaque = {nuevo_paq => return orden_de_entrega.any({paquete => nuevo_paq == paquete})}
    const veridirecc = {nueva_ubi => return nueva_ubi == ubicacion}

    method ver_ubicacion(){
        return ubicacion.codigo()
    }
    
    method ver_energia(){
        return energia
    }
    
     method ver_codigo(){
        return codigo
    }

    method ver_orden(){
        return orden_de_entrega.map({paquete => paquete.ver_codigo()})
    } 

    method desplazarse(destino){
    	 if (veridirecc.apply(destino)){
    	 	return "Ya estoy ahi"
        }
         if(energia >= 2){
         	destino.agentes_en_el_lugar(self.ver_codigo())
         	ubicacion.irme(self.ver_codigo()) //landi
            ubicacion = destino
            energia = energia -1
            return "Llegue"
        }
        else{
            return "Necesito ir a al plaza para descanzar"
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
        if (ubicacion != deposito){
            return "No estoy en el deposito"
        }
        orden_de_entrega.add(paquete)
           return "Paquete retirado"
      }
      
      method entregar_paquete(paquete){
          if(ubicacion != paquete.ver_destino()){
              return "El destino del paquete es incorrecto"
          }
          
          orden_de_entrega.remove(paquete)
          ubicacion.paquetes_entregados(paquete)
          return "Paquete entregado"
      }
}    

class Destinos{
    var codigo
    var paquetes_entregados = []
    var agentes_ahi = []
    
    method codigo(){ 
        return codigo 
       } 
       
    method estado(){ 
       	return "Paquetes entregados: " + paquetes_entregados + " Agentes en el lugar: " + agentes_ahi
       }
       
    method paquetes_entregados(paquete){
    	paquetes_entregados.add(paquete.ver_codigo())
    	return paquete
    }
    
     method agentes_en_el_lugar(agente){
    	agentes_ahi.add(agente)
    	return agente
    }
    
    method irme(agente){
    	agentes_ahi.remove(agente)
    }
}

class Paquete{
    var codigo
    var ubicacion
    var destino
    
    method ver_destino(){ 
        return destino
    }
    
    method ver_codigo(){ 
        return codigo
    }
}

const deposito = new Destinos(codigo = "deposito")
const plaza = new Destinos(codigo = "plaza")
const casa1 = new Destinos(codigo = "casa 1")
const casa2 = new Destinos(codigo = "casa 2")
const casa3 = new Destinos(codigo = "casa 3")
const agente1 = new Agente(codigo = "agente 1", energia = 4, ubicacion = deposito)
const agente2 = new Agente(codigo = "agente 2", energia = 4, ubicacion = deposito)
const agente3 = new Agente(codigo = "agente 3", energia = 4, ubicacion = deposito)
const paquete1 = new Paquete(codigo = "paquete 1", ubicacion = deposito, destino = casa1)
const paquete2 = new Paquete(codigo = "paquete 2", ubicacion = deposito, destino = casa2)
const paquete3 = new Paquete(codigo = "paquete 3", ubicacion = deposito, destino = casa1)
const paquete4 = new Paquete(codigo = "paquete 4", ubicacion = deposito, destino = casa1)
const paquete5 = new Paquete(codigo = "paquete 5", ubicacion = deposito, destino = casa3)
const paquete6 = new Paquete(codigo = "paquete 6", ubicacion = deposito, destino = casa3)
