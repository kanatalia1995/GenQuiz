/**
 * Created by usuario on 12/05/2017.
 */
import {Component, OnInit} from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['navbar.css']
})
export class NavbarComponent implements OnInit {

  isNavbarCollapsed: boolean;

  constructor(private router: Router) {
    this.isNavbarCollapsed = false;
  }

  ngOnInit() {
  }

  toggleNavbar() {
    this.isNavbarCollapsed = !this.isNavbarCollapsed;
  }
  isAuthenticated() {
    return localStorage.getItem('currentUser');
  }
  logOut() {
    // remove user from local storage to log user out
    localStorage.removeItem('currentUser');
    console.log('currentUser');
    if (!this.isAuthenticated()) {
      this.router.navigateByUrl('/signin');
    }
  }
}

