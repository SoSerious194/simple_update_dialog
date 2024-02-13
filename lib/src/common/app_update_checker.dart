import 'package:simple_update_dialog/src/common/enums.dart';

class AppUpdateChecker {
  // Function to convert version string to a list of integers
  List<int> parseVersion(String version) {
    return version.split('.').map(int.parse).toList();
  }

  // Function to compare version lists
  bool isVersionLessThan(List<int> version1, List<int> version2) {
    for (int i = 0; i < version1.length; i++) {
      if (version1[i] < version2[i]) return true;
      if (version1[i] > version2[i]) return false;
    }
    return false; // Equal
  }

  // Function to determine update requirement
  UpdateRequirement checkUpdateRequirement(
    String currentVersionStr,
    String minVersionStr,
    String latestVersionStr,
  ) {
    // Parse all versions
    final currentVersion = parseVersion(currentVersionStr);
    final minVersion = parseVersion(minVersionStr);
    final latestVersion = parseVersion(latestVersionStr);

    // Check compulsory update
    if (isVersionLessThan(currentVersion, minVersion)) {
      return UpdateRequirement.compulsory;
    }

    // Check optional update
    if (isVersionLessThan(currentVersion, latestVersion)) {
      return UpdateRequirement.optional;
    }

    return UpdateRequirement.none;
  }

  Future<UpdateRequirement> checkLatestVersion({
    required String currentVersion,
    required String latestAppVer,
    required String minAppVerAllowed,
  }) async {
    UpdateRequirement updateRequirement = checkUpdateRequirement(
      currentVersion,
      minAppVerAllowed,
      latestAppVer,
    );

    return updateRequirement;
  }
}
