# Clever Util

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

A utility dart library that simplifies using many patterns.

## Usage

Import the library.

```dart
import 'package:clever_util/clever_util.dart';
```

Use the methods of the library.

```dart
void main(List<String> args) {
  // Working with Strings
  'hello world'.isNotBlank; // true
  '   '.isNotBlank; // false
  null.isNotBlank; // false
}
```

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
