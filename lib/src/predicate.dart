// ignore_for_file: comment_references

/// Returns true when all elements of [values] are `null`.
bool _isAllNull<T>(Iterable<T> values) =>
    values.every((element) => element == null);

/// Returns true when no element of [values] is `null`.
bool _isNothingNull<T>(Iterable<T> values) =>
    values.every((element) => element != null);

/// An extension for [Iterable] that provides some useful methods.
extension CleverIterableExtension<T> on Iterable<T> {
  /// Returns true when all elements of [values] are `null`.
  bool isAllNull() => _isAllNull(this);

  /// Returns true when no element of [values] is `null`.
  bool isNothingNull() => _isNothingNull(this);
}
