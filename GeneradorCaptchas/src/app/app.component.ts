import { Component } from '@angular/core';
import * as CLang from './analizadores/CLang';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { HttpParams } from '@angular/common/http';
import { Parametro } from './componentes/Parametro';

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

  parse():void{
    const pars = CLang.parse(this.expression);
  }

  processCode() {
    // Lógica para procesar el código cuando se haga clic en el botón "Process"
    const code = (document.getElementById('codeArea') as HTMLTextAreaElement).value;
    console.log('Código ingresado:', code);
    //const pars = CLang.parse(code);

    var parser = new CLang.Parser();
    var parametro = new Parametro('a','b');
    //parser.establecerPaquete(parametro);
    //parser.establecerPaquete(parametro);
    parser.parse(code);
    //var parser = CLang;


    console.log("CLANG:");
    console.log(CLang.obtenerCodigo());

    //CLang.cambiarParametros();
    //console.log("CLANG:");
    //console.log(CLang.codigoPagina);


    //Enviar al servlet java: 
			var url = 'http://localhost:8080/AdministradorPaginas/guardarpagina';
			const headers = new HttpHeaders({
        'Content-Type': 'application/x-www-form-urlencoded' // Cambiado a application/x-www-form-urlencoded
			  });
			
			  // Crear los parámetros
        const params = new HttpParams()
          //.set('codigoPagina', pars.codigoPagina)
          //.set('nombrePagina', pars.nombrePagina);

          //.set('codigoPagina', parser.codigoPagina)
          //.set('nombrePagina', parser.nombrePagina);
          .set('codigoPagina', CLang.obtenerCodigo())
          .set('nombrePagina', CLang.obtenerNombre());

          //.set('codigoPagina', parametro.parametro)
          //.set('nombrePagina', parametro.valor);
      
			  
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
}
