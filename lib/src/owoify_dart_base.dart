import 'package:owoify_dart/src/structures/word.dart';
import 'package:owoify_dart/src/utility/interleave_arrays.dart';
import 'package:owoify_dart/src/utility/presets.dart';

final WORD_REGEX = RegExp(r'\S+');
final SPACE_REGEX = RegExp(r'\s+');

/// The enumeration of available owoify levels.
enum OwoifyLevel { Owo, Uwu, Uvu }

/// The entry point of the `owoify` function.
/// The `owoify` function is implemented as a static function of this class.
class Owoifier {
  /// Convert source string to owoified string using specified OwoifyLevel (owoness).
  /// Three levels are available (from lowest to highest): OwoifyLevel.Owo, OwoifyLevel.Uwu, OwoifyLevel.Uvu
  static String owoify(String source, {OwoifyLevel level = OwoifyLevel.Owo}) {
    var wordMatches = WORD_REGEX.allMatches(source);
    var spaceMatches = SPACE_REGEX.allMatches(source);

    var words = wordMatches.map((e) => Word(e.group(0)));
    var spaces = spaceMatches.map((e) => Word(e.group(0)));

    words = words.map((e) {
      for (var f in SPECIFIC_WORD_MAPPING_LIST) {
        e = f(e);
      }
      switch (level) {
        case OwoifyLevel.Owo:
          for (var f in OWO_MAPPING_LIST) {
            e = f(e);
          }
          break;
        case OwoifyLevel.Uwu:
          for (var f in UWU_MAPPING_LIST) {
            e = f(e);
          }
          for (var f in OWO_MAPPING_LIST) {
            e = f(e);
          }
          break;
        case OwoifyLevel.Uvu:
          for (var f in UVU_MAPPING_LIST) {
            e = f(e);
          }
          for (var f in UWU_MAPPING_LIST) {
            e = f(e);
          }
          for (var f in OWO_MAPPING_LIST) {
            e = f(e);
          }
          break;
      }
      return e;
    });

    var result = interleaveArrays<Word>(words, spaces);
    var resultStrings = result.map((e) => e.toString());
    return resultStrings.join();
  }

  /// Convert source string to owoified string using OwoifyLevel.Uwu owoness level.
  static String uwuify(String source) {
    return owoify(source, level: OwoifyLevel.Uwu);
  }

  /// Convert source string to owoified string using OwoifyLevel.Uvu owoness level.
  static String uvuify(String source) {
    return owoify(source, level: OwoifyLevel.Uvu);
  }
}
