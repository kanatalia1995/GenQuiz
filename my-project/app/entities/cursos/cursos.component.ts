/**
 * Created by Roberto Ortiz on 14/05/2017.
 */

import {Component, OnInit} from '@angular/core';

@Component({
  selector: 'app-cursos',
  templateUrl: './cursos.component.html',
  styleUrls: ['./cursos.css']
})

export class CursosComponent implements OnInit {

  title: string;

  constructor() {}

  ngOnInit() {
    this.title = 'Página de cursos!';
  }
  /*displayTreeMenu() {
    $('.tree-toggle').click(function () {
      $(this).parent().children('ul.tree').toggle(200);
    });
    $(function(){
      $('.tree-toggle').parent().children('ul.tree').toggle(200);
    })
  }*/
}
