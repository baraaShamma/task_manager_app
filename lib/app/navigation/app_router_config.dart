import 'package:go_router/go_router.dart';
import 'package:task_manager_app/app/navigation/app_route.dart';
import 'package:task_manager_app/features/auth/login/presentation/screen/login_screen.dart';
import 'package:task_manager_app/features/tasks/presentation/pages/tasks_pages.dart';

class AppRouterConfig {
  static final router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: RoutesPaths.login,
      routes: [
        GoRoute(
          path: RoutesPaths.login,
          name: RoutesNames.login,
          builder: (context, state) => const LoginScreen(),

        ),     GoRoute(
          path: RoutesPaths.tasksPage,
          name: RoutesNames.tasksPage,
          builder: (context, state) => const TasksPage(),
        ),

      ]);
}
