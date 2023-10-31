import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ==== Shared Preferences initialization ==== \\\
SharedPreferences? pref;

/// === Home to Go Category === \\\
RxString globalCategoryID = "".obs;