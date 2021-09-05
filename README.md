# owoify_dart
Turning your worst nightmare into a Dart package.

[![Dart CI](https://github.com/deadshot465/owoify_dart/actions/workflows/dart.yml/badge.svg)](https://github.com/deadshot465/owoify_dart/actions/workflows/dart.yml)

- [Dart package](https://pub.dev/packages/owoify_dart/)

This is a Dart port of [mohan-cao's owoify-js](https://github.com/mohan-cao/owoify-js), which will help you turn any string into nonsensical babyspeak similar to LeafySweet's infamous Chrome extension.

Just like my other Owoify ports, three levels of owoness are available:

1. **owo (default)**: The most vanilla one.
2. **uwu**: The moderate one.
3. **uvu**: Litewawwy unweadabwal.

Please refer to the original [owoify-js repository](https://github.com/mohan-cao/owoify-js) for more information.

Seriously, if you have seen my other ports, you probably have already known the details.

## Reason for development
Because [pub.dev](https://pub.dev/) doesn't have any owoify package. And since I have already ported it to several languages, I might as well just keep porting it.

## Install instructions
Add it to your `pubspec.yaml` file:
```yaml
dependencies:
  owoify_dart: ^2.0.0
```
And run this command in your command line:
```bash
pub get
```
Alternative, if you are using Flutter:
```bash
flutter pub get
```

## Usage
owoify_dart is implemented as a static function of the class `Owoifier`. That means you don't need to create an instance for the class; instead, just call the method `owoify` with the class name.
```dart
import 'package:owoify_dart/owoify_dart.dart';

void main() {
  print(Owoifier.owoify('This is the string to owo! Kinda cute isn\'t it?'));
  print(Owoifier.owoify('This is the string to owo! Kinda cute isn\'t it?', level: OwoifyLevel.Uvu));
}
```
Please refer to the example.

## Disclaimer
As usual, I'm writing this package for both practicing and bots' needs. Performance is **NOT** guaranteed.

That being said, all regular expressions are compiled beforehand rather than being compiled inside a function. That should be able to avoid the performance cost of building regular expressions every time the method is called.

## See also
- [owoify-js](https://github.com/mohan-cao/owoify-js) - The original owoify-js repository.
- [Owoify.Net](https://www.nuget.org/packages/Owoify.Net/1.0.1) - The C# port of Owoify written by me.
- [Owoify++](https://github.com/deadshot465/OwoifyCpp) - The C++ header-only port of Owoify written by me.
- [owoify_rs](https://crates.io/crates/owoify_rs) - The Rust port of Owoify written by me.
- [owoify-py](https://pypi.org/project/owoify-py/) - The Python port of Owoify written by me.
