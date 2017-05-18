import { Component, OnInit } from '@angular/core';
import { Usuario } from './login.model';
import { LoginService } from './login.service';
import { NavbarComponent } from '../layouts/navbar/navbar.component';
import { Router } from '@angular/router';
import {FormGroup, FormBuilder, Validators} from '@angular/forms';

@Component ({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.css']
})
export class LoginComponent implements OnInit {
  private credenciales: Usuario;
  loginForm: FormGroup;

  constructor(fb: FormBuilder,
              private loginService: LoginService,
              private  navbarComponent: NavbarComponent,
              private router: Router) {
    this.credenciales = new Usuario();
    this.loginForm = fb.group({
      'correo': [null, Validators.required],
      'contrasena': [null, Validators.required]
    });
  }
  ngOnInit () {}
  logIn() {
    this.loginService.logIn(this.credenciales)
      .subscribe(
        response => {
          console.log(response[0]);
          localStorage.setItem('currentUser', JSON.stringify(response[0]));
          console.log('Login', localStorage.getItem('currentUser'));
          if (this.navbarComponent.isAuthenticated()) {
            this.router.navigateByUrl('/');
          }
        },
        error => console.log(error)
      );
  }
}
