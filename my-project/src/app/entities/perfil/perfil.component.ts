/**
 * Created by Roberto Ortiz on 14/05/2017.
 */

import {Component, OnInit} from '@angular/core';

@Component({
  selector: 'app-perfil',
  templateUrl: './perfil.component.html',
  styleUrls: ['./perfil.css']
})

export class PerfilComponent implements OnInit {

  title: string;

  constructor() {}

  ngOnInit() {
    this.title = 'Página de perfil!';
  }
}
