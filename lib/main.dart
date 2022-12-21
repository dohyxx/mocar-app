import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mocar_test/app/modules/auth/controllers/auth_controller.dart';
import 'package:mocar_test/app/providers/laravel_provider.dart';
import 'package:mocar_test/app/routes/theme1_app_pages.dart';
import 'package:mocar_test/app/services/auth_service.dart';
import 'package:mocar_test/app/services/driver_work_service.dart';
import 'package:mocar_test/app/services/global_service.dart';
import 'package:mocar_test/app/services/settings_service.dart';

void initServices() async {
  Get.log('starting services ...');
  await Get.putAsync(() async => AuthService().init());
  await Get.put(AuthController());
  await Get.put(AuthService());
  await Get.putAsync(() async => GlobalService().init());
  await Get.putAsync(() async => LaravelApiClient().init());
  await Get.putAsync(() async => SettingsService().init());
  await Get.putAsync(() async => DriverWorkService().init());

  GetStorage _box = new GetStorage();

  if(_box.read('remember_checked').toString().isEmpty) {
    _box.write('remember_checked', false);
    Get.log('isRememberMe value in empty if: '+_box.read('remember_checked').toString());
  }
  if(_box.read('remember_checked').toString() == 'false'){
    Get.find<AuthService>().removeCurrentUser();
    Get.log('isRememberMe value in false if: '+_box.read('remember_checked').toString());
  }

  Get.log('All services started...');
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(
    GetMaterialApp(
      title: 'Mocar',
      initialRoute: Theme1AppPages.INITIAL,
      onReady: () async {

      },
      getPages: Theme1AppPages.routes,
      // localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
    ),
  );
}


