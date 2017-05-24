/**
 * Created by Roberto Ortiz on 12/05/2017.
 */

import {Injectable} from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/Rx';
import {Observable} from 'rxjs/Rx';
import { Usuario } from './signin.model';
import { Headers } from '@angular/http';

@Injectable()
export class SigninService {
  private url = 'http://localhost:8081/WebService/registro_usuario.php';
  constructor (private http: Http) {}
  signIn (usuario: Usuario): Observable<any> {
    const body = 'nombre=' + usuario.nombre + '&contrasena=' + usuario.contrasena + '&correo=' + usuario.correo;
    let headers = new Headers();
    headers.append('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');

    return this.http.post(this.url, body, {
      headers : headers
    }).map(res => res.json());
  }
}
