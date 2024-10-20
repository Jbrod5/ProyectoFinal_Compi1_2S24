import { Component } from '@angular/core';
import * as CLang from './analizadores/CLang';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
 
  expression : string = "";
  
  title = 'GeneradorCaptchas';

  parse():void{
    const pars = CLang.parse(this.expression);
  }
}
