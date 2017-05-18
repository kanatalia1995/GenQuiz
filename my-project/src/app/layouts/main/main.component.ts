/**
 * Created by Roberto Ortiz on 12/05/2017.
 */
import {Component, OnInit} from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.css']
})
export class MainComponent implements OnInit {
  constructor(private router: Router) {
  }

  ngOnInit() {
  }
}
