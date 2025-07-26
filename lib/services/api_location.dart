// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class LocationServicesssss {
//   final String baseUrl = 'https://vegie9-backend-01.onrender.com/api';

//   // Add location to server
//   Future<bool> addLocation(String userId, String latitude, String longitude) async {
//     try {
//             print('heloooooooooooooooooooooooooooooooooooohhhhhhhhhhhhhhhhhhhhhhhhhhhhh$userId');

//       print('heloooooooooooooooooooooooooooooooooooohhhhhhhhhhhhhhhhhhhhhhhhhhhhh$latitude');
//             print('heloooooooooooooooooooooooooooooooooooohhhhhhhhhhhhhhhhhhhhhhhhhhhhh$longitude');

//       final response = await http.put(
//         Uri.parse('$baseUrl/location/$userId'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'latitude': double.parse(latitude), 
//           'longitude': double.parse(longitude)
//         }),
//       );

//             print('heloooooooooooooooooooooooooooooooooooohhhhhhhhhhhhhhhhhhhhhhhhhhhhh${response.statusCode}');


//       if (response.statusCode == 200 || response.statusCode == 200) {
//         return true;
//       } else {
//         print('Failed to add location. Status code: ${response.statusCode}');
//         print('Response body: ${response.body}');
//         return false;
//       }
//     } catch (e) {
//       print('Error adding location: $e');
//       return false;
//     }
//   }
// }






import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:veeginine/constants/api_constants.dart';

class AddLocation {
  /// Add or update user location
  Future<bool> addOrUpdateLocation({
    required String userId,
    required String latitude,
    required String longitude,
  }) async {
    try {
      final uri = Uri.parse(ApiConstants.userLocation(userId));
      final response = await http.put(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'latitude': double.parse(latitude),
          'longitude': double.parse(longitude),
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('❌ Failed to save location. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('❌ Exception while saving location: $e');
      return false;
    }
  }
}
