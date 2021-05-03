import 'package:owoify_dart/owoify_dart.dart';
import 'package:test/test.dart';

final source = 'Hello World! This is the string to owo! Kinda cute, isn\'t it?';

void main() {
  group('A group of owoify tests', () {
    Owoifier owoifier;

    setUp(() {
      owoifier = Owoifier();
    });

    test('Test owoify', () {
      expect(Owoifier.owoify(source), isNot(source));
    });

    test('Test owo', () {
      expect(Owoifier.owoify(source), isNotEmpty);
    });

    test('Test uwu', () {
      expect(Owoifier.owoify(source, level: OwoifyLevel.Uwu), isNotEmpty);
    });

    test('Test uvu', () {
      expect(Owoifier.owoify(source, level: OwoifyLevel.Uvu), isNotEmpty);
    });

    test('Test owo not equal to uwu', () {
      expect(Owoifier.owoify(source), isNot(Owoifier.owoify(source, level: OwoifyLevel.Uwu)));
    });

    test('Test owo not equal to uvu', () {
      expect(Owoifier.owoify(source), isNot(Owoifier.owoify(source, level: OwoifyLevel.Uvu)));
    });

    test('Test uwu not equal to uvu', () {
      expect(Owoifier.owoify(source, level: OwoifyLevel.Uwu), isNot(Owoifier.owoify(source, level: OwoifyLevel.Uvu)));
    });
  });
}
