import 'package:beta/view/home/screen/welcome.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../view/auth/Screen/Login.dart';
import '../view/auth/Screen/SignUp.dart';
import '../view/auth/Screen/forgetPassword.dart';
import '../view/auth/Screen/verifyCode.dart';
import '../view/creator/Screen/Quiz.dart';
import '../view/creator/Screen/editQuiz.dart';
import '../view/creator/Screen/pageQuiz.dart';
import '../view/creator/Screen/pageQuizzes.dart';
import '../view/home/screen/home.dart';
import '../view/player/screen/codeOfQuiz.dart';
import '../view/player/screen/finalScore.dart';
import '../view/player/screen/player.dart';
import '../core/middleware/authMiddleware.dart';
import '../core/setting/setting.dart';

class Pages {
  static List<GetPage> pages = [
    GetPage(name: "/home",           page: () =>   Home()),
    GetPage(name: "/quiz",           page: () =>   Quiz()),
    GetPage(name: "/pageOfQuiz",     page: () =>   PageOfQuiz()),
    GetPage(name: "/editQuiz",       page: () =>   EditQuiz()),
    GetPage(name: "/pageOfQuizzes",  page: () =>   PageOfQuizzes()),
    GetPage(name: "/codeOfQuiz",     page: () =>   CodeOfQuiz()),
    GetPage(name: "/player",         page: () =>   Player()),
    GetPage(name: "/finalScore",     page: () =>   FinalScore()),
    GetPage(name: "/setting",        page: () =>   Setting()),
    GetPage(name: "/welcome",        page: () =>   Welcome()),
    GetPage(name: "/verifyCode",     page: () =>   VerifyCode()),
    GetPage(name: "/forget",         page: () =>   Forget()),
    GetPage(name: "/signUp",         page: () =>   SignUp(),middlewares:[AuthMiddleware()]),
    GetPage(name: "/login",          page: () =>   Login(),middlewares: [AuthMiddleware()]),
  ] ;
}