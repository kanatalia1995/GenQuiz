/**
 * Created by Roberto Ortiz on 12/05/2017.
 */

import { Route } from '@angular/router';

import { CursosComponent } from './cursos.component';

export const CURSOS_ROUTE: Route = {
  path: 'cursos',
  component: CursosComponent,
  data: {
    authorities: [],
    pageTitle: 'GenQuiz - Cursos'
  },
  canActivate: []
};
