/**
 * Created by Roberto Ortiz on 12/05/2017.
 */

import {Injectable} from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/Rx';
import {Observable} from 'rxjs/Rx';
import { Usuario } from './login.model';
import { Headers } from '@angular/http';

@Injectable()
export class LoginService {
  private url = 'http://localhost:8081/WebService/verificar_usuario.php';
  constructor (private http: Http) {}
  logIn (usuario: Usuario): Observable<any> {
    const body = 'correo=' + usuario.correo + '&contrasena=' + usuario.contrasena;
    let headers = new Headers();
    headers.append('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');

    return this.http.post(this.url, body, {
      headers : headers
    }).map(res => res.json());
  }
}
