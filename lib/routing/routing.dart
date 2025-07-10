import '/controllers/location_controller.dart';
import '/screen/loading_screen.dart';
import '/screen/location_screen.dart';
import '/screen/no_permission_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routing.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  final locationController = ref.watch(locationControllerProvider);

  print("location is rebuilding ");
  GoRouter _router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      if (locationController.hasValue) {
        return '/location';
      }
      if (locationController.hasError) {
        return '/no-permission';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'Splash',
        builder: (context, state) => LoadingScreen(),
      ),

      GoRoute(
        path: '/location',
        name: 'Location',
        builder: (context, state) => LocationScreen(),
      ),

      GoRoute(
        path: '/no-permission',
        name: 'No Permission',
        builder: (context, state) => NoPermissionScreen(),
      ),
    ],
  );

  return _router;
}
