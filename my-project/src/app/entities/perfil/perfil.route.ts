/**
 * Created by Roberto Ortiz on 12/05/2017.
 */

import { Route } from '@angular/router';

import { PerfilComponent } from './perfil.component';

export const PERFIL_ROUTE: Route = {
  path: 'perfil',
  component: PerfilComponent,
  data: {
    authorities: [],
    pageTitle: 'GenQuiz - Perfil'
  },
  canActivate: []
};
