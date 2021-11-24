import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:myfinal_app/routes/routes.dart';
import 'package:myfinal_app/services/user_service.dart';
import 'package:provider/provider.dart';

class InitApp {
  static const String apiKeyAndroid = '1118CA17-2AD7-4732-8FB9-051128837562';
  static const String apiKeyiOS = '934BE840-DBB3-431C-AF85-DD94F8D0F7B3';
  static const String appID = '26016784-3628-98DB-FF98-04D13E05D500';

  static void initializeApp(BuildContext context) async {
    await Backendless.initApp(
        applicationId: appID,
        iosApiKey: apiKeyiOS,
        androidApiKey: apiKeyAndroid);
    String result = await context.read<UserService>().checkIfUserLoggedIn();

    if (result == 'OK') {
      Navigator.pushReplacementNamed(context, RouteManager.clientMainPage);
    } else {
      Navigator.pushReplacementNamed(context, RouteManager.loginPage);
    }
  }
}
