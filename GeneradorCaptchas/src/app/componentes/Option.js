import { Componente } from "./Componente";

export class Option extends Componente{

    valor;

    /**
     * Establece un parametro para el componente
     * @param {String} parametro - Nombre del parametro en mayusculas que se desea establecer.
     * @param {String} valor - Valor del parametro que se desea establecer.
     * @throws {Error} Error semantico, si se desea establecer un parametro que no es valido en el componente o si el parametro ya contaba con un valor.*/ 
    establecerParametro(parametro, valor){

        //Este componente no tiene parametros asociados.
        mensaje = "Error Semantico: se intento establecer el parametro " + parametro + " en una isntancia Option pero este componente no cuenta con parametros asociados";
        super.lanzarExcepcionSemantica(mensaje);

    }



    /**
     * Establece el valor que tendra Option como texto mostrado.
     * @param {String} valor - Valor que tendra Option como texto mostrado.
     */
    establecerValor(valor){
        this.valor = valor; 
    }

    /**
     * @returns {String} El codigo HTML del componente.
     */
    obtenerCodigo(){
        codigo = "<option>" + this.valor + "</option>";
        return codigo; 
    }
}