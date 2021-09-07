class Agente{
    var codigo
    var energia
    var orden_de_entrega = []
    var ubicacion
    const cantmax = 5
    
    method verubic(){
        return ubicacion
    }

    method verorden(){
        return orden_de_entrega
    } 

    method desplazarse(destino){
        if(energia >= 2){
            ubicacion = destino
            energia = energia -1
            return "Llegue"
        }
        else{
            return "Necesito ir a al plaza para descanzar"
        }
    }
       
    method descansar(){
        if (energia < 2){
            ubicacion = "plaza"
            energia = energia + 5
            return "Ya termine de descanzar, puedo seguir"
        }
        else{
            return "Aun tengo energia de sobra"
           }
    }
      
    method retirar_paquete(paquete){
        if(orden_de_entrega.size() == cantmax){
            return "Ya estoy lleno"
        }
        if (ubicacion != deposito){
            return "No estas en el deposito"
        }
        orden_de_entrega.add(paquete)
           return "Paquete retirado"
      }
}    

class Destinos{
    var codigo
    
    method codigo(){ 
        return codigo 
       }    
}

class Paquete{
    var codigo
    var ubicacion
    var destino
    
    method ver_destino(){ 
        return destino
    }
}

const deposito = new Destinos(codigo = "de")
const plaza = new Destinos(codigo = "pl")
const casa1 = new Destinos(codigo = "c1")
const casa2 = new Destinos(codigo = "c2")
const casa3 = new Destinos(codigo = "c3")
const agente1 = new Agente(codigo = "a1", energia = 4, ubicacion = deposito)
const agente2 = new Agente(codigo = "a2", energia = 4, ubicacion = deposito)
const agente3 = new Agente(codigo = "a3", energia = 4, ubicacion = deposito)
const paquete1 = new Paquete(codigo = "p1", ubicacion = deposito, destino = casa1)
const paquete2 = new Paquete(codigo = "p2", ubicacion = deposito, destino = casa2)
const paquete3 = new Paquete(codigo = "p3", ubicacion = deposito, destino = casa1)
const paquete4 = new Paquete(codigo = "p4", ubicacion = deposito, destino = casa1)
const paquete5 = new Paquete(codigo = "p5", ubicacion = deposito, destino = casa3)
const paquete6 = new Paquete(codigo = "p6", ubicacion = deposito, destino = casa3)
jbkklhlkbklblkgkhhlhkljlk;hklhlkhlkhlj
