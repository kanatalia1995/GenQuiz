/**
 * Created by Roberto Ortiz on 14/05/2017.
 */

import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { RouterModule } from '@angular/router';

import { CursosComponent } from './cursos.component';
import { CURSOS_ROUTE } from './cursos.route';

@NgModule({
  imports: [
    RouterModule.forRoot([CURSOS_ROUTE], {useHash: true})
  ],
  declarations: [
    CursosComponent,
  ],
  entryComponents: [],
  providers: [],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})

export class AppCursosModule {
}
