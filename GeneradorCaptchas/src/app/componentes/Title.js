import { Componente } from "./Componente";

export class Title extends Componente{

    valor; 

    /**
     * Establece un parametro para el componente.
     * @param {String} parametro - Nombre del parametro en mayusculas que se desea establecer.
     * @param {String} valor - Valor del parametro que se desea establecer.
     * 
     * @throws {Error} Error semantico, si se establece un parametro que no es valido en el componente o si el parametro ya estaba definido.
     */
    establecerParametro(parametro, valor){

        super.lanzarExcepcionSemantica("Error Semantico: se quizo establecer el parametro " + parametro + " en una instancia Title pero este componente no acepta parametros.");
    
    }

    /**
     * Establece el valor que se encerrará entre las etiquetas de apertura y cierre.
     * @param {String} valor - Valor que se contendra entre las etiquetas de apertura y cierre. 
     */
    establecerValor(valor){
        this.valor = valor; 
    }

    /**
     * @returns {String} String con el codigo html del componente.
     */
    obtenerCodigo(){
        codigo = "<title>" + this.valor + "</title>";
        return codigo; 
    }
}