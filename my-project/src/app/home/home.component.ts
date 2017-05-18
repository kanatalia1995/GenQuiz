/**
 * Created by Roberto Ortiz on 12/05/2017.
 */
import {Component, OnInit} from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.css']
})

export class HomeComponent implements OnInit {

  title: string;

  constructor() {}

  ngOnInit() {
    this.title = 'HOME!';
  }
}
