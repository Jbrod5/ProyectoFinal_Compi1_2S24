import { Componente } from "./Componente";

export class Body extends Componente{
    background;
    
    componentes = [];

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
                    c = valor.toLowerCase();
                    switch(c){
                        case 'black': this.background = '#000000';
                            break;
                        case 'olive': this.background =  '#808000';
                            break;
                        case 'teal': this.background = '#008080';
                            break; 
                        case 'red': this.background = '#FF0000';
                            break; 
                        case 'blue': this.background = '#0000FF';
                            break;
                        case 'maroon': this.background = '#800000';
                            break; 
                        case 'navy': this.background = '#000080';
                            break; 
                        case 'gray': this.background = '#808080';
                            break; 
                        case 'lime': this.background = '#00FF00';
                            break; 
                        case 'fucshia': this.background = '#FF00FF';
                            break; 
                        case 'green': this.background = '#008000';
                            break; 
                        case 'white': this.background = '#FFFFFF';
                            break; 
                        case 'purple': this.background = '#800080';
                            break;
                        case 'silver': this.background = '#C0C0C0';
                            break;
                        case 'yellow': this.background = '#FFFF00';
                            break; 
                        case 'aqua': this.background = '#00FFFF';
                            break;
                        default: 
                            this.background = valor;  
                    }
                }else{
                    mensaje = "Error Semantico: se intento establecer el parametro background pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(error);
                }
                break;
            default:
                mensaje = "Error Semantico: se intentó establecer el parametro " + parametro + " en una isntancia Body pero no es un parametro valido para el componente.";
        }
    }

    /**
     * Agrega un componente a la lista de componentes.
     * @param {Componente} componente - Componente que se agregara a la lista de componentes.
     */
    agregarComponente(componente){
        this.componentes.push(componente);
    }

    /**
     * @returns {String} El codigo HTML del componente body.
     */
    obtenerCodigo(){
        if(this.background == undefined){
            this.background = "#FFFFFF";
        }
        codigo = "<body style=\"background-color: " + this.background + ";\">";
        
        //concatenar el codigo de los componentes.
        this.componentes.forEach(comp =>{
            codigo += comp.obtenerCodigo();
        })

        codigo += "</body>";
        return codigo; 

    }
}