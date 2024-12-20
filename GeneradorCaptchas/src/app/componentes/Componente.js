/* Representacion de un componente */
export class Componente{

    /** 
     *  Establece un parametro del componente
     * @param {string} parametro - Nombre del parametro en mayusculas que se desea establecer.
     * @param {string} valor - Valor del parametro que se desea establecer
     *
     * @throws {Error} Error sintactico, si se desea establecer un parametro que no es valido en el componete o si ese parámetro ya contaba con un valor.*/
    establecerParametro(parametro, valor){

    }

    /**
     * Establece el valor que se encerrará entre las etiquetas de apertura y cierre.
     * @param {String} valor - Valor que se contendra entre las etiquetas de apertura y cierre. 
     */
    establecerValor(valor){

    }

    /**
     * Agrega un componente a la lista de componentes.
     * @param {Componente} componente - Componente que se agregara a la lista de componentes.
     */
    agregarComponente(componente){

    }



    /**
     * @returns {String} El codigo HTML del componente.
     */
    obtenerCodigo(){
        return "st";
    }

    /**
     * Lanza una excepcion semantica.
     * @param {String} mensaje - Mensaje que tendra la excepcion lanzada. 
     * @throws {Error} Error semantico.
     */
    lanzarExcepcionSemantica(mensaje){
        console.log(mensaje);
        throw new Error(mensaje);
    }

     /**
     * Lanza una excepcion sintactica.
     * @param {String} mensaje - Mensaje que tendra la excepcion lanzada. 
     * @throws {Error} Error sintactico.
     */
     lanzarExcepcionSintactica(mensaje){
        console.log(mensaje);
        throw new Error(mensaje);
    }

    
}