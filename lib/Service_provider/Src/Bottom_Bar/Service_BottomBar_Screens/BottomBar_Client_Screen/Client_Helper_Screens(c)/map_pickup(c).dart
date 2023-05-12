import 'dart:async';

import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../../../Map_Bording/map_screen.dart';

class MapPickup extends StatefulWidget {
  const MapPickup({Key? key}) : super(key: key);

  @override
  State<MapPickup> createState() => _MapPickupState();
}

class _MapPickupState extends State<MapPickup> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            color: Colors.indigo,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2.w),
              child: Align(
                alignment: Alignment.bottomRight,
                heightFactor: 0.3,
                widthFactor: 2.5,
                child: lat == null
                    ? const Center(child: Text("map"))
                    : GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(lat!, lng!),
                          zoom: 15,
                        ),
                        mapType: mapType,
                        markers: {
                          Marker(
                            markerId: const MarkerId("marker1"),
                            position: LatLng(lat!, lng!),
                            icon: markerIcon,
                          )
                        },
                        onMapCreated: (mapController) async {
                          _controller.complete(mapController);
                        },
                      ),
              ),
            ),
          ),
          Positioned(
              top: 7.h,
              left: 5.w,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop(MyAppRouteConstants.mapPickup);
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorX.textColor,
                      border: Border.all(color: ColorX.whiteX, width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: ColorX.whiteX,
                    ),
                  ),
                ),
              )),
          Positioned(
            top: 65.h,
              left: 3.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop(MyAppRouteConstants.mapPickup);
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(left: 65.w),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.w),
                            color: ColorX.buttonColor),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Icon(Icons.menu, color: ColorX.textColor),
                              Text('List view',
                                  style: TextStyle(
                                      color: ColorX.textColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45.h,
                    width: 100.w,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 5,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4.w)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 50,
                                                backgroundColor: ColorX.scaffoldBackGroundX,
                                                child: Image.asset('image/Rectangle 1876.png'),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(left: 3.w),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("Charles J. Smith",style: TextStyle(color: ColorX.blackX,fontSize: 14.sp,fontWeight: FontWeight.w700),),
                                                        Text('( Plumber )',style: TextStyle(color: ColorX.blackX,fontSize: 10.sp,fontWeight: FontWeight.w400),)
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 0.5.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.star_border_outlined,color: ColorX.textColor),
                                                        Text('4.6 (313 Review)',style: TextStyle(color: ColorX.blackX,fontSize: 10.sp,fontWeight: FontWeight.w600))
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 0.5.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.location_on_outlined,color: ColorX.textColor,),
                                                        Text('35 minutes away',style: TextStyle(color: ColorX.blackX,fontSize: 10.sp,fontWeight: FontWeight.w600))
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 0.5.h,
                                                    ),
                                                    Padding(
                                                      padding:  EdgeInsets.only(left: 1.w),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset('image/tick3.svg',height: 2.h,),
                                                          SizedBox(
                                                            width: 1.w,
                                                          ),
                                                          Text('342 jobs completed',style: TextStyle(color: ColorX.blackX,fontSize: 10.sp,fontWeight: FontWeight.w600))
                                                        ],
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                         SizedBox(
                                           width: 80.w,
                                           child: Padding(
                                             padding:  EdgeInsets.only(left: 2.w),
                                             child: Divider(),
                                           ),
                                         ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              Text('\$60',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp,color: ColorX.blackX),),
                                              SizedBox(
                                                width: 30.w,
                                              ),
                                              GestureDetector(
                                                onTap: (){
                                                  GoRouter.of(context).pushNamed(MyAppRouteConstants.bookServiceClient);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: ColorX.buttonColor,
                                                      borderRadius: BorderRadius.circular(8.w)
                                                  ),
                                                  child: Padding(
                                                    padding:  const EdgeInsets.all(15.0),
                                                    child: Text('Book Now',style: TextStyle(color: ColorX.textColor,fontSize: 12.sp,fontWeight: FontWeight.bold),),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: (){
                                                  GoRouter.of(context).pushNamed(MyAppRouteConstants.serviceProfileClient);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(color: ColorX.textColor)
                                                  ),
                                                  child: Padding(
                                                    padding:  EdgeInsets.all(2.2.h),
                                                    child: SvgPicture.asset('image/Vector10.svg'),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
