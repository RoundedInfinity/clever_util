import 'package:clever_util/clever_util.dart';

void main(List<String> args) {
  // Working with Strings
  'hello world'.isNotBlank; // true
  '   '.isNotBlank; // false
  null.isNotBlank; // false
}
