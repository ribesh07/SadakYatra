import 'package:sadakyatra/main.dart';
import 'package:sadakyatra/payments/khalti-pay.dart';

class AppRoute {
  AppRoute._();

  static const String homeRoute = '/';
  static const String cartRoute = '/cart';
  static const String khaltiRoute = '/khalti-pay';
  

  static getAppRoutes() {
    return {
      homeRoute: (context) => const MyHomePage(),
      khaltiRoute: (context) => const PaymentKhalti()   
       };
  }
}