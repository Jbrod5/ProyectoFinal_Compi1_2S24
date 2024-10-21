import { Componente } from "./Componente";

export class Img extends Componente{

    src; 
    width; 
    height; 
    alt; 
    id; 


    /**
     * Establece un parametro para el componente; 
     * @param {String} parametro - Nombre del parametro en mayusculas que se desea establecer. 
     * @param {String} valor - Valor del parametro que se desea establecer.
     * 
     * @throws {Error} Error semantico, si se desea establecer un parametro que no es valido en el componente o si el parametro ya contaba con un valor establecido.
     */
    establecerParametro(parametro, valor){
        switch(parametro){
            case 'SRC':
                if(this.src != undefined){
                    super.lanzarExcepcionSemantica("Error Semantico: se intento establecer el parametro SRC pero ya estaba definido.");
                }
                this.src = valor; 
                break; 
            case 'WIDTH':
                if(this.width != undefined){
                    super.lanzarExcepcionSemantica("Error Semantico: se intento establecer el parametro WIDTH pero ya eataba definido.");
                }
                this.width = valor; 
                break; 
            case 'HEIGHT':
                if(this.height != undefined){
                    super.lanzarExcepcionSemantica("Error Semantico: se intento establecer el parametro HEIGHT pero ya estaba definido.");
                }
                this.height = valor; 
                break; 
            case 'ALT':
                if(this.alt != undefined){
                    super.lanzarExcepcionSemantica("Error Semantico: se intento establecer el parametro ALT pero ya estabe definido.");
                }
                this.alt = valor; 
                break; 
            case 'ID':
                if(this.id != undefined){
                    super.lanzarExcepcionSemantica("Error Semantico: se intento establecer el parametro ID pero ya estaba definido.");
                }
                this.id = valor; 
                break; 
            default:
                super.lanzarExcepcionSemantica("Error Semantico: se intento establecer el parametro " + parametro + " en una instancia de IMG pero no es un parametro valido.");
        }
    }

    /**
     * @returns {String} El codigo HTML del componente.
     */
    obtenerCodigo(){
        this.src    = this.src      || 'https://static.vecteezy.com/system/resources/previews/044/876/360/non_2x/cat-with-glasses-meme-sticker-tshirt-illustration-free-png.png';  
        this.width  = this.width    || '250px';  
        this.height = this.height   || '250px';  
        this.alt    = this.alt      || 'Descripcion por defecto';
    
        var codigo = "<img ";
        codigo += "src=\"" + this.src + "\" ";
        codigo += "width=\"" + this.width + "\" ";
        codigo += "height=\"" + this.height + "\" ";
        codigo += "alt=\"" + this.alt + "\" ";
        codigo += "id=\"" + this.id + "\">"

        return codigo; 
    }

}