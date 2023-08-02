/// Extends [String] to add useful utilities.
extension CleverStringUtil on String? {
  /// Returns `true` if this [String] is either null,
  /// empty or is solely made of whitespace
  /// characters (as defined by [String.trim]).
  bool get isBlank => this == null || this!.trim().isEmpty;

  /// Returns `true` if this [String] is neither null,
  /// empty nor is solely made of whitespace characters.
  ///
  /// See also:
  ///
  ///  * [isBlank]
  bool get isNotBlank => this != null && this!.trim().isNotEmpty;

  /// Returns a trimmed version of this [String].
  ///
  /// When the string is blank (null or made up of whitespace)
  /// this returns `null`.
  ///
  /// Example:
  /// ```dart
  /// final value = ' hello  '.trimmed;
  /// print(value); // hello
  ///
  /// final anotherValue = '   '.trimmed;
  /// print(anotherValue); // null
  /// ```
  String? get trimmed => isBlank ? null : this!.trim();
}
