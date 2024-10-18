import {Componente} from './Componente'

export class Link extends Componente{
    href ;
    valor;

    /** 
     *  Establece un parametro del componente
     * @param {string} parametro - Nombre del parametro en mayusculas que se desea establecer.
     * @param {string} valor - Valor del parametro que se desea establecer.
     *
     * @throws {Error} Error semantico, si se desea establecer un parametro que no es valido en el componete o si ese parámetro ya contaba con un valor.*/
    establecerParametro(parametro, valor){
        switch(parametro){
            case 'HREF':
                if(this.href == undefined){
                    this.href = valor;
                }else{
                    mensaje = "Error Semantico: se intento establecer el parametro href pero ya estaba definido.";
                    console.log(mensaje);
                    throw new Error(mensaje)
                }
                break;
            default: 
                mensaje = "Error Semantico: se intentó establecer el parametro " + parametro + " en una instancia Link pero no es un parametro valido para el componente.";
                console.log(mensaje);
                throw new Error(mensaje);
        }
    }

    /**
     * Establece el valor que se encerrará entre las etiquetas de apertura y cierre.
     * @param {String} valor - Valor que se contendra entre las etiquetas de apertura y cierre. 
     */
    establecerValor(valor){
        this.valor = valor;
    }



    /**
     * @returns {String} El codigo HTML del componente.
     */
    obtenerCodigo(){
        codigo = "<a href=\"" + href + "\" style=\" display: inline-block; padding: 10px 20px; background-color: #4CAF50; color: white; text-decoration: none; font-family: Arial, sans-serif; font-size: 16px; border-radius: 5px; transition: background-color 0.3s ease;\">" + this.valor + "</a>";
        return codigo;
    }
}