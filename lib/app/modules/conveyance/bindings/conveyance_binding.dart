import 'package:get/get.dart';
import 'package:mocar_test/app/modules/conveyance/controllers/conveyance_photo_controller.dart';

class ConveyanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConveyancePhotoController>(
      () => ConveyancePhotoController(),
    );
  }
}
