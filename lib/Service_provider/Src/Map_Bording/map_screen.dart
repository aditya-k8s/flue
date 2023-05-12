import 'dart:async';
import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:allohuggy/Service_provider/Utilities/shred_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../Utilities/colors.dart';
double? lat;
double? lng;
MapType mapType = MapType.normal;
BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  ///map
  final Completer<GoogleMapController> _controller = Completer();
  Location location = Location();
  LocationData? currentLocation;


  @override
  void initState(){
    getCurrentLocation();
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "image/Location.png")
        .then(
          (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  void getCurrentLocation() async {
    location.getLocation().then(
          (location) {
        currentLocation = location;
        lat = currentLocation!.latitude;
        lng = currentLocation!.longitude;
        print('current latitude is $lat');
        print('current longitude is $lng');
        print("cureent location,${currentLocation!.longitude}");
        setState(() {});
      },
    );
    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen(
          (newLoc) {
        currentLocation = newLoc;
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 13.5,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              ),
            ),

          ),
        );
      },
    );
  }

  @override
  void dispose(){

    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: ShredHelper.feedType =="USER"?
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                'image/Vector (3).svg',
                fit: BoxFit.fitWidth,
                width: 100.w,
              ),
              Positioned(
                  top: 6.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 0.w),
                    child:SizedBox(
                      height: 40.h,
                      width: 90.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8.w),
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          heightFactor: 0.3,
                          widthFactor: 2.5,
                          child: lat ==null? Container():GoogleMap(
                            initialCameraPosition:CameraPosition(target: LatLng(lat!,lng!),  zoom: 15,),
                            mapType: mapType,
                            markers: {
                              Marker(
                                markerId: const MarkerId("marker1"),
                                position:  LatLng(lat!, lng!),
                                icon: markerIcon,
                              )
                            },
                            onMapCreated: (mapController)async{
                              _controller.complete(mapController);
                            },
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
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
                    borderRadius: BorderRadius.circular(8.w)
                ),
                child: Padding(
                  padding:  EdgeInsets.all(1.9.h),
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
            color: const Color(0xff9FBFF480).withOpacity(0.4),
          ),
           Center(child: Text('By creating an account, I accept App’s ', style: GoogleFonts.poppins(color: ColorX.textColor,fontWeight: FontWeight.w300,fontSize: 12))),
          Center(child: Padding(
            padding:  EdgeInsets.only(bottom: 2.h),
            child: Text('Terms of Service.',style: GoogleFonts.poppins(color: ColorX.textColor,fontWeight: FontWeight.w300,fontSize: 12,decoration: TextDecoration.underline)),
          ))
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                'image/Vector (3).svg',
                fit: BoxFit.fitWidth,
                width: 100.w,
              ),
              Positioned(
                  top: 6.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 0.w),
                    child:SizedBox(
                      height: 40.h,
                      width: 90.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8.w),
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          heightFactor: 0.3,
                          widthFactor: 2.5,
                          child: lat ==null? Container():GoogleMap(
                            initialCameraPosition:CameraPosition(target: LatLng(lat!,lng!),  zoom: 15,),
                            mapType: mapType,
                            markers: {
                              Marker(
                                markerId: const MarkerId("marker1"),
                                position:  LatLng(lat!, lng!),
                                icon: markerIcon,
                              )
                            },
                            onMapCreated: (mapController)async{
                              _controller.complete(mapController);
                            },
                          ),
                        ),
                        ),
                    ),
                  ))
            ],
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
                  borderRadius: BorderRadius.circular(8.w)
                ),
                child: Padding(
                  padding:  EdgeInsets.all(1.9.h),
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
              child: Center(child: Text('Select it manually',style: GoogleFonts.poppins(color: ColorX.blackX,fontWeight: FontWeight.w700,fontSize: 16,decoration: TextDecoration.underline)))),

           Divider(
            thickness: 2,
            color: const Color(0xff9FBFF480).withOpacity(0.4),
          ),
           Center(child: Text('By creating an account, I accept App’s ', style: GoogleFonts.poppins(color: ColorX.textColor,fontWeight: FontWeight.w300,fontSize: 12),)),
          Center(child: Padding(
            padding:  EdgeInsets.only(bottom: 2.h),
            child: Text('Terms of Service.',style: GoogleFonts.poppins(color: ColorX.textColor,fontWeight: FontWeight.w300,fontSize: 12,decoration: TextDecoration.underline)),
          ))
        ],
      ),
    );
  }
}
