/**
 * Created by Roberto Ortiz on 13/05/2017.
 */

import { Route } from '@angular/router';

import { LoginComponent } from './login.component';

export const LOGIN_ROUTE: Route = {
  path: 'login',
  component: LoginComponent,
  data: {
    authorities: [],
    pageTitle: 'Log In'
  },
  canActivate: []
};
