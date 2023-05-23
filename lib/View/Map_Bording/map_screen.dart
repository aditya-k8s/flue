import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../Resources/colors.dart';
import 'package:geolocator/geolocator.dart';

import '../../Utilities/Routes/routes.dart';
import '../../View_Model_Data/user_prefences.dart';




class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  ///map
  late Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  String? _currentAddress;
  Position? _currentPosition;

  @override
  void initState(){
    _getCurrentPosition();
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
         const ImageConfiguration(size: Size(10.0,1.5)), "image/Location.png")
        .then(
          (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }


  @override
  void dispose(){
    _controller = Completer();
    super.dispose();
  }



  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
        _currentPosition = position;
        UserPrefences.lat = _currentPosition!.latitude;
        UserPrefences.lng = _currentPosition!.longitude;
        SharedPreferences preps = await SharedPreferences.getInstance();
        preps.setString('lat', _currentPosition!.latitude.toString());
        preps.setString('lng', _currentPosition!.longitude.toString());
        print('preps lat ${UserPrefences.lat}');
        print('preps lng ${UserPrefences.lng}');
        setState(()  { });
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: UserPrefences.feedType =="USER"?
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorX.textColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8.w)
                )
              ),
              child:
              _currentPosition==null?
              Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Image.asset('image/Basemap image.png',fit: BoxFit.cover,height: 40.h,width: 90.w,),
                     )
                  : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                height: 41.h,
                width: 90.w,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8.w),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      heightFactor: 0.3,
                      widthFactor: 2.5,
                      child: GoogleMap(
                        initialCameraPosition:CameraPosition(target: LatLng(_currentPosition!.latitude,_currentPosition!.longitude),  zoom: 15,),
                        mapType: mapType,
                        markers: {
                          Marker(
                            markerId: const MarkerId("marker1"),
                            position:  LatLng(_currentPosition!.latitude,_currentPosition!.longitude),
                            icon: markerIcon,
                          )
                        },
                        /*onMapCreated: (mapController)async{
                          _controller.complete(mapController);
                        },*/
                      ),
                    ),
                ),
              ),
                  )
            ),
          ),
          Center(child: Text('Hi, nice to meet you!',style: GoogleFonts.poppins(color: ColorX.blackX,fontWeight: FontWeight.w700,fontSize: 21),)),
          Center(child: Text('Provide your location to us.',textAlign: TextAlign.justify,style: GoogleFonts.quicksand(color: ColorX.darkBlue,fontWeight: FontWeight.w700,fontSize: 16))),
          Center(child: Text('find the craftsmen closer to you.',textAlign: TextAlign.justify,style: GoogleFonts.quicksand(color: ColorX.darkBlue,fontWeight: FontWeight.w700,fontSize: 16))),

          GestureDetector(
            onTap: (){

              GoRouter.of(context).
              pushNamed(MyAppRouteConstants.mapFromScreen,
                params: {
                  'houseNo':'Arbind',
                  'street':"kamat",
                },

              );
            },
            child: Padding(
              padding:  EdgeInsets.only(left: 8.w,right: 8.w),
              child: Container(
                width: 100.w,
                decoration: BoxDecoration(
                    color: ColorX.buttonColor,
                    borderRadius: BorderRadius.circular(8.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding:  EdgeInsets.all(1.5.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.navigation,color: ColorX.textColor,),
                      Text('USE CURRENT LOCATION',style: GoogleFonts.quicksand(color: ColorX.textColor,fontWeight: FontWeight.w700,fontSize: 13))
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
              onTap: (){

                GoRouter.of(context).
                pushNamed(MyAppRouteConstants.mapFromScreen,
                  params: {
                    'houseNo':'Arbind',
                    'street':"kamat",
                  },

                );
              },
              child: Center(child: Text('Select it manually',style: GoogleFonts.poppins(color: ColorX.textColor,fontWeight: FontWeight.w600,fontSize: 16,decoration: TextDecoration.underline)))),
          Divider(
            thickness: 2,
            color: const Color(0xFF9FBFF480).withOpacity(0.4),
          ),
           Center(child: Text('By creating an account, I accept App’s ', style: GoogleFonts.poppins(color: ColorX.textColor,fontWeight: FontWeight.w300,fontSize: 12))),
          Center(child: Padding(
            padding:  EdgeInsets.only(bottom: 2.h),
            child: Text('Terms of Service.',style: GoogleFonts.poppins(color: ColorX.textColor,fontWeight: FontWeight.w300,fontSize: 12,decoration: TextDecoration.underline)),
          ))
        ],
      )
          :  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(

                decoration: BoxDecoration(
                    color: ColorX.textColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8.w)
                    )
                ),
                child: _currentPosition==null?
                Image.asset('image/Basemap image.png')
                    : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 41.h,
                    width: 90.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8.w),
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        heightFactor: 0.3,
                        widthFactor: 2.5,
                        child: GoogleMap(
                          initialCameraPosition:CameraPosition(target: LatLng(_currentPosition!.latitude,_currentPosition!.longitude),  zoom: 15,),
                          mapType: mapType,
                          markers: {
                            Marker(
                              markerId: const MarkerId("marker1"),
                              position:  LatLng(_currentPosition!.latitude,_currentPosition!.longitude),
                              icon: markerIcon,
                            )
                          },
                          /*onMapCreated: (mapController)async{
                          _controller.complete(mapController);
                        },*/
                        ),
                      ),
                    ),
                  ),
                )
            ),
          ),
          Center(child: Text('Hi, nice to meet you!',style: GoogleFonts.poppins(color: ColorX.blackX,fontWeight: FontWeight.w700,fontSize: 21),)),
          Center(child: Text('Provide your location to us.',textAlign: TextAlign.justify,style: GoogleFonts.quicksand(color: ColorX.darkBlue,fontWeight: FontWeight.w700,fontSize: 16))),
          Center(child: Text('find the craftsmen closer to you.',textAlign: TextAlign.justify,style: GoogleFonts.quicksand(color: ColorX.darkBlue,fontWeight: FontWeight.w700,fontSize: 16))),

          GestureDetector(
            onTap: (){

              GoRouter.of(context).
              pushNamed(MyAppRouteConstants.mapFromScreen,
                params: {
                  'houseNo':'Arbind',
                  'street':"kamat",
                },

              );
            },
            child: Padding(
              padding:  EdgeInsets.only(left: 8.w,right: 8.w),
              child: Container(
                width: 100.w,
                decoration: BoxDecoration(
                  color: ColorX.buttonColor,
                  borderRadius: BorderRadius.circular(8.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding:  EdgeInsets.all(1.5.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.navigation,color: ColorX.textColor,),
                      Text('USE CURRENT LOCATION',style: GoogleFonts.quicksand(color: ColorX.textColor,fontWeight: FontWeight.w700,fontSize: 13))
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
              onTap: (){

                GoRouter.of(context).
                pushNamed(MyAppRouteConstants.mapFromScreen,
                  params: {
                    'houseNo':'Arbind',
                    'street':"kamat",
                  },

                );
              },
              child: Center(child: Text('Select it manually',style: GoogleFonts.poppins(color: ColorX.textColor,fontWeight: FontWeight.w600,fontSize: 16,decoration: TextDecoration.underline)))),
          Divider(
            thickness: 2,
            color: const Color(0xFF9FBFF480).withOpacity(0.4),
          ),
          Center(child: Text('By creating an account, I accept App’s ', style: GoogleFonts.poppins(color: ColorX.textColor,fontWeight: FontWeight.w300,fontSize: 12))),
          Center(child: Padding(
            padding:  EdgeInsets.only(bottom: 2.h),
            child: Text('Terms of Service.',style: GoogleFonts.poppins(color: ColorX.textColor,fontWeight: FontWeight.w300,fontSize: 12,decoration: TextDecoration.underline)),
          ))
        ],
      ),
    );
  }
}
