/// A library for utilities for probability.
library clever_util.random;

import 'dart:math';

/// Returns a random int.
///
/// Same as calling `Random().nextInt`
int randomInt(int max, {bool secure = false}) {
  final rnd = secure ? Random.secure() : Random();
  return rnd.nextInt(max);
}

/// Returns a random double from 0-1.
///
/// Same as calling `Random().nextDouble`
double randomDouble({bool secure = false}) {
  final rnd = secure ? Random.secure() : Random();
  return rnd.nextDouble();
}

/// Returns a random bool.
///
/// Same as calling `Random().nextBool`
bool randomBool({bool secure = false}) {
  final rnd = secure ? Random.secure() : Random();
  return rnd.nextBool();
}

/// Selects a random element from [options] with optional [weights].
///
/// If [weights] is provided, it will be used to select an option
/// according to a weighted distribution. If it is not provided,
/// an option will be selected according to a uniform distribution.
///
/// Throws an [ArgumentError] if [options] is empty.
/// Throws an [ArgumentError] if [weights] is non-empty and does not
/// match the length of [options].
///
/// ```dart
/// randomChoice(['hi', 'hello'], [0.7, 0.3]) // 70% chance of 'hi', 30% chance of 'hello'
/// randomChoice(['hi', 'hey']) // 'hi' and 'hey' are equally likely. Equivalent to randomChoice(['hi', 'hey'], [1, 1])
/// ```
/// By https://github.com/kmorkos/dart_random_choice/blob/master/lib/dart_random_choice.dart ❤️
T randomChoice<T>(Iterable<T> options, [Iterable<double> weights = const []]) {
  if (options.isEmpty) {
    throw ArgumentError.value(
      options.toString(),
      'options',
      'must be non-empty',
    );
  }
  if (weights.isNotEmpty && options.length != weights.length) {
    throw ArgumentError.value(
      weights.toString(),
      'weights',
      'must be empty or match length of options',
    );
  }

  if (weights.isEmpty) {
    return options.elementAt(Random().nextInt(options.length));
  }

  final sum = weights.reduce((val, current) => val + current);
  var randomWeight = Random().nextDouble() * sum;

  var i = 0;
  for (final l = options.length; i < l; i++) {
    randomWeight -= weights.elementAt(i);
    if (randomWeight <= 0) {
      break;
    }
  }

  return options.elementAt(i);
}

/// Utility to return random items from a list
extension RandomListUtil<T> on List<T> {
  /// Returns a random item from this list.
  ///
  /// [weights] can be used to select an item according
  /// to a weighted distribution.
  ///
  /// Items with a higher weight will have a higher chance of being selected.
  ///
  /// [weights] must be empty or have the same length as this list.
  T randomItem([Iterable<double> weights = const []]) =>
      randomChoice(this, weights);
}
