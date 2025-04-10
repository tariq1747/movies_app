import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  final _connectivity = Connectivity();
  final _controller = StreamController<ConnectivityResult>();
  final isConnected = false.obs;
  StreamSubscription<ConnectivityResult>? _subscription;

  Stream<ConnectivityResult> get connectivityStream => _controller.stream;

  @override
  void onInit() {
    super.onInit();
    _subscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
    _checkInitialConnection();
  }

  Future<void> _checkInitialConnection() async {
    final result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    isConnected.value = result != ConnectivityResult.none;
    _controller.add(result);

    if (!isConnected.value) {
      Get.snackbar(
        'No Internet Connection',
        'Please check your internet connection',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
  }

  bool get hasConnection => isConnected.value;

  @override
  void onClose() {
    _subscription?.cancel();
    _controller.close();
    super.onClose();
  }
}
