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
                    var mensaje = "Error Semantico: se intento establecer el parametro tipo pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                var val = valor.toLocaleLowerCase();
                if(val === "text" | val === "number" | val === "radio" | val === "checkbox"){
                    this.tipo = val;
                }else{
                    var mensaje = "Error Sintactico: se intento establecer el parametro tipo pero " + val + " no es un tipo de input correcto.";
                    super.lanzarExcepcionSintactica(mensaje);
                }
                break; 
            

            case 'FONT_SIZE':
                if(this.fontSize != undefined){
                    var mensaje = "Error Semantico: se intento establecer el parametro font-size pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                this.fontSize = valor;  
                break;
            case 'FONT_FAMILY':
                if(this.fontFamily != undefined){
                    var mensaje = "Error Semantico: se intento establecer el parametro font_family pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                } 
                this.fontFamily = valor;
                break;
            case 'TEXT_ALIGN':
                if(this.textAlign != undefined){
                    var mensaje = "Error Semantico: se intento establecer el parametro text-align pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                } 
                var al = valor.toLowerCase(); 
                switch(al){
                    case 'left': this.textAlign = 'left'; break; 
                    case 'right': this.textAlign = 'right'; break; 
                    case 'center': this.textAlign = 'center'; break; 
                    case 'justify': this.textAlign = 'justify'; break;                    
                    default: this.lanzarExcepcionSintactica("Error Sintactico: se intento establecer una alineacion de texto " + al + " pero no es una alineacion valida.")
                }
                break;
            case 'ID':
                if(this.id != undefined){
                    var mensaje = "Error Semantico: se intento establecer el parametro id pero ya estaba definido.";
                    super.lanzarExcepcionSemantica(mensaje);
                }
                this.id = valor;
                break;
            default: 
                var mensaje = "Error Semantico: se intentó establecer el parametro " + parametro + " en una instancia Input pero no es un parametro valido para el componente.";
                super.lanzarExcepcionSemantica(mensaje);
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
     * @returns {String} El codigo HTML del componente.
     */
    obtenerCodigo(){
        this.tipo = this.tipo || 'text';
        this.color = this.color || '#000000';
        this.fontSize = this.fontSize || '10px';
        this.fontFamily = this.fontFamily || 'Arial';
        this.textAlign = this.textAlign || 'left';
        var style = " style =\" color: " + this.color + "; font-size: " + this.fontSize + "; font-family: " + this.fontFamily + "; text-align: " + this.textAlign + ";\"";
        var codigo = "<input type=\"" + this.tipo + "\" id = \"" + this.id + "\" name = \""+ this.id  +"\" " + style + " value = \"" + this.valor + "\">";
        codigo +=    "<label for=\""+ this.id + "\" " + style + ">"+ this.valor + "</label>";


        return codigo; 
    }

}