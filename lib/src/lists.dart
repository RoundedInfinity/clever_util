/// Returns a comparator that sorts a list of objects of type [T] based on the
/// provided criteria function, which returns a list of [Comparable] objects.
///
/// The comparator function returned by this method will first compare the
/// objects based on the first element in the list of comparable values,
/// then the second, and so on, until all elements in the list have been
/// compared or two elements are found to be non-equal.
///
/// Example usage:
///
/// ```dart
/// List<Person> people = [...];
///
/// people.sort(subsort<Person>((p) => [p.age, p.name]));
/// ```
///
/// In this example, people are sorted based on their age (higher precedence),
/// and if two people have the same age, they are sorted based on their name.
Comparator<T> subsort<T>(
  List<Comparable<dynamic>> Function(T element) criteria,
) {
  return (T a, T b) {
    final aValues = criteria(a);
    final bValues = criteria(b);

    for (var i = 0; i < aValues.length; i++) {
      final result = aValues[i].compareTo(bValues[i]);
      if (result != 0) {
        return result;
      }
    }

    return 0;
  };
}
