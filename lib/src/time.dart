/// A faster way of calling [DateTime.now]
DateTime now() => DateTime.now();

/// Helper extension for Date extraction.
extension CleverDateUtil on DateTime {
  /// Returns the next weekday that is a [day].
  ///
  /// For example `nextWeekday(DateTime.tuesday)` returns the next date
  /// that is a tuesday.
  DateTime nextWeekday(int day) {
    return add(
      Duration(days: (day - weekday) % DateTime.daysPerWeek),
    );
  }
}
