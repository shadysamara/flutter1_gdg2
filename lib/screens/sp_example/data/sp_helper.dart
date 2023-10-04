import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  late SharedPreferences sp;
  initSp() async {
    // create connection with sharedprefrences file
    sp = await SharedPreferences.getInstance();
  }

  saveName(String name) async {
    await sp.setString("name", name);
  }

/*
<name> omar </name>

*/
  String? getName() {
    return sp.getString("name");
  }

  updateName(String newName) {
    sp.setString("name", newName);
  }

  deleteName() {
    sp.remove("name");
  }
}
