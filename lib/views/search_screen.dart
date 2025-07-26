// // location_search_screen.dart
// import 'package:car_rental_app/controllers/search_controller.dart';
// import 'package:car_rental_app/providers/location_provider.dart';
// import 'package:car_rental_app/utils/storage_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_places_flutter/google_places_flutter.dart';
// import 'package:google_places_flutter/model/prediction.dart';
// import 'package:provider/provider.dart';

// class LocationSearchScreen extends StatefulWidget {
//   final String? userId;
//   const LocationSearchScreen({Key? key,  required this.userId}) : super(key: key);

//   @override
//   State<LocationSearchScreen> createState() => _LocationSearchScreenState();
// }

// class _LocationSearchScreenState extends State<LocationSearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   final FocusNode _focusNode = FocusNode();
//   bool _isLoadingCurrentLocation = false;
//   String? userId;

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData;
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (mounted) {
//         _focusNode.requestFocus();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     _focusNode.dispose();
//     super.dispose();
//   }

//     Future<void> _loadUserData() async {
//       print("ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo");

//     try {
//              print('uuuuuuuuuuuuuuuuuuuuuuuuuuuu$userId');

//        userId = await StorageHelper.getUserId();

//        print('uuuuuuuuuuuuuuuuuuuuuuuuuuuu$userId');

//       if (userId != null) {
//         setState(() {
//           userId = userId;
//         });
//       } 
//     } catch (e) {
//       setState(() {
//         userId = '';
//       });

//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text('Failed to load invite code: ${e.toString()}')),
//         );
//       }
//     }
//   }

//   void _showError(String message) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red,
//         duration: const Duration(seconds: 3),
//       ),
//     );
//   }

//   Future<void> _handleCurrentLocation() async {
//     setState(() {
//       _isLoadingCurrentLocation = true;
//     });

//     try {
//       final locationProvider = Provider.of<LocationProvider>(context, listen: false);
//       await locationProvider.initLocation(widget.userId.toString());
      
//       if (mounted) {
//         if (locationProvider.hasError) {
//           _showError(locationProvider.errorMessage);
//         } else {
//           // Location updated successfully, go back
//           Navigator.pop(context);
//         }
//       }
//     } catch (e) {
//       if (mounted) {
//         _showError("Failed to get current location: ${e.toString()}");
//       }
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isLoadingCurrentLocation = false;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             appBar: AppBar(
//         // backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: Padding(
//           padding: EdgeInsets.only(
//               left: 8.0,
//               top: 6.0,
//               bottom: 6.0), // Adjusted padding for larger circle
//           child: Container(
//             width: 44, // Fixed width for larger circle
//             height: 44, // Fixed height for larger circle
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200,
//               shape: BoxShape.circle,
//             ),
//             child: IconButton(
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//                 size: 28, // Increased icon size
//               ),
//               onPressed: () => Navigator.pop(context),
//             ),
//           ),
//         ),
//         title: Text(
//           "Search Location",
//           style: TextStyle(
//             // color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w800,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Current Location Button
//           Container(
//             margin: const EdgeInsets.all(16),
//             child: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 onTap: _isLoadingCurrentLocation ? null : _handleCurrentLocation,
//                 borderRadius: BorderRadius.circular(12),
//                 child: Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.blue.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(
//                       color: Colors.blue.withOpacity(0.3),
//                       width: 1,
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: const Icon(
//                           Icons.my_location,
//                           color: Colors.white,
//                           size: 20,
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Use Current Location",
//                               style: GoogleFonts.inter(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.blue,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               "Automatically detect your location",
//                               style: GoogleFonts.inter(
//                                 fontSize: 14,
//                                 color: Colors.grey[600],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       if (_isLoadingCurrentLocation)
//                         const SizedBox(
//                           width: 20,
//                           height: 20,
//                           child: CircularProgressIndicator(
//                             strokeWidth: 2,
//                           ),
//                         )
//                       else
//                         Icon(
//                           Icons.arrow_forward_ios,
//                           size: 16,
//                           color: Colors.grey[400],
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           // Divider with "OR" text
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: [
//                 Expanded(child: Divider(color: Colors.grey[300])),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Text(
//                     "OR",
//                     style: GoogleFonts.inter(
//                       fontSize: 14,
//                       color: Colors.grey[600],
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 Expanded(child: Divider(color: Colors.grey[300])),
//               ],
//             ),
//           ),

//           const SizedBox(height: 16),

//           // Search Field
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 16),
//             child: GooglePlaceAutoCompleteTextField(
//               textEditingController: _searchController,
//               focusNode: _focusNode,
//               googleAPIKey: "AIzaSyAPMFLGBh4sKpin2wmqGdni5Z00hnh33U8", // Replace with your API key
//               inputDecoration: InputDecoration(
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 16,
//                 ),
//                 hintText: "Search for area, street name...",
//                 hintStyle: GoogleFonts.inter(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 16,
//                   color: Colors.grey[500],
//                 ),
//                 prefixIcon: Icon(
//                   Icons.search,
//                   color: Colors.grey[500],
//                   size: 24,
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey[50],
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(color: Colors.grey[300]!),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(color: Colors.grey[300]!),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: const BorderSide(color: Colors.blue, width: 2),
//                 ),
//               ),
//               debounceTime: 600,
//               countries: const ["in"], // Change this to your country
//               isLatLngRequired: true,
//               getPlaceDetailWithLatLng: (Prediction prediction) async {
//                 try {
//                   final latStr = prediction.lat ?? '0';
//                   final lngStr = prediction.lng ?? '0';
//                   final latitude = double.tryParse(latStr) ?? 0.0;
//                   final longitude = double.tryParse(lngStr) ?? 0.0;
//                   final address = prediction.description ?? 'Unknown location';

//                   if (latitude == 0.0 && longitude == 0.0) {
//                     throw Exception('Invalid coordinates received');
//                   }

//                   // Update LocationProvider instead of LocationController
//                   if (mounted) {
//                     final locationProvider = Provider.of<LocationProvider>(context, listen: false);
                    
//                     // Format address to show only essential parts (similar to initLocation)
//                     List<String> parts = address.split(',');
//                     String trimmedAddress = parts.length > 1 
//                         ? parts.sublist(0, 2).join(',').trim() 
//                         : address;
                    
//                     await locationProvider.updateLocation(
//                       trimmedAddress,
//                       [latitude, longitude],
//                       widget.userId.toString()
//                     );

//                     // Navigate back
//                     Navigator.pop(context);
//                   }
//                 } catch (e) {
//                   debugPrint("Error parsing coordinates: $e");
//                   if (mounted) {
//                     _showError("Error selecting location. Please try again.");
//                   }
//                 }
//               },
//               itemClick: (Prediction prediction) {
//                 _searchController.text = prediction.description ?? "";
//                 _searchController.selection = TextSelection.fromPosition(
//                   TextPosition(offset: prediction.description?.length ?? 0),
//                 );
//               },
//               seperatedBuilder: const Divider(height: 1),
//               itemBuilder: (context, index, Prediction prediction) {
//                 return Container(
//                   padding: const EdgeInsets.all(16),
//                   child: Row(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[100],
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Icon(
//                           Icons.location_on,
//                           color: Colors.grey[600],
//                           size: 20,
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               prediction.description ?? "Unknown location",
//                               style: GoogleFonts.inter(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black87,
//                               ),
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             if (prediction.structuredFormatting?.secondaryText != null)
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 4),
//                                 child: Text(
//                                   prediction.structuredFormatting!.secondaryText!,
//                                   style: GoogleFonts.inter(
//                                     fontSize: 14,
//                                     color: Colors.grey[600],
//                                   ),
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                       Icon(
//                         Icons.arrow_outward,
//                         size: 16,
//                         color: Colors.grey[400],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               isCrossBtnShown: true,
//             ),
//           ),

//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:provider/provider.dart';
import 'package:veeginine/helper/storage_helper.dart';
import 'package:veeginine/providers/location_provider.dart';

class LocationSearchScreen extends StatefulWidget {
  final String? userId;
  const LocationSearchScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<LocationSearchScreen> createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isLoadingCurrentLocation = false;
  String? userId;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    print("Loading user data in LocationSearchScreen...");
    try {
      print('Current widget userId: ${widget.userId}');
      userId = await UserPreferences.getUser()?.userId;
      print('StorageHelper userId: $userId');

      if (userId != null) {
        setState(() {
          userId = userId;
        });
      }
    } catch (e) {
      setState(() {
        userId = widget.userId ?? '';
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load user ID: ${e.toString()}')),
        );
      }
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> _handleCurrentLocation() async {
    setState(() {
      _isLoadingCurrentLocation = true;
    });

    try {
      final locationProvider = Provider.of<LocationProvider>(context, listen: false);
      await locationProvider.initLocation(userId ?? widget.userId.toString());

      if (mounted) {
        if (locationProvider.hasError) {
          _showError(locationProvider.errorMessage);
        } else {
          // Location updated successfully, show success message and go back
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Current location detected successfully!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
          
          // Return with success indicator
          Navigator.pop(context, true);
        }
      }
    } catch (e) {
      if (mounted) {
        _showError("Failed to get current location: ${e.toString()}");
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingCurrentLocation = false;
        });
      }
    }
  }

  Future<void> _handleLocationSelection(Prediction prediction) async {
    try {
      final latStr = prediction.lat ?? '0';
      final lngStr = prediction.lng ?? '0';
      final latitude = double.tryParse(latStr) ?? 0.0;
      final longitude = double.tryParse(lngStr) ?? 0.0;
      final address = prediction.description ?? 'Unknown location';

      if (latitude == 0.0 && longitude == 0.0) {
        throw Exception('Invalid coordinates received');
      }

      // Update LocationProvider
      if (mounted) {
        final locationProvider = Provider.of<LocationProvider>(context, listen: false);

        // Format address to show only essential parts (similar to initLocation)
        List<String> parts = address.split(',');
        String trimmedAddress = parts.length > 1
            ? parts.sublist(0, 2).join(',').trim()
            : address;

        await locationProvider.updateLocation(
          trimmedAddress,
          [latitude, longitude],
          userId ?? widget.userId.toString(),
        );

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Location updated to: ${trimmedAddress.split(',')[0]}'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );

        // Small delay to show the message
        await Future.delayed(const Duration(milliseconds: 500));

        // Navigate back with success indicator
        Navigator.pop(context, true);
      }
    } catch (e) {
      debugPrint("Error parsing coordinates: $e");
      if (mounted) {
        _showError("Error selecting location. Please try again.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 6.0, bottom: 6.0),
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 28,
              ),
              onPressed: () => Navigator.pop(context, false), // Return false to indicate no change
            ),
          ),
        ),
        title: const Text(
          "Search Location",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Current Location Button
          Container(
            margin: const EdgeInsets.all(16),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _isLoadingCurrentLocation ? null : _handleCurrentLocation,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.blue.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.my_location,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Use Current Location",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Automatically detect your location",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_isLoadingCurrentLocation)
                        const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      else
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey[400],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Divider with "OR" text
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(child: Divider(color: Colors.grey[300])),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "OR",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(child: Divider(color: Colors.grey[300])),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Search Field
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: GooglePlaceAutoCompleteTextField(
              textEditingController: _searchController,
              focusNode: _focusNode,
              googleAPIKey: "AIzaSyAPMFLGBh4sKpin2wmqGdni5Z00hnh33U8", // Replace with your API key
              inputDecoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                hintText: "Search for area, street name...",
                hintStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.grey[500],
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[500],
                  size: 24,
                ),
                filled: true,
                fillColor: Colors.grey[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
              ),
              debounceTime: 600,
              countries: const ["in"], // Change this to your country
              isLatLngRequired: true,
              getPlaceDetailWithLatLng: (Prediction prediction) async {
                await _handleLocationSelection(prediction);
              },
              itemClick: (Prediction prediction) {
                _searchController.text = prediction.description ?? "";
                _searchController.selection = TextSelection.fromPosition(
                  TextPosition(offset: prediction.description?.length ?? 0),
                );
              },
              seperatedBuilder: const Divider(height: 1),
              itemBuilder: (context, index, Prediction prediction) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.grey[600],
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              prediction.description ?? "Unknown location",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (prediction.structuredFormatting?.secondaryText != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  prediction.structuredFormatting!.secondaryText!,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_outward,
                        size: 16,
                        color: Colors.grey[400],
                      ),
                    ],
                  ),
                );
              },
              isCrossBtnShown: true,
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}