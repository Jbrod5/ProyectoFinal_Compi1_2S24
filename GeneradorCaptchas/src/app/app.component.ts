import { Component } from '@angular/core';
import * as CLang from './analizadores/CLang';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { HttpParams } from '@angular/common/http';
import { Parametro } from './componentes/Parametro';

import { saveAs } from 'file-saver'; // Importar la librería file-saver



@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {


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
    parser.parse(code);


    console.log("CLANG:");
    console.log(CLang.obtenerCodigo());

    //Mostrar los mensaje sen el area de mensajes: 
    (document.getElementById('mensajes-analisis') as HTMLTextAreaElement).value = CLang.obtenerMensajes();


    //Enviar al servlet java: 
			var url = 'http://localhost:8080/AdministradorPaginas/guardarpagina';
			const headers = new HttpHeaders({
        'Content-Type': 'application/x-www-form-urlencoded' // Cambiado a application/x-www-form-urlencoded
			  });
			
			  // Crear los parámetros
        const params = new HttpParams()
          .set('codigoPagina', CLang.obtenerCodigo())
          .set('nombrePagina', CLang.obtenerNombre());
      
			  
          this.http.post(url, params.toString(), { headers }) // Convertir los parámetros a string
          .subscribe(
              response => {
                  console.log('Respuesta del servidor:', response);
                  // Manejar la respuesta del servidor
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


}
