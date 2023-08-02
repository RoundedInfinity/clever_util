// ignore_for_file: prefer_const_constructors
import 'package:clever_util/clever_util.dart';
import 'package:clever_util/src/lists.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:test/test.dart';

void main() {
  group('strings ', () {
    test('is blank', () {
      String? text;
      expect(' '.isBlank, isTrue);
      expect('ay'.isBlank, isFalse);
      expect(text.isBlank, isTrue);
    });
    test('is not blank', () {
      String? text;
      expect('hello '.isNotBlank, isTrue);
      expect(' '.isNotBlank, isFalse);
      expect(text.isNotBlank, isFalse);
    });

    test('trimmed', () {
      const text = ' This is my string   ';
      final trimmedString = text.trimmed;
      expect(trimmedString, isNotNull);
      expect(trimmedString, equals('This is my string'));
    });

    test('trimmed null', () {
      const text = '   ';
      final trimmedString = text.trimmed;
      expect(trimmedString, isNull);
    });
  });

  group('time', () {
    test('nextWeekday', () {
      final date = DateTime(2023, 06, 10);
      final nextTuesday = date.nextWeekday(DateTime.tuesday);
      final nextSaturday = date.nextWeekday(DateTime.saturday);

      expect(nextTuesday, equals(DateTime(2023, 06, 13)));
      expect(nextSaturday, equals(date));
    });
  });

  group('lists', () {
    test('isAllNull', () {
      final list = [null, null, null];

      final otherList = [null, 2, null];

      expect(list.isAllNull(), true);
      expect(otherList.isAllNull(), false);
    });

    test('isNothingNull', () {
      final list = [1, 2, 3];

      final otherList = [1, 2, null];

      expect(list.isNothingNull(), true);
      expect(otherList.isNothingNull(), false);
    });

    test('subsort', () {
      final persons = [
        _Person(name: 'Zed', age: 23),
        _Person(name: 'Amy', age: 34),
        _Person(name: 'Bert', age: 34),
        _Person(name: 'Ash', age: 24),
      ];

      // ignore: cascade_invocations
      persons.sort(
        subsort<_Person>(
          (p) => [p.age, p.name],
        ),
      );

      expect(
        persons,
        [
          _Person(name: 'Zed', age: 23),
          _Person(name: 'Ash', age: 24),
          _Person(name: 'Amy', age: 34),
          _Person(name: 'Bert', age: 34)
        ],
      );
    });
  });
}

@immutable
class _Person {
  const _Person({required this.name, required this.age});

  final String name;
  final int age;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _Person && other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}
