/**
 * Created by usuario on 12/05/2017.
 */
import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { RouterModule } from '@angular/router';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import { CommonModule } from '@angular/common';

import { LoginComponent } from './login.component';
import { LOGIN_ROUTE } from './login.route';
import {LoginService} from './login.service';
import {NavbarComponent} from '../layouts/navbar/navbar.component';

@NgModule({
  imports: [
    RouterModule.forRoot([LOGIN_ROUTE], {useHash: true}),
    FormsModule,
    CommonModule,
    ReactiveFormsModule,
  ],
  declarations: [
    LoginComponent,
  ],
  entryComponents: [],
  providers: [
    LoginService,
    NavbarComponent,
  ],
  schemas: [
    CUSTOM_ELEMENTS_SCHEMA
  ]
})

export class AppLoginModule {
}
