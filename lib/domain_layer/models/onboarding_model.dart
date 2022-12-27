import 'package:pisti/presentation_layer/resources/assets_manager.dart';

class OnboardingModel {
  final String title;
  final String body;
  final String image;
  OnboardingModel(
      {required this.body, required this.image, required this.title});
}

List<OnboardingModel> onBoardingList = [
  OnboardingModel(
      title: "أحدث الازياء",
      body: "هناك الكثير من الأزياء لهذا الشتاء تجعلك تبدو رائعًا وبأسعار جيدة",
      image: ImageAssets.onboardingLogo1),
  OnboardingModel(
      title: "كل ما تحتاجه",
      body:
          "نحن نقدم ونساعدك على شراء كل ما تحتاجه في تطبيق واحد فقط: هواتف ، ملابس ، مكياج ...",
      image: ImageAssets.onboardingLogo2),
  OnboardingModel(
      title: "بيع منتجك",
      body: "إذا كنت بائعًا ولديك منتج تبيعه ، فيُرجى فتح متجر والبدء في البيع",
      image: ImageAssets.onboardingLogo3),
];
