// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:simple_workbook_demo/nav_menu.dart';
import 'package:route_hierarchical/client.dart';
import 'practiceNameModule.dart';

//vars for the about page
ButtonElement aboutButton;
var aboutField;

void main() {
  initNavMenu();
  initPracticeNameModule();

  // Webapps need routing to listen for changes to the URL.
  var router = new Router();
  router.root
    ..addRoute(name: 'about', path: '/about', enter: showAbout)
    ..addRoute(name: 'resources', path: '/resources', enter: showResources)
    ..addRoute(name: 'policies', path: '/policies', enter: showPolicies)
    ..addRoute(name: 'risks', path: '/risks', enter: showRisks)
    ..addRoute(name: 'practice', defaultRoute: true, path: '/', enter: showPractice);
  router.listen();

  //fill in rules for About page
  aboutField = querySelector('#dataDump');
  aboutButton = querySelector('#dumpText');
  aboutButton.onClick.listen(dumpTheData);
}

void showPractice(RouteEvent e) {
  querySelector('#practice').style.display = '';
  querySelector('#resources').style.display = 'none';
  querySelector('#policies').style.display = 'none';
  querySelector('#risks').style.display = 'none';
  querySelector('#about').style.display = 'none';
}

void showResources(RouteEvent e) {
  querySelector('#practice').style.display = 'none';
  querySelector('#resources').style.display = '';
  querySelector('#policies').style.display = 'none';
  querySelector('#risks').style.display = 'none';
  querySelector('#about').style.display = 'none';
}

void showPolicies(RouteEvent e) {
  querySelector('#practice').style.display = 'none';
  querySelector('#resources').style.display = 'none';
  querySelector('#policies').style.display = '';
  querySelector('#risks').style.display = 'none';
  querySelector('#about').style.display = 'none';
}

void showRisks(RouteEvent e) {
  querySelector('#practice').style.display = 'none';
  querySelector('#resources').style.display = 'none';
  querySelector('#policies').style.display = 'none';
  querySelector('#risks').style.display = '';
  querySelector('#about').style.display = 'none';
}

void showAbout(RouteEvent e) {
  // Extremely simple and non-scalable way to show different views.
  querySelector('#practice').style.display = 'none';
  querySelector('#resources').style.display = 'none';
  querySelector('#policies').style.display = 'none';
  querySelector('#risks').style.display = 'none';
  querySelector('#about').style.display = '';
}



void dumpTheData(Event e) {
  //display contents of saved data
  String practiceData = window.localStorage[PRACTICE_DATA];
  if (practiceData != null) {
    aboutField.text = practiceData;
  } else {
    aboutField.text = 'No Practice Data';;
  }
}





