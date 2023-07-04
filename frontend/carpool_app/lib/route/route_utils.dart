import 'package:carpool_app/data/auth/auth_provider.dart';
import 'package:carpool_app/src/home/home.dart';
import 'package:carpool_app/src/navbar/navbar.dart';
import '../../src/auth/signin/signin_screen.dart';
import '../../src/splashScreen/splash_screen.dart';
import '../../src/welcomeScreen/welcome_screen.dart';
import '../data/user/user.dart';
import '../src/account/account_screen.dart';
import '../src/activity/activity_screen.dart';
import '../src/auth/number_register/number_register_screen.dart';
import '../src/profile/profile_details.dart';
import '../src/verfiynumber/verify_number_screen.dart';

final appRoutes = {
  splashRoute: (_) => const SplashScreen(),
  welcomeRoute: (_) => const WelcomeScreen(),
  signInRoute: (_) => const SignInScreen(),
  numberRegisterRoute: (_) => const NumberRegisterScreen(),
  verifyNumberRoute: (_) => VerifyNumberScreen(authProvider: AuthProviderController(),),
  navigationPageRoute: (_) => const NavigationBarScreen(),
  homePageRoute: (_) => HomeScreen(userController: UserController(),),
  activityPageRoute: (_) => const ActivityScreen(),
  accountPageRoute: (_) => AccountScreen(userController: UserController()),
  profileDetailPageRoute: (_) => const ProfileDetailsScreen(),
};

const String splashRoute = "/";
const String welcomeRoute = "/welcomePage";
const String signInRoute = "/signInPage";
const String numberRegisterRoute = "/NumberRegisterPage";
const String verifyNumberRoute = "/VerifyNumberPage";
const String navigationPageRoute = "/navigationPage";
const String homePageRoute = "/homePage";
const String activityPageRoute = "/activityPage";
const String accountPageRoute = "/accountPage";
const String profileDetailPageRoute = "/profileDetailPage";