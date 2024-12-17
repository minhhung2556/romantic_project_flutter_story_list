# Flutter Story List

A Flutter package to create Facebook's style Story List.

![Demo](./demo.gif)

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
[!] Flutter (Channel stable, 3.24.3, on Microsoft Windows [Version 10.0.19045.5131], locale en-US)
    • Flutter version 3.24.3 on channel stable at C:\Users\admin\fvm\default
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision 2663184aa7 (3 months ago), 2024-09-11 16:27:48 -0500
    • Engine revision 36335019a8
    • Dart version 3.5.3
    • DevTools version 2.37.3
```