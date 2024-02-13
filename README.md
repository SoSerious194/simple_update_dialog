<?code-excerpt path-base="example"?>

# simple_update_dialog

A simple package for showing a paltform-specific dialog to promote users to update the app.

## Usage

To use this plugin, add `simple_update_dialog` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

# Screenshots

<img src="https://ibb.co/R94kLkR" height="300px" alt="Screenshot"/>

<img src="https://ibb.co/8dDtrzp" height="300px" alt="Screenshot"/>

### Example

<?code-excerpt "lib/basic.dart (basic-example)"?>

```dart
import 'package:flutter/material.dart';
import 'package:simple_update_dialog/simple_update_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            SimpleUpdateDialog.showUpdateDialog(
              context: context,
              isForceUpdate: false,
              dialogConfig: DialogConfig(
                appStoreUrl: '',
                playStoreUrl: '',
                currentVersion: '1.0.0',
                latestAndroidVersion: '1.0.1',
                latestIOSVersion: '1.0.1',
                minAndroidAppVerAllowed: '1.0.0',
                minIOSAppVerAllowed: '1.0.0',
              ),
            );
          },
          child: const Text("Show Update Dialog"),
        ),
      ),
    );
  }
}
```

See the example app for better understanding.
