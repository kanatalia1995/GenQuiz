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
  private url = 'http://localhost:8081/GenQuiz/WebService/insertar_usuario.php'; /**Falta determinar el nombre del archivo**/
  constructor (private http: Http) {}
  signIn (usuario: Usuario): Observable<any> {
    const body = 'username=' + usuario.username + '&correo=' + usuario.email + '&contrasena=' + usuario.password;
    let headers = new Headers();
    headers.append('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');

    return this.http.post(this.url, body, {
      headers : headers
    }).map(res => res.json());
  }
}
