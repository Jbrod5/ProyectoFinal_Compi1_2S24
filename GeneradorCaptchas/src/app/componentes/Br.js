import { Componente } from "./Componente";

export class Br extends Componente{

    /**
     * Establece un parametro para el componente; 
     * @param {String} parametro - Nombre del parametro en mayusculas que se desea establecer. 
     * @param {String} valor - Valor del parametro que se desea establecer.
     * 
     * @throws {Error} Error semantico, si se desea establecer un parametro que no es valido en el componente o si el parametro ya contaba con un valor establecido.
     */
    establecerParametro(parametro, valor){

        super.lanzarExcepcionSemantica("Error Semantico: se intento establecer el parametro " + parametro +  " en una instancia BR pero este componente no espera recibir parametros.");

    }


    /**
     * @returns {String} El codigo HTML del componente.
     */
    obtenerCodigo(){
        return "<br>";
    }

}