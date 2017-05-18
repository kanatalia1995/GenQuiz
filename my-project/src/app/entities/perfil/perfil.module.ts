/**
 * Created by Roberto Ortiz on 14/05/2017.
 */

import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { RouterModule } from '@angular/router';

import { PerfilComponent } from './perfil.component';
import { PERFIL_ROUTE } from './perfil.route';

@NgModule({
  imports: [
    RouterModule.forRoot([PERFIL_ROUTE], {useHash: true})
  ],
  declarations: [
    PerfilComponent,
  ],
  entryComponents: [],
  providers: [],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})

export class AppPerfilModule {
}
