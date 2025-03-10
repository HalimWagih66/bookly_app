import 'package:bookly_app/features/auth/log_in/view/login_view.dart';
import 'package:bookly_app/features/auth/sign_up/presentation/view/sign_up_view.dart';
import 'package:bookly_app/features/home/presentation/view/home_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/on_boarding/presentation/display_guides/presentation/view/on_boarding_pages.dart';

class AppRouter{
  static GoRouter appRouter = GoRouter(
    initialLocation: HomeView.routeName,
      routes: [
        GoRoute(
          path: OnBoardingPages.routeName,
          name: OnBoardingPages.routeName,
          builder: (context, state) => const OnBoardingPages(),
        ),
        GoRoute(
          path: SignUpView.routeName,
          name: SignUpView.routeName,
          builder: (context, state) => const SignUpView(),
        ),
        GoRoute(
          path: LoginView.routeName,
          name: LoginView.routeName,
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: HomeView.routeName,
          name: HomeView.routeName,
          builder: (context, state) => const HomeView(),
        ),
      ]
  );
}