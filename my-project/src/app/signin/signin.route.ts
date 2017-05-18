/**
 * Created by Roberto Ortiz on 14/05/2017.
 */

import { Route } from '@angular/router';

import { SigninComponent } from './signin.component';

export const SIGNIN_ROUTE: Route = {
  path: 'signin', // Duda
  component: SigninComponent,
  data: {
    authorities: [],
    pageTitle: 'Sign In' // Duda
  },
  canActivate: []
};
