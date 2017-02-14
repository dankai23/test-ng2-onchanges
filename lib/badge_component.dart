// Copyright (c) 2017, the Dart project authors.
// All rights reserved. Use of this source code
// is governed by a BSD-style license that can be
// found in the LICENSE file.

// 2017/02/01 changed by Yoshiharu Ishikawa
// 
// purpose of change: test OnChanges
//
// Line No    Changes
// 21         insert
// 28         comment out
// 29---30    insert
// 52---63    insert

import 'dart:async' show Future;

import 'package:angular2/core.dart';

import 'name_service.dart';
import 'dart:convert';

@Component(
    selector: 'pirate-badge',
    templateUrl: 'badge_component.html',
    styleUrls: const ['badge_component.css'],
    providers: const [NameService])
//class BadgeComponent implements OnInit {
class BadgeComponent implements OnInit,OnChanges {
  @Input() String textBox;
  final NameService _nameService;
  String badgeName = '';
  String buttonText = 'Aye! Gimme a name!';
  bool isButtonEnabled = false;
  bool isInputEnabled = false;

  BadgeComponent(this._nameService);

  @override
  Future ngOnInit() async {
    try {
      await _nameService.readyThePirates();
      // on success
      isButtonEnabled = true;
      isInputEnabled = true;
    } catch (arrr) {
      badgeName = 'Arrr! No names.';
      print('Error initializing pirate names: $arrr');
    }
  }

//
  @override
  ngOnChanges(Map<String, SimpleChange> changes) {
    changes.forEach((String propName, SimpleChange change) {
      String cur = JSON.encode(change.currentValue);
      String prev =
         change.isFirstChange() ? "{}" : JSON.encode(change.previousValue);
      print('$propName: currentValue = $cur, previousValue = $prev');

    });
  }
//

  void generateBadge() {
    setBadgeName();
  }

  void updateBadge(String inputName) {
    setBadgeName(inputName);
    if (inputName.trim().isEmpty) {
      buttonText = 'Aye! Gimme a name!';
      isButtonEnabled = true;
    } else {
      buttonText = 'Arrr! Write yer name!';
      isButtonEnabled = false;
    }
  }

  void setBadgeName([String newName = '']) {
    if (newName == null) return;
    badgeName = _nameService.getPirateName(newName);
  }
}
