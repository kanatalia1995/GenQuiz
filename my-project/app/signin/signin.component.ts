import { Component, OnInit } from '@angular/core';
import { Usuario } from './signin.model';
import { SigninService } from './signin.service';
import { NavbarComponent } from '../layouts/navbar/navbar.component';
import { Router } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

@Component ({
  selector: 'app-signin',
  templateUrl: './signin.component.html',
  styleUrls: ['./signin.css']
})
export class SigninComponent implements OnInit {
  private credenciales: Usuario;
  signinForm: FormGroup;

  constructor(fb: FormBuilder,
              private signinService: SigninService,
              private navbarComponent: NavbarComponent,
              private router: Router) {
    this.credenciales = new Usuario();
    this.signinForm = fb.group({
      'nombre' : [null, Validators.required],
      'contrasena' : [null, Validators.required],
      'correo': [null, Validators.required],
    });
  }
  ngOnInit () {}
  signIn() {
    this.signinService.signIn(this.credenciales)
      .subscribe(
        response => {
          console.log(response[0]);
          localStorage.setItem('currentUser', JSON.stringify(response[0]));
          console.log('Signin', localStorage.getItem('currentUser'));
          if (this.navbarComponent.isAuthenticated()) {
            this.router.navigateByUrl('/');
          }
        },
        error => console.log(error)
      );
  }
}
