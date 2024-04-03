import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testproj/core/service/service_container_main.dart';
import 'package:testproj/src/unbored/presentation/bloc/bored_api_bloc.dart';
import 'package:testproj/src/unbored/presentation/views/bored_messages_screen.dart';

Route<dynamic> ongenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case BoredMessagesScreen.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<BoredApiBloc>(),
          child: const BoredMessagesScreen(),
        ),
        settings: settings,
      );
    default:
      return _pageBuilder(
        (_) => const BoredMessagesScreen(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
