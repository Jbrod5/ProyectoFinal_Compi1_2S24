import { Componente } from "./Componente";

export class Input extends Componente{

    tipo;
    font_size; 
    font_family; 
    text_align;
    id; 
    color;  

    valor;

    /**
     * Establece un parametro para el componente. 
     * @param {String} parametro - Nombre del parametro en mayusculas que se desea establecer. 
     * @param {String} valor - Valor del parametro que se desea establecer. 
     * 
     * @throws {Error} Error semantico, si se desea establecer un parametro que no es valido en el componente o si ese parametro ya contaba con un valo.*/
    establecerParametro(parametro, valor){

        switch(parametro){
            case 'TIPO':
                if(this.tipo != undefined){
                    mensaje = "Error Semantico: se intento establecer el parametro tipo pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                val = valor.toLocaleLowerCase();
                if(val === "text" | val === "number" | val === "radio" | val === "checkbox"){
                    this.tipo = val;
                }else{
                    mensaje = "Error Sintactico: se intento establecer el parametro tipo pero " + val + " no es un tipo de input correcto.";
                    super.lanzarExcepcionSintactica(mensaje);
                }
                break; 
            

            case 'FONT_SIZE':
                if(this.font_size != undefined){
                    mensaje = "Error Semantico: se intento establecer el parametro font-size pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                this.font_size = valor;  
                break;
            case 'FONT_FAMILY':
                if(this.font_family != undefined){
                    mensaje = "Error Semantico: se intento establecer el parametro font_family pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                } 
                this.font_family = valor;
                break;
            case 'TEXT_ALIGN':
                if(this.text_align != undefined){
                    mensaje = "Error Semantico: se intento establecer el parametro text-align pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                } 
                al = valor.toLowerCase(); 
                switch(al){
                    case 'left': this.text_align = 'left'; break; 
                    case 'right': this.text_align = 'right'; break; 
                    case 'center': this.text_align = 'center'; break; 
                    case 'justify': this.text_align = 'justify'; break;                    
                    default: this.lanzarExcepcionSintactica("Error Sintactico: se intento establecer una alineacion de texto " + al + " pero no es una alineacion valida.")
                }
                break;
            case 'ID':
                if(this.id != undefined){
                    mensaje = "Error Semantico: se intento establecer el parametro id pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                this.id = valor;
                break;
            default: 
                mensaje = "Error Semantico: se intentó establecer el parametro " + parametro + " en una instancia Input pero no es un parametro valido para el componente." 
                super.lanzarExcepcionSemantica();
        }
    }

    /**
     * Establece el valor que tendra el input como texto mostrado. 
     * @param {String} valor - Valor que tendra el input como texto mostrado para la entrada. 
     */
    establecerValor(valor){
        this.valor = valor;
    }




    /**
     * @returns {String} El codigo HTML del componente
     */
    obtenerCodigo(){
        this.tipo = this.tipo || 'text';
        this.color = this.color || '#000000';
        this.fontSize = this.fontSize || '10px';
        this.fontFamily = this.fontFamily || 'Arial';
        this.textAlign = this.textAlign || 'left';
        style = "\" color: " + this.color + "; font-size: " + this.fontSize + "; font-family: " + this.fontFamily + "; text-align: " + this.textAlign + ";\"";
        codigo = "<input type=\"" + this.tipo + "\" id = \"" + this.id + "\" name = \""+ this.id  +"\" " + style + " value = \"" + this.valor + "\">";


        return codigo; 
    }

}