import { Component } from '@angular/core';
import * as CLang from './analizadores/CLang';
import * as CLC from './analizadores/CLC';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { HttpParams } from '@angular/common/http';
import { Html } from './componentes/Html';
import { Parametro } from './componentes/Parametro';

import { saveAs } from 'file-saver'; // Importar la librería file-saver
import { ParseError } from '@angular/compiler';



@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  tablaDatos: string[][] = []; // Array para almacenar las filas y columnas de la tabla
  
  captchasGenerados: string[] = [];
  nombresCaptchas: string[] = [];
  contadorCaptchas: number[] = [];

  constructor(private http: HttpClient) { }  // HttpClient inyectado en el constructor

 
  expression : string = "";


  code : string = "";
  currentLine: number = 1;
  currentColumn: number = 1;

  title = 'GeneradorCaptchas';

  filePath: string | null = null; // Ruta del archivo abierto/guardado



  parse():void{
    const pars = CLang.parse(this.expression);
  }

  processCode() {
    // Lógica para procesar el código cuando se haga clic en el botón "Process"
    const code = (document.getElementById('codeArea') as HTMLTextAreaElement).value;
    console.log('Código ingresado:', code);
    var parser = new CLang.Parser();
    CLang.limpiarMensajes();

    //CLC: 
    var clc = new CLC.Parser();
    CLC.limpiarMensajes();
    var mensaje = "";

    var tabla = "";

    try{
      parser.parse(code);
      //Mostrar los mensaje sen el area de mensajes: 
      mensaje +=    " = = = = = = = = = = = = = = = = = = = = = = = = = = = =\n";
      mensaje +=    " = = = = = = = = = = = C L A N G  = = = = = = = = = = =\n";
      mensaje +=    " = = = = = = = = = = = = = = = = = = = = = = = = = = = =\n\n\n";
      mensaje += CLang.obtenerMensajes() + "\n\n\n"; 

      mensaje +=    " - - - - - - - - - - Script a procesar - - - - - - - - - - \n\n"
      mensaje += CLang.obtenerScript() + "\n\n\n"
      
      //Parsear scripts: 
      mensaje +=    " = = = = = = = = = = = = = = = = = = = = = = = = = = = = =\n";
      mensaje +=    " = = = = = = = = = = = = = C L C = = = = = = = = = = = = =\n";
      mensaje +=    " = = = = = = = = = = = = = = = = = = = = = = = = = = = = =\n\n\n";
      var script = CLang.obtenerScript();
      CLC.parse(script);
      mensaje += CLC.obtenerMensajes();


      mensaje += " - - - - - - - - - - - - - - SCRIPT  - - - - - - - - - - - - - - \n";
      mensaje += CLC.obtenerCodigo();
      script = "<script>\n" + CLC.obtenerCodigo() + "\n</script>";
      var paginaCompleta = CLang.obtenerPagina();
      paginaCompleta.establecerScript(script);


      tabla = CLC.obtenerTabla();


    }catch(error){
      if (error instanceof Error) {
          //(document.getElementById('mensajes-analisis') as HTMLTextAreaElement).value 
          mensaje += "ERROR SINTACTICO CRITICO: \n" + error.message + "\n"  + CLang.obtenerMensajes();
      }
      console.error(error);
    }


    console.log("CLANG:");
    console.log(CLang.obtenerCodigo());
    //Mostrar mensajes y la tabla de simbolos
    (document.getElementById('mensajes-analisis') as HTMLTextAreaElement).value = mensaje;
    //(document.getElementById('tabla-simbolos') as HTMLTextAreaElement).value = tabla;
    console.log("TABLA DE SIMBOLOS")
    console.log(tabla);
    this.procesarString(tabla);


    ;


    //Enviar al servlet java: 
			var url = 'http://localhost:8080/AdministradorPaginas/guardarpagina';
			const headers = new HttpHeaders({
        'Content-Type': 'application/x-www-form-urlencoded' // Cambiado a application/x-www-form-urlencoded
			  });
			
			  // Crear los parámetros
        const params = new HttpParams()
          .set('codigoPagina', paginaCompleta.obtenerCodigo())
          .set('nombrePagina', CLang.obtenerNombre());
      
			  
          this.http.post(url, params.toString(), { headers }) // Convertir los parámetros a string
          .subscribe(
              response => {
                  console.log('Respuesta del servidor:', response);
                  // Manejar la respuesta del servidor

                  //Agregar la url a la lista de urls
                  let urlCaptcha = "http://localhost:8000/" + CLang.obtenerNombre() + ".html";
                  let encontrado = false
                  this.captchasGenerados.forEach(captcha => {
                    if(captcha === urlCaptcha){
                      encontrado = true; 
                    }
                  });
                  if(!encontrado){
                    this.captchasGenerados.push(urlCaptcha);
                    this.contadorCaptchas.push(0);
                    this.nombresCaptchas.push(CLang.obtenerNombre());
                  }
                  
              },
              error => {
                  console.error('Error al enviar la petición:', error);
                  // Manejar los errores
              }
          );
  }
  




  updateCursorPosition(event: KeyboardEvent | MouseEvent) {
    const textArea = event.target as HTMLTextAreaElement;
    const position = textArea.selectionStart;
    const lines = textArea.value.substring(0, position).split('\n');
    
    this.currentLine = lines.length;
    this.currentColumn = lines[lines.length - 1].length + 1;

    this.updateLineNumbers();
  }

  updateLineNumbers() {
    const codeArea = document.getElementById('codeArea') as HTMLTextAreaElement;
    const lines = codeArea.value.split('\n').length;
    const lineNumbers = Array.from({ length: lines }, (_, i) => i + 1).join('\n');

    const lineNumbersElement = document.getElementById('line-numbers') as HTMLDivElement;
    lineNumbersElement.textContent = lineNumbers;
  }

  syncScroll() {
    const codeArea = document.getElementById('codeArea') as HTMLTextAreaElement;
    const lineNumbers = document.getElementById('line-numbers') as HTMLDivElement;
    
    // Sincroniza el desplazamiento vertical
    lineNumbers.scrollTop = codeArea.scrollTop;
  }





