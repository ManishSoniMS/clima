import '/controllers/location_controller.dart';
import '/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const Clima()));
}

class Clima extends ConsumerStatefulWidget {
  const Clima({super.key});

  @override
  ConsumerState createState() => _ClimaState();
}

class _ClimaState extends ConsumerState<Clima> {
  @override
  void didChangeDependencies() {
    getLocation();
    super.didChangeDependencies();
  }

  void getLocation() {
    Future.delayed(Duration(milliseconds: 1000)).then((_) {
      ref.read(locationControllerProvider.notifier).checkLocationPermission();
    });
  }

  @override
  Widget build(BuildContext context) {
    final routes = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'Clima',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routerConfig: routes,
    );
  }
}
