/// Set crucial parameters for the dialog
class DialogConfig {
  /// AppStore page url of the app
  final String appStoreUrl;

  /// PlayStore page url of the app
  final String playStoreUrl;

  /// current version of your app
  /// you can use [package_info_plus] plugin to get the current version of your app
  final String currentVersion;

  /// latest version of the Android app
  final String latestAndroidVersion;

  /// latest version of the iOS app
  final String latestIOSVersion;

  /// the minimum app version decides whether to show
  /// an optional update dialog or a force update dialog
  /// if not set then this check will be ignored
  final String minAndroidAppVerAllowed;

  /// the minimum app version decides whether to show
  /// an optional update dialog or a force update dialog
  /// if not set then this check will be ignored
  final String minIOSAppVerAllowed;

  DialogConfig({
    required this.currentVersion,
    this.appStoreUrl = '',
    this.playStoreUrl = '',
    this.latestAndroidVersion = '0.0.0',
    this.latestIOSVersion = '0.0.0',
    this.minAndroidAppVerAllowed = '0.0.0',
    this.minIOSAppVerAllowed = '0.0.0',
  });
}