// Abrir archivo
openFile(): void {
  const input = document.createElement('input');
  input.type = 'file';
  input.accept = '.txt, .c, .cpp'; // Tipos de archivos permitidos

  input.onchange = (event: any) => {
    const file = event.target.files[0];
    this.filePath = file.name; // Guardar el nombre del archivo

    const reader = new FileReader();
    reader.onload = (e: any) => {
      const content = e.target.result;
      (document.getElementById('codeArea') as HTMLTextAreaElement).value = content;
      this.code = content;
      this.updateLineNumbers();
    };
    reader.readAsText(file);
  };
  input.click();
}

// Guardar archivo
saveFile(): void {
  if (this.filePath) {
    this.saveToFile(this.filePath);
  } else {
    this.saveAs();
  }
}

// Guardar como
saveAs(): void {
  const input = document.createElement('input');
  input.type = 'text';
  input.placeholder = 'Nombre del archivo';
  
  input.onchange = () => {
    const fileName = input.value ? `${input.value}.txt` : 'archivo.txt';
    this.saveToFile(fileName);
  };
  
  document.body.appendChild(input);
  input.focus();
  input.click();
}

// Función para guardar el contenido en un archivo
saveToFile(fileName: string): void {
  const content = (document.getElementById('codeArea') as HTMLTextAreaElement).value;
  const blob = new Blob([content], { type: 'text/plain' });
  const url = window.URL.createObjectURL(blob);
  
  const a = document.createElement('a');
  a.href = url;
  a.download = fileName;
  a.click();
  
  window.URL.revokeObjectURL(url); // Limpiar la URL creada
}





procesarString(inputString: string) {
  // Divide el string en filas (cada salto de línea representa una nueva fila)
  const filas = inputString.split('\n');
  this.tablaDatos = filas.map(fila => fila.split('|'));
}


isMenuOpen = false;
toggleMenu() {
  this.isMenuOpen = !this.isMenuOpen;
}

someAction() {
  // Acción que realiza el menú, puedes agregar lógica aquí

  
}
  // Método para incrementar el contador
  incrementarContador(index: number): void {
    this.contadorCaptchas[index] = (this.contadorCaptchas[index] || 0) + 1;
  }


}
