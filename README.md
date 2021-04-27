# Flutter Story List

A Flutter package to create Facebook's style Story List.

![Imgur](https://imgur.com/download/KOCBxXR)

### Example

```dart
import 'package:flutter_story_list/flutter_story_list.dart';

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
	    child: Column(
	      children: [
	        StoryList(
	          onPressedIcon: () {
	            //TODO something
	          },
	          image: <Your Image>,
	          text: <Your Text>,
	          itemCount: <Your Item count>,
	          itemBuilder: (context, index) => <Your Item>,
	        ),
	      ],
	    ),
    );
  }
}
```

### Development environment

```
[✓] Flutter (Channel stable, 1.22.6, on macOS 11.2.3 20D91 darwin-x64, locale en-VN)
    • Flutter version 1.22.6
    • Framework revision 9b2d32b605 (3 months ago), 2021-01-22 14:36:39 -0800
    • Engine revision 2f0af37152
    • Dart version 2.10.5

[✓] Android toolchain - develop for Android devices (Android SDK version 30.0.3)
    • Platform android-30, build-tools 30.0.3
    • Java binary at: /Applications/Android Studio.app/Contents/jre/jdk/Contents/Home/bin/java
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b3-6915495)
    • All Android licenses accepted.

[✓] Xcode - develop for iOS and macOS (Xcode 12.4)
    • Xcode at /Applications/Xcode_12.app/Contents/Developer
    • Xcode 12.4, Build version 12D4e
    • CocoaPods version 1.10.1

[✓] Android Studio (version 4.1)
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin installed
    • Dart plugin version 201.9317
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b3-6915495)
```