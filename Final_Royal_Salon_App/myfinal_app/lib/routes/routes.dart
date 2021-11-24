import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myfinal_app/pages/client/client_main_page.dart';
import 'package:myfinal_app/pages/client/find_salon.dart/get_directions.dart';
import 'package:myfinal_app/pages/client/find_salon.dart/reviews.dart';
import 'package:myfinal_app/pages/client/find_salon.dart/services.dart';
import 'package:myfinal_app/pages/client/client_menu/inbox_client.dart';
import 'package:myfinal_app/pages/salon/salon_main_page.dart';
import 'package:myfinal_app/pages/salon/salon_menu/inbox_salon.dart';

import 'package:myfinal_app/pages/welcome_page/loading.dart';
import 'package:myfinal_app/pages/welcome_page/login.dart';
import 'package:myfinal_app/pages/welcome_page/register.dart';
import 'package:myfinal_app/pages/welcome_page/registersalon.dart';
import 'package:myfinal_app/pages/welcome_page/salonlogin.dart';
import 'package:myfinal_app/services/Promo_Addition.dart';

class RouteManager {
  static const String loginPage = '/';
  static const String salonloginPage = '/salonloginPage';
  static const String registerPage = '/registerPage';
  static const String registerSalonPage = '/registerSalonPage';
  static const String clientMainPage = '/clientMainPage';
  static const String salonMainPage = '/salonMainPage';
  static const String servicesPage = '/servicesPage';
  static const String reviewsPage = '/reviewsPage';
  static const String getDirectionsPage = '/getDirectionsPage';
  static const String addPromo = '/addPromo';
  static const String noBooking = '/noBooking';
  static const String inboxPage = '/inboxPage';
  static const String loadingPage = '/loadingPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
      case salonloginPage:
        return MaterialPageRoute(
          builder: (context) => const SalonLogin(),
        );

      case registerPage:
        return MaterialPageRoute(
          builder: (context) => const Register(),
        );
      case registerSalonPage:
        return MaterialPageRoute(
          builder: (context) => const RegisterSalon(),
        );

      case loadingPage:
        return MaterialPageRoute(
          builder: (context) => const Loading(),
        );
      case clientMainPage:
        return MaterialPageRoute(
          builder: (context) => const ClientMain(),
        );
      case salonMainPage:
        return MaterialPageRoute(
          builder: (context) => const SalonMain(),
        );

      case servicesPage:
        return MaterialPageRoute(
          builder: (context) => const Services(),
        );

      case reviewsPage:
        return MaterialPageRoute(
          builder: (context) => SalonReviews(),
        );

      case getDirectionsPage:
        return MaterialPageRoute(
          builder: (context) => GetDirections(),
        );
      case addPromo:
        return MaterialPageRoute(
          builder: (context) => PromoAdd(),
        );
      case noBooking:
        return MaterialPageRoute(
          builder: (context) => NoBookings(),
        );
      case inboxPage:
        return MaterialPageRoute(
          builder: (context) => AddSalonReviews(),
        );
      default:
        throw const FormatException('Route not found! Check routes again!');
    }
  }
}
