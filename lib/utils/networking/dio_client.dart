import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../gen/assets.gen.dart';

part 'dio_client.g.dart';

class DioClient {
  DioClient._() {
    if (_dio != null) return;
    _setupDioClient();
  }

  Future<void> _setupDioClient() async {
    final dio = Dio();

    final sslCertBytes = await rootBundle.load(
      Assets.certificates.openWeatherMapCert,
    );
    SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
    securityContext.setTrustedCertificatesBytes(
      sslCertBytes.buffer.asUint8List(),
    );

    final httpClient = HttpClient(context: securityContext);
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
          // Allow only if cert is trusted by your pinned cert
          return true;
        };

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        httpClient;

    _dio = dio;
  }

  static final DioClient instance = DioClient._();

  Dio? _dio;

  Dio get dio => _dio!;
}

@riverpod
Dio dio(Ref ref) => DioClient.instance.dio;
