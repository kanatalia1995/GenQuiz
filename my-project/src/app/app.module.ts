import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { RouterModule } from '@angular/router';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { AppHomeModule } from './home/home .module';
import { MainComponent } from './layouts/main/main.component';
import { LayoutRoutingModule } from './layouts/layout-routing.module';
import {AppLoginModule} from './login/login.module';
import {AppSigninModule} from './signin/signin.module';
import {NavbarComponent} from './layouts/navbar/navbar.component';
import {FormsModule} from '@angular/forms';
import {AppCursosModule} from './entities/cursos/cursos.module';
import {AppPerfilModule} from './entities/perfil/perfil.module';

@NgModule({
  declarations: [
    MainComponent,
    NavbarComponent,
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    NgbModule.forRoot(),
    RouterModule,
    AppHomeModule,
    LayoutRoutingModule,
    AppLoginModule,
    AppSigninModule,
    AppCursosModule,
    AppPerfilModule,
  ],
  providers: [
    {provide: Window, useValue: window},
    {provide: Document, useValue: document},
  ],
  bootstrap: [MainComponent],
})
export class AppModule { }
