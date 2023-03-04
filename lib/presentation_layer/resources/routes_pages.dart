import 'package:get/get.dart';
import 'package:pisti/domain_layer/midelware/midelware.dart';
import 'package:pisti/presentation_layer/resources/routes_manager.dart';
import 'package:pisti/presentation_layer/screen/Shipping_info_screen/Shipping_info_screen.dart';
import 'package:pisti/presentation_layer/screen/address_screen/address_screen.dart';
import 'package:pisti/presentation_layer/screen/authentication_screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:pisti/presentation_layer/screen/authentication_screen/login_screen/login_screen.dart';
import 'package:pisti/presentation_layer/screen/authentication_screen/otp_screen/otp_screen.dart';
import 'package:pisti/presentation_layer/screen/authentication_screen/reset_password_screen/reset_password_screen.dart';
import 'package:pisti/presentation_layer/screen/authentication_screen/reset_password_screen/sucss_screen.dart';
import 'package:pisti/presentation_layer/screen/authentication_screen/signup_screen/signup_screen.dart';
import 'package:pisti/presentation_layer/screen/cart_screen/cart_screen.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/control_board_screen.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/screens/add_product_screen/add_product_screen.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/screens/card_support_screen/card_support_screen.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/screens/coupon_screen/coupon_screen.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/screens/notification_list_screen/notification_list_screen.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/screens/order_list_screen/order_list_screen.dart';
import 'package:pisti/presentation_layer/screen/control_board_screen/screens/profile_personly_screen/profile_personly_screen.dart';
import 'package:pisti/presentation_layer/screen/favourite_screen/favourite_screen.dart';
import 'package:pisti/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:pisti/presentation_layer/screen/initialpage_screen/onboarding_screen/onboarding_screen.dart';
import 'package:pisti/presentation_layer/screen/initialpage_screen/welcom_screen/welcom_screen.dart';
import 'package:pisti/presentation_layer/screen/more_product/more_product.dart';
import 'package:pisti/presentation_layer/screen/product_detalis/product_detalis_screen.dart';
import 'package:pisti/presentation_layer/screen/support_screen/support_account_screen.dart';
import 'package:pisti/presentation_layer/screen/support_screen/support_problem_account_screen.dart';

List<GetPage<dynamic>>? getPage = [
  GetPage(
      name: Routes.welcomRoute,
      page: () => const WelcomeScreen(),
      middlewares: [
        Midelware(),
      ]),
  GetPage(
    name: Routes.loginRoute,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: Routes.onBoardingRoute,
    page: () => const OnboardingScreen(),
  ),
  GetPage(
    name: Routes.registerRoute,
    page: () => const SignupScreen(),
  ),
  GetPage(
    name: Routes.forgotPasswordRoute,
    page: () => const ForgotPasswordScreen(),
  ),
  GetPage(
    name: Routes.resetPasswordRoute,
    page: () => const ResetPasswordScreen(),
  ),
  GetPage(
    name: Routes.otpRoute,
    page: () => OtpScreen(),
  ),
  GetPage(
    name: Routes.sucssRoute,
    page: () => const SucssScreen(),
  ),
  GetPage(
    name: Routes.homeRoute,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: Routes.productDetailsRoute,
    page: () => const ProductDetalisScreen(),
  ),
  GetPage(
    name: Routes.cart,
    page: () => const CartScreen(),
  ),
  GetPage(
    name: Routes.moreproduct,
    page: () => const MoreProductScreen(),
  ),
  GetPage(
    name: Routes.shippingInfoRoute,
    page: () => const ShippingInfoScreen(),
  ),
  GetPage(
    name: Routes.addressScreen,
    page: () => const AddressScreen(),
  ),
  GetPage(
    name: Routes.profilePersonlyScreen,
    page: () => ProfilePersonlyScreen(),
  ),
  GetPage(
    name: Routes.controlBoardRoute,
    page: () => const ControlBoardScreen(),
  ),
  GetPage(
    name: Routes.editProfileRoute,
    page: () => const EditProfileScreen(),
  ),
  GetPage(
    name: Routes.addProductScreen,
    page: () => const AddProductScreen(),
  ),
  GetPage(
    name: Routes.notificationlistRoute,
    page: () => const NotificationListScreen(),
  ),
  GetPage(
    name: Routes.favouriteScreen,
    page: () => const FavouriteScreen(),
  ),
  GetPage(
    name: Routes.orderListScreen,
    page: () => const OrderListScreen(),
  ),
  GetPage(
    name: Routes.couponRoute,
    page: () => const CouponScreen(),
  ),
  GetPage(
    name: Routes.supportAccountScreen,
    page: () => const SupportAccountScreen(),
  ),
  GetPage(
    name: Routes.supportProblemScreen,
    page: () => const SupportProblemScreen(),
  ),
  GetPage(
    name: Routes.cardSupportScreen,
    page: () => const CardSupportScreen(),
  ),
];
