import 'dart:io';

import 'package:owoify_dart/owoify_dart.dart';
import 'package:test/test.dart';

void main() {
  group('A group of owoify tests', () {
    final source = 'Hello World! This is the string to owo! Kinda cute, isn\'t it?';
    final pokemonNameListPath = 'assets/pokemons.txt';
    final warAndPeacePath = 'assets/war_and_peace_chapter01-20.txt';
    final pokemonNameList = File(pokemonNameListPath).readAsLinesSync();
    final warAndPeaceText = File(warAndPeacePath).readAsStringSync();

    setUp(() {
    });

    test('Test owoify', () {
      expect(Owoifier.owoify(source), isNot(source));
    });

    test('Test owo', () {
      final text = Owoifier.owoify(source);
      expect(text, isNotEmpty);
      expect(text, isNotNull);
    });

    test('Test uwu', () {
      final text = Owoifier.owoify(source, level: OwoifyLevel.Uwu);
      expect(text, isNotEmpty);
      expect(text, isNotNull);
    });

    test('Test uvu', () {
      final text = Owoifier.owoify(source, level: OwoifyLevel.Uvu);
      expect(text, isNotEmpty);
      expect(text, isNotNull);
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

    test('Test pokemon names', () {
      pokemonNameList.forEach((element) {
        final textWithOwo = Owoifier.owoify(element);
        final textWithUwu = Owoifier.owoify(element, level: OwoifyLevel.Uwu);
        final textWithUvu = Owoifier.owoify(element, level: OwoifyLevel.Uvu);
        expect(textWithOwo, isNotEmpty);
        expect(textWithUwu, isNotEmpty);
        expect(textWithUvu, isNotEmpty);
        expect(textWithOwo, isNotNull);
        expect(textWithUwu, isNotNull);
        expect(textWithUvu, isNotNull);
      });
    });

    test('Test long text', () {
      final textWithOwo = Owoifier.owoify(warAndPeaceText);
      final textWithUwu = Owoifier.owoify(warAndPeaceText, level: OwoifyLevel.Uwu);
      final textWithUvu = Owoifier.owoify(warAndPeaceText, level: OwoifyLevel.Uvu);
      expect(textWithOwo, isNotEmpty);
      expect(textWithUwu, isNotEmpty);
      expect(textWithUvu, isNotEmpty);
      expect(textWithOwo, isNotNull);
      expect(textWithUwu, isNotNull);
      expect(textWithUvu, isNotNull);
    });
  });
}
