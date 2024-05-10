import 'package:dictionary/app/navigation/app_route.dart';
import 'package:dictionary/app/ui/screens/add_new_word/add_new_word_screen.dart';
import 'package:dictionary/app/ui/screens/add_new_word/add_new_word_screen_view_model.dart';
import 'package:dictionary/app/ui/screens/definition/definition_screen.dart';
import 'package:dictionary/app/ui/screens/definition/definition_screen_view_model.dart';
import 'package:dictionary/app/ui/screens/home/home_screen.dart';
import 'package:dictionary/app/ui/screens/home/home_screen_view_model.dart';
import 'package:dictionary/app/ui/screens/result/result_screen.dart';
import 'package:dictionary/app/ui/screens/search_online/search_online_screen_view_model.dart';
import 'package:dictionary/app/ui/screens/search_online/search_online_screen.dart';
import 'package:dictionary/app/ui/screens/select_dictionary/select_dictionary_screen.dart';
import 'package:dictionary/app/ui/screens/select_dictionary/select_dictionary_screen_view_model.dart';
import 'package:dictionary/data/storage/dictionary_type_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: DictionaryTypeStorage().dictTypeKey == null
      ? AppRoute.selectDictionary
      : AppRoute.home,
  routes: [
    GoRoute(
      path: AppRoute.home,
      builder: (context, state) {
        return HomeScreen(
          viewModel: HomeScreenViewModel(),
        );
      },
      routes: [
        GoRoute(
          path: 'search-online',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: SearchOnlineScreen(
                viewmodel: SearchOnlineScreenViewModel(),
              ),
              transitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder: (_, a, sa, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                final tween = Tween(begin: begin, end: end);
                return SlideTransition(
                  position: tween.animate(a),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: 'add-new-word',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: AddNewWordScreen(
                viewModel: AddNewWordScreenViewModel(),
              ),
              transitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder: (_, a, sa, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                final tween = Tween(begin: begin, end: end);
                return SlideTransition(
                  position: tween.animate(a),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: 'result',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: ResultScreen(
                data: state.extra as ResultScreenData,
              ),
              transitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder: (_, a, sa, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                final tween = Tween(begin: begin, end: end);
                return SlideTransition(
                  position: tween.animate(a),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: 'definition',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: DefinitionScreen(
                viewModel: DefinitionScreenViewModel(),
              ),
              transitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder: (_, a, sa, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                final tween = Tween(begin: begin, end: end);
                return SlideTransition(
                  position: tween.animate(a),
                  child: child,
                );
              },
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: AppRoute.selectDictionary,
      builder: (context, state) {
        return SelectDictionaryScreen(
          viewModel: SelectDictionaryScreenViewModel(),
        );
      },
    ),
  ],
);
