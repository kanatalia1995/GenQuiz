/**
 * Created by Roberto Ortiz on 14/05/2017.
 */

import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { RouterModule } from '@angular/router';
import { FormsModule, ReactiveFormsModule} from '@angular/forms';
import { CommonModule } from '@angular/common';

import { SigninComponent } from './signin.component';
import { SIGNIN_ROUTE } from './signin.route';
import { SigninService } from './signin.service';
import { NavbarComponent } from '../layouts/navbar/navbar.component';


@NgModule({
  imports: [
    RouterModule.forRoot([SIGNIN_ROUTE], {useHash: true}),
    FormsModule,
    CommonModule,
    ReactiveFormsModule,
  ],
  declarations: [
    SigninComponent,
  ],
  entryComponents: [],
  providers: [
    SigninService,
    NavbarComponent,
  ],
  schemas: [
    CUSTOM_ELEMENTS_SCHEMA
  ]
})

export class AppSigninModule {
}
