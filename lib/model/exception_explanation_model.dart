/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

/// A model class for providing explanations for exceptions.
class ExceptionExplanationModel {
  /// The title of the exception explanation.
  String title;

  /// The detailed content explaining the exception.
  String content;

  /// The content for a button related to the exception explanation.
  String buttonContent;

  /// Constructor for creating an [ExceptionExplanationModel].
  ExceptionExplanationModel(
    this.title,
    this.content,
    this.buttonContent,
  );
}
