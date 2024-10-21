import { Componente } from "./Componente"
import { Head } from "./Head";
import { Title } from "./Title";
import { Body } from "./Body"

export class Html extends Componente{

    // Parametros:
    id; 
    name; 

    // Componentes;
    head; 
    body; 

    componentes = [];

    /**
     * Establece un parametro para el componente.
     * @param {String} parametro - Nombre del parametro en mayusculas que se desea establecer.
     * @param {String} valor - Valor del parametro que se desea establecer.
     * 
     * @throws {Error} Error semantico, si se establece un parametro que no es valido en el componente o si el parametro ya estaba definido.
     */
    establecerParametro(parametro, valor){
        switch(parametro){
            case 'ID':
                if(this.id != undefined){
                    var mensaje = "Error Semantico: se intento establecer el parametro id pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                this.id = valor;
                break;
            case 'NAME':
                if(this.name != undefined){
                    var mensaje = "Error Semantico: se intento establecer el parametro name pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                this.name = valor;
                break;
            default: 
                var mensaje = "Error Semantico: se intentó establecer el parametro " + parametro + " en una instancia HTML pero no es un parametro valido para el componente.";
                super.lanzarExcepcionSemantica(mensaje);
            
        }
    }


    /**
     * Establece un encabezado para el contenido html.
     * @param {Head} head 
     */
    establecerHead(head){
        this.head = head; 
    }

    /**
     * Establece un titulo para el contenido html.
     * @param {Title} titulo 
     */
    //establecerTitulo(titulo){
    //    this.titulo = titulo;
    //}

    /**
     * 
     * @param {Body} body 
     */
    establecerBody(body){
        this.body = body;
    }

    agregarComponente(componente){
        this.componentes.push(componente);
    }


    /**
     * @returns {String} El codigo HTML.
     */
    obtenerCodigo(){
        var codigo = "<!DOCTYPE html>\n";
        codigo += "<html lang=\"es\">\n";

        if(this.head != undefined){
            codigo += this.head.obtenerCodigo() + "\n";
        }

        if(this.body != undefined){
            codigo += this.body.obtenerCodigo() + "\n";
        }

        if(this.componentes != undefined){
            this.componentes.forEach(componente =>{
                if(componente != undefined){
                    codigo+=componente.obtenerCodigo() + "\n";
                }
            });
        }

        codigo += "\n</html>"



        return codigo;
    }


}