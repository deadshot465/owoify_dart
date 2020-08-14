import 'package:owoify_dart/owoify_dart.dart';

void main() {
  print(Owoifier.owoify('This is the string to owo! Kinda cute isn\'t it?'));
  print(Owoifier.owoify('This is the string to owo! Kinda cute isn\'t it?',
      level: OwoifyLevel.Uvu));
  print(
      Owoifier.owoify('Yoichi is no one\'s favorite.', level: OwoifyLevel.Uvu));
}
