import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_portfolio_app/features/home/presentation/home_screen.dart';
import 'package:flutter_portfolio_app/features/projects/presentation/projects_screen.dart';
import 'package:flutter_portfolio_app/features/skills/presentation/skills_screen.dart';
import 'package:flutter_portfolio_app/features/experience/presentation/experience_screen.dart';
import 'package:flutter_portfolio_app/features/contact/presentation/contact_screen.dart';
import 'package:flutter_portfolio_app/shared/widgets/main_scaffold.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
          ),
          GoRoute(
            path: '/projects',
            name: 'projects',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProjectsScreen(),
            ),
          ),
          GoRoute(
            path: '/skills',
            name: 'skills',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SkillsScreen(),
            ),
          ),
          GoRoute(
            path: '/experience',
            name: 'experience',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ExperienceScreen(),
            ),
          ),
          GoRoute(
            path: '/contact',
            name: 'contact',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ContactScreen(),
            ),
          ),
        ],
      ),
    ],
  );
});
