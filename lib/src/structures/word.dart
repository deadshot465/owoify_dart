import 'dart:collection';

/// A wrapper class of a piece of string to owoify.
/// This class contains different replacement functions based on the given parameters.
/// This class also overrides toString() method for easier display.
class Word {
  final _replacedWords = HashSet<String>();
  var _word = '';

  Word(String word) {
    _word = word;
  }

  @override
  String toString() {
    return _word;
  }

  bool _searchValueContainsReplacedWords(
      RegExp searchValue, String replaceValue) {
    return _replacedWords.any((element) {
      if (searchValue.hasMatch(element)) {
        if (searchValue.firstMatch(element).groupCount > 0) {
          return element.replaceAllMapped(searchValue,
                  (match) => replaceValue.replaceAll('\\1', '${match[1]}')) ==
              replaceValue;
        } else {
          return element.replaceAll(searchValue, replaceValue) == replaceValue;
        }
      } else {
        return false;
      }
    });
  }

  /// Replacement function based on a simple regular expression and a replacing value.
  Word replace(RegExp searchValue, String replaceValue,
      {bool replaceReplacedWords = false}) {
    if (!replaceReplacedWords &&
        _searchValueContainsReplacedWords(searchValue, replaceValue)) {
      return this;
    }
    var replacingWord = _word;
    if (searchValue.hasMatch(_word)) {
      if (searchValue.firstMatch(_word).groupCount > 0) {
        replacingWord = _word.replaceAllMapped(searchValue,
            (match) => replaceValue.replaceAll('\\1', '${match[1]}'));
      } else {
        replacingWord = _word.replaceAll(searchValue, replaceValue);
      }
    }
    var collection = searchValue.allMatches(_word);
    var replacedWords = <String>[];
    if (collection.length > 1) {
      if (searchValue.firstMatch(_word).groupCount > 0) {
        replacedWords = collection
            .map((e) => e.group(0).replaceAllMapped(searchValue,
                (match) => replaceValue.replaceAll('\\1', '${match[1]}')))
            .toList();
      } else {
        replacedWords = collection
            .map((e) => e.group(0).replaceAll(e.group(0), replaceValue))
            .toList();
      }
    }
    if (replacingWord != _word) {
      for (var word in replacedWords) {
        _replacedWords.add(word);
      }
      _word = replacingWord;
    }
    return this;
  }

  /// Replacement function based on a regular expression and a block that receives nothing and returns a string.
  Word replaceWithFuncSingle(RegExp searchValue, String Function() func,
      {replaceReplacedWords = false}) {
    var replaceValue = func();
    if (!replaceReplacedWords &&
        _searchValueContainsReplacedWords(searchValue, replaceValue)) {
      return this;
    }
    var replacingWord = _word;
    if (searchValue.hasMatch(_word)) {
      var match = searchValue.firstMatch(_word).group(0);
      if (searchValue.firstMatch(_word).groupCount > 0) {
        replacingWord = _word.replaceAllMapped(searchValue,
            (match) => replaceValue.replaceAll('\\1', '${match[1]}'));
      } else {
        replacingWord = _word.replaceAll(match, replaceValue);
      }
    }
    var collection = searchValue.allMatches(_word);
    var replacedWords = <String>[];
    if (collection.length > 1) {
      if (searchValue.firstMatch(_word).groupCount > 0) {
        replacedWords = collection
            .map((e) => e.group(0).replaceAllMapped(searchValue,
                (match) => replaceValue.replaceAll('\\1', '${match[1]}')))
            .toList();
      } else {
        replacedWords = collection
            .map((e) => e.group(0).replaceAll(e.group(0), replaceValue))
            .toList();
      }
    }
    if (replacingWord != _word) {
      for (var word in replacedWords) {
        _replacedWords.add(word);
      }
      _word = replacingWord;
    }
    return this;
  }

  /// Replacement function based on a regular expression and a block that receives two strings and returns a string.
  Word replaceWithFuncMultiple(
      RegExp searchValue, String Function(String str1, String str2) func,
      {replaceReplacedWords = false}) {
    if (!searchValue.hasMatch(_word)) {
      return this;
    }
    var word = _word;
    var captures = searchValue.firstMatch(word);
    var replaceValue = func(captures.group(1), captures.group(2));
    if (!replaceReplacedWords &&
        _searchValueContainsReplacedWords(searchValue, replaceValue)) {
      return this;
    }
    var replacingWord = _word.replaceAll(captures.group(0), replaceValue);
    var collection = searchValue.allMatches(_word);
    var replacedWords = <String>[];
    if (collection.length > 1) {
      if (searchValue.firstMatch(_word).groupCount > 0) {
        replacedWords = collection
            .map((e) => e.group(0).replaceAllMapped(searchValue,
                (match) => replaceValue.replaceAll('\\1', '${match[1]}')))
            .toList();
      } else {
        replacedWords = collection
            .map((e) => e.group(0).replaceAll(e.group(0), replaceValue))
            .toList();
      }
    }
    if (replacingWord != _word) {
      for (var word in replacedWords) {
        _replacedWords.add(word);
      }
      _word = replacingWord;
    }
    return this;
  }
}
