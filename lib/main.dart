import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/modules/auth/controllers/auth_controller.dart';
import 'package:mocar_test/app/providers/laravel_provider.dart';
import 'package:mocar_test/app/routes/theme1_app_pages.dart';
import 'package:mocar_test/app/services/driver_work_service.dart';
import 'package:mocar_test/app/services/global_service.dart';
import 'package:mocar_test/app/services/settings_service.dart';

void initServices() async {
  Get.log('starting services ...');
  await Get.put(AuthController());
  await Get.putAsync(() => GlobalService().init());
  await Get.putAsync(() => LaravelApiClient().init());
  await Get.putAsync(() => SettingsService().init());
  await Get.putAsync(() async => DriverWorkService().init());


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


