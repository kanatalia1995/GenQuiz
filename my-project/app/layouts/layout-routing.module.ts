/**
 * Created by Roberto Ortiz on 12/05/2017.
 */

import {NgModule} from '@angular/core';
import {RouterModule, Routes, Resolve} from '@angular/router';

import {navbarRoute} from '../app.route';

let LAYOUT_ROUTES = [
  navbarRoute,
];

@NgModule({
  imports: [
    RouterModule.forRoot(LAYOUT_ROUTES, {useHash: true})
  ],
  exports: [
    RouterModule
  ]
})
export class LayoutRoutingModule {
}
