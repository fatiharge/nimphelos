/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:flutter/material.dart';

mixin ShowDialogMixin {
  /// Show an alert dialog with a title and content.
  ///
  /// The [context] parameter is a required BuildContext for displaying the dialog.
  /// The [title] parameter is the title of the alert dialog.
  /// The [content] parameter is the content of the alert dialog.
  bool showAlertDialog(BuildContext context, String title, String content, String buttonText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text(
                buttonText,
                style: TextStyle(color: Theme.of(context).dialogTheme.titleTextStyle?.color),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
    return true;
  }
}
