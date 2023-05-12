import 'dart:async';

import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class SearchServiceClient extends StatefulWidget {
  const SearchServiceClient({Key? key}) : super(key: key);

  @override
  State<SearchServiceClient> createState() => _SearchServiceClientState();
}

class _SearchServiceClientState extends State<SearchServiceClient> {
  final TextEditingController _searchController =  TextEditingController();
  Timer? _throttle;
   String? _heading;
   final List _placesList1=[];

  @override
  void initState() {
    super.initState();
    _heading = "Suggestions";
    _placesList1;
    clearTextField();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _placesList1.clear();
    clearTextField();
    super.dispose();
  }

  _onSearchChanged() {
    if (_throttle?.isActive ?? false) _throttle!.cancel();
    _throttle = Timer(const Duration(milliseconds: 500), () {
      getLocationResults(_searchController.text);
    });
  }

  void getLocationResults(String input) async {
    if (input.isEmpty) {
      setState(() {
        _heading = "Suggestions";
      });
      return;
    }
    String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String type = '(regions)';
    String placesApiKey = 'AIzaSyASR635al-cH5JTBu3hHzi8Kf0uEsPHSTA';
    String request = '$baseURL?input=$input&key=$placesApiKey&type=$type';
    Response response = await Dio().get(request);
    final predictions = response.data['predictions'];
    for (var i=0; i < predictions.length; i++) {
      String name = predictions[i]['description'];
      _placesList1.add(name.toString());

    }

    setState(() {
      _heading = "Results";
      _placesList1;

    });
  }

  clearTextField(){
    setState(() {
      _searchController.text.length==0?_placesList1.clear():Container();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      'image/Vector (2).svg',
                      fit: BoxFit.fill,
                      width: 100.w,
                    ),
                    Positioned(
                        top: 5.h,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 4.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.arrow_back,
                                              color: ColorX.whiteX, size: 3.h),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 8.w),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: ColorX.whiteX,
                                                      width: 2)),
                                              child: Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: SvgPicture.asset(
                                                  'image/chatgpt.svg',
                                                  color: Colors.white,
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: ColorX.whiteX, width: 2)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.notification_important,
                                                color: ColorX.whiteX,
                                              ),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text('Search Craftsmen',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: ColorX.whiteX,
                                      fontWeight: FontWeight.w800)),
                            ],
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Place',
                        style: TextStyle(
                            color: ColorX.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.w, right: 4.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorX.whiteX,
                              border: Border.all(color: ColorX.underLineColor),
                              borderRadius: BorderRadius.circular(8.w)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextField(
                              textAlign: TextAlign.left,
                              autocorrect: false,
                              controller: _searchController,
                              onChanged: (val){
                                _placesList1.clear();
                                _onSearchChanged();
                                clearTextField();
                              },
                              decoration:
                                  //disable single line border below the text field
                                  InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.location_on,
                                        color: ColorX.underLineColor,
                                      ),
                                      hintText: _searchController.text==""?'105 William St, Chicago, US':_searchController.text,
                                      hintStyle: TextStyle(
                                          color: ColorX.blackX,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp),
                                      border: InputBorder.none,
                                      suffixIcon: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            _searchController.text ='';
                                            _placesList1.clear();
                                          });
                                        },
                                        child: Icon(
                                          Icons.cancel,
                                          color: ColorX.underLineColor,
                                        ),
                                      )),
                              style: TextStyle(
                                  color: ColorX.blackX,
                                  fontSize: 14,
                                  fontFamily: "Roboto"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text('Type of Service',
                          style: TextStyle(
                              color: ColorX.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.w, right: 4.w),
                        child: Container(
                          height: 7.h,
                          decoration: BoxDecoration(
                              color: ColorX.whiteX,
                              border: Border.all(color: ColorX.underLineColor),
                              borderRadius: BorderRadius.circular(8.w)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: ColorX.underLineColor)),
                                      child: Image.asset(
                                        'image/Rectangle 1876.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text('Plumbing',
                                        style: TextStyle(
                                            color: ColorX.textColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp))
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 2.w),
                                  child: CircleAvatar(
                                      radius: 1.3.h,
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: ColorX.whiteX,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('12 Plumber nearby you',
                                  style: TextStyle(
                                      color: ColorX.textColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp)),
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              GoRouter.of(context).pushNamed(MyAppRouteConstants.mapPickup);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: ColorX.textColor,
                                ),
                                Text("Map View",
                                    style: TextStyle(
                                        color: ColorX.textColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp))
                              ],
                            ),
                          ),
                        ],
                      ),
                     SizedBox(
                       height: 1.h,
                     ),
                     SizedBox(
                       height: 45.h,
                       width: 100.w,
                       child: ListView.builder(
                         padding: EdgeInsets.zero,
                         itemCount: 5,
                           itemBuilder: (context,index){
                         return Column(
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
                                     const Divider(thickness: 2,),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [

                                         Text('\$60',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp,color: ColorX.blackX),),

                                         Row(
                                           children: [
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

                                   ],
                                 ),
                               ),
                             ),
                             SizedBox(
                               height: 1.h,
                             )
                           ],
                         );
                       }),
                     ),

                    ],
                  ),
                ),

              ],
            ),
         _searchController.text.isEmpty?Container():Positioned(
                top: 36.h,
                left: 0,
                right: 0,
                bottom: 35.h,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(4.w)
                  ),
                  child:  ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: _placesList1.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding:  EdgeInsets.only(left: 4.w,top: 1.h),
                          child: Row(
                            children: [
                              Icon(Icons.location_on_outlined,color: Color(0xffF52D56),size: 4.h,),
                              SizedBox(
                                width: 2.w,
                              ),
                              GestureDetector(
                                  onTap: (){

                                  },
                                  child: Text(_placesList1[index].toString(),style: TextStyle(color: ColorX.blackX,fontSize: 12.sp,fontWeight: FontWeight.w500)))
                            ],
                          ),
                        );
                      }),
                ))
          ],
        ),
      ),
    );
  }
}