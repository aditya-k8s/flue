// import 'dart:async';
// import 'package:allohuggy/Service_provider/Utilities/shred_helper.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// Location location = Location();
// LocationData? currentLocation;
// Completer<GoogleMapController> _controller = Completer();
// // double? lat;
// // double? lng;
//
//
// class CurrentLocation  {
//   static getCurrentLocation() async {
//     location.getLocation().then(
//           (location) async {
//         currentLocation = location;
//         ShredHelper.lat = currentLocation!.latitude!;
//         ShredHelper.lng = currentLocation!.longitude!;
//         SharedPreferences preps = await SharedPreferences.getInstance();
//         preps.setString('lat', currentLocation!.latitude.toString());
//         preps.setString('lng', currentLocation!.longitude.toString());
//         print('preps lat ${ShredHelper.lat}');
//         print('preps lng ${ShredHelper.lng}');
//       },
//     );
//     GoogleMapController googleMapController = await _controller.future;
//     location.onLocationChanged.listen(
//           (newLoc) {
//         currentLocation = newLoc;
//         googleMapController.animateCamera(
//           CameraUpdate.newCameraPosition(
//             CameraPosition(
//               zoom: 13.5,
//               target: LatLng(
//                 newLoc.latitude!,
//                 newLoc.longitude!,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }






