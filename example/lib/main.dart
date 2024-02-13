import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:simple_update_dialog/simple_update_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            PackageInfo packageInfo = await PackageInfo.fromPlatform();
            if (context.mounted) {
              SimpleUpdateDialog.showUpdateDialog(
                context: context,
                isForceUpdate: false,
                dialogConfig: DialogConfig(
                  appStoreUrl: 'https://flutter.dev/',
                  playStoreUrl: 'https://flutter.dev/',
                  currentVersion: packageInfo.version,
                  latestAndroidVersion: '1.0.1',
                  latestIOSVersion: '1.0.1',
                  minAndroidAppVerAllowed: '1.0.0',
                  minIOSAppVerAllowed: '1.0.0',
                ),
              );
            }
          },
          child: const Text("Show Update Dialog"),
        ),
      ),
    );
  }
}
