import 'package:flutter/foundation.dart';
import 'package:veeginine/services/api_location.dart';
import 'package:veeginine/services/location_sercicessss.dart';

class LocationProvider extends ChangeNotifier {
  String _address = 'Fetching location...';
  List<double>? _coordinates;
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';

  // Getters
  String get address => _address;
  List<double>? get coordinates => _coordinates;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;
  bool get hasLocation => _coordinates != null && _coordinates!.length >= 2;

  /// Initialize location - get current coordinates, address, and sync to backend
  Future<void> initLocation(String userId) async {
    _setLoadingState(true);

    try {
      final coords = await LocationService.getCurrentCoordinates();
      if (coords == null) throw Exception('Failed to get coordinates');
      _coordinates = coords;

      final fullAddress = await LocationService.getCurrentAddress();
      if (fullAddress == null ||
          fullAddress.contains('disabled') ||
          fullAddress.contains('denied') ||
          fullAddress.contains('not found')) {
        throw Exception(fullAddress ?? 'Failed to get address');
      }

      _address = _formatAddress(fullAddress);

      final success = await AddLocation().addOrUpdateLocation(
        userId: userId,
        latitude: _coordinates![0].toString(),
        longitude: _coordinates![1].toString(),
      );

      if (!success && kDebugMode) {
        print('⚠️ Failed to save location to server');
      }

      _setLoadingState(false);
    } catch (e) {
      _setErrorState(e.toString());
    }
  }

  /// Update location manually (e.g., from address search)
  Future<void> updateLocation(String newAddress, List<double> newCoordinates, String userId) async {
    _address = _formatAddress(newAddress);
    _coordinates = newCoordinates;
    _isLoading = false;
    _hasError = false;
    _errorMessage = '';

    final success = await AddLocation().addOrUpdateLocation(
      userId: userId,
      latitude: newCoordinates[0].toString(),
      longitude: newCoordinates[1].toString(),
    );

    if (!success && kDebugMode) {
      print('⚠️ Failed to update location on server');
    }

    notifyListeners();
  }

  /// Format full address into short display address
  String _formatAddress(String fullAddress) {
    if (fullAddress.isEmpty) return 'Unknown location';
    final parts = fullAddress
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
    return parts.length > 1 ? '${parts[0]}, ${parts[1]}' : parts.first;
  }

  /// Reset location state (e.g., on logout or refresh)
  void resetLocation() {
    _address = 'Fetching location...';
    _coordinates = null;
    _isLoading = true;
    _hasError = false;
    _errorMessage = '';
    notifyListeners();
  }

  /// Set loading state and notify
  void _setLoadingState(bool loading) {
    _isLoading = loading;
    _hasError = false;
    _errorMessage = '';
    notifyListeners();
  }

  /// Set error state and notify
  void _setErrorState(String message) {
    _isLoading = false;
    _hasError = true;
    _errorMessage = message;
    _address = 'Location not available';
    _coordinates = null;
    notifyListeners();
  }
}
