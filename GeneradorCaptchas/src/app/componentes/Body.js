import { Componente } from "./Componente";

export class Body extends Componente{
    background; 

    /**
     * Establece un parametro del componente.
     * @param {String} parametro - Nombre del parametro en mayusculas que se desea establecer.
     * @param {String} valor - Valor del parametro que se desea establecer.
     * 
     * @throws {Error} Error semantico, si se desea establecer un parametro que no es valido para el componente.
     */
    establecerParametro(parametro, valor){
        switch(parametro){
            case 'BACKGROUND': 
                if(this.background == undefined){
                    this.background = valor;
                }else{
                    mensaje = "Error Semantico: se intento establecer el parametro background pero ya estaba definido.";
                    console.log(mensaje);
                    throw new Error(mensaje);
                }
                break;
            default:
                mensaje = "Error Semantico: se intentó establecer el parametro " + parametro + " en una isntancia Body pero no es un parametro valido para el componente.";
        }
    }


    /**
     * @returns {String} El codigo HTML del componente body.
     */
    obtenerCodigo(){
        if(this.background == undefined){
            this.background = "white";
        }
        codigo = "<body style=\"background-color: " + this.background + ";\"></body>";
        return codigo; 

    }
}