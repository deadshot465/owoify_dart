import 'package:owoify_dart/owoify_dart.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    Owoifier owoifier;

    setUp(() {
      owoifier = Owoifier();
    });

    test('First Test', () {
      expect(Owoifier.owoify('Hello World!'), isNotEmpty);
    });
  });
}
