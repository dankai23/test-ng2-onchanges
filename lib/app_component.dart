// Copyright (c) 2017, the Dart project authors.
// All rights reserved. Use of this source code
// is governed by a BSD-style license that can be
// found in the LICENSE file.

// 2017/02/01 changed by Yoshiharu Ishikawa
// 
// purpose of change: test OnChanges
//
// Line No    Changes
// 24---30    insert
//

import 'package:angular2/core.dart';

import 'badge_component.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    directives: const [BadgeComponent])
class AppComponent {
  var name = 'Angular';

  String textBox;

  void clearText(){
    textBox = "";
  }

}
