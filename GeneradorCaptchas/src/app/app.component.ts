import { Component } from '@angular/core';
import * as CLang from './analizadores/CLang';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
 
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
