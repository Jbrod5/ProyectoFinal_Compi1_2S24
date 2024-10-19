import { Componente } from "./Componente";
import { Title } from "./Title";

export class Head extends Componente{

    title; 

    /**
     * Establece un parametro para el componente.
     * @param {String} parametro - Nombre del parametro en mayusculas que se desea establecer.
     * @param {String} valor - Valor del parametro que se desea establecer.
     * 
     * @throws {Error} Error semantico, si se establece un parametro que no es valido en el componente o si el parametro ya estaba definido.
     */
    establecerParametro(parametro, valor){

        super.lanzarExcepcionSemantica("Error Semantico: se quizo establecer el parametro " + parametro + " en una instancia Head pero este componente no acepta parametros.");
    
    }

    /**
     * Establece un titulo para head.
     * @param {Title} componente 
     * @throws {Error} Error semantico: si se intenta agregar un componente que  ya estaba definido anteriormente.
     */
    agregarComponente(componente){
        if(this.title != undefined){
            this.lanzarExcepcionSemantica("Error Semantico: Se intento establecer un titulo en el head pero ya estaba definido.");
        }
        this.title = componente
    }


    /**
     * @returns {String} String con el codigo html del componente.
     */
    obtenerCodigo(){
        codigo = "<head>\n"
        if(this.title != undefined){
            codigo += this.title.obtenerCodigo() + "\n";
        }
        codigo+= "</head>";
        return codigo;
    }

}