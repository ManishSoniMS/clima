import 'package:app_settings/app_settings.dart';
import '/utils/extensions/on_build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/location_controller.dart';

class NoPermissionScreen extends ConsumerWidget {
  const NoPermissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationController = ref.watch(locationControllerProvider);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.remove_moderator_outlined, size: 90),
              SizedBox(height: 20),
              Text('Oops', style: context.textTheme.headlineMedium),
              SizedBox(height: 10),
              Text(
                locationController.error.toString(),
                style: context.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  AppSettings.openAppSettings(
                    type: AppSettingsType.location,
                  ).then((_) {
                    ref
                        .read(locationControllerProvider.notifier)
                        .checkLocationPermission();
                  });
                },
                child: Text("Allow Location Permission"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
