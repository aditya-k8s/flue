import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Resources/colors.dart';
import '../../../../../Utilities/Routes/routes.dart';

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
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _placesList1.clear();
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
    String placesApiKey = 'AIzaSyD9kUxBM4VKlq3IeNFLbM026sF3dhwHj7A';
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
                    SizedBox(
                      height: 23.h,
                      width: 100.w,
                      child: SvgPicture.asset(
                        'image/Vector (2).svg',
                        fit: BoxFit.cover,
                        width: 100.w,
                      ),
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
                                        GestureDetector(
                                          onTap: (){
                                            GoRouter.of(context).pushNamed(MyAppRouteConstants.supportScreen);
                                          },
                                          child: Padding(
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
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            GoRouter.of(context).pushNamed(MyAppRouteConstants.notificationScreen);
                                          },
                                          child: Container(
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
                                              )),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text('Search Craftsmen',
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 24,color: ColorX.buttonColor)),
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
                        style: GoogleFonts.quicksand(fontWeight: FontWeight.w700,fontSize: 12,color: ColorX.blackX),
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
                              },
                              decoration:
                                  //disable single line border below the text field
                                  InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.location_on_outlined,
                                        color: ColorX.underLineColor,
                                      ),
                                      hintText: _searchController.text==""?'105 William St, Chicago, US':_searchController.text,
                                      hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 15,color: ColorX.blackX),
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
                          style: GoogleFonts.quicksand(fontWeight: FontWeight.w700,fontSize: 12,color: ColorX.blackX)),
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
                                        style: GoogleFonts.quicksand(fontWeight: FontWeight.w500,fontSize: 13,color: ColorX.blackX))
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
                                  style: GoogleFonts.quicksand(fontWeight: FontWeight.w700,fontSize: 16,color: ColorX.textColor)),
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              GoRouter.of(context).pushNamed(MyAppRouteConstants.mapPickup);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: ColorX.textColor,
                                ),
                                Text("Map View",
                                    style: GoogleFonts.quicksand(fontWeight: FontWeight.w700,fontSize: 16,color: ColorX.textColor))
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
                                                   Text("Charles J. Smith",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 16,color: ColorX.blackX)),
                                                   Text('( Plumber )',style: GoogleFonts.quicksand(fontWeight: FontWeight.w700,fontSize: 12,color: ColorX.blackX))
                                                 ],
                                               ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Row(
                                                children: [
                                                Icon(Icons.star_border_outlined,color: ColorX.textColor),
                                                Text('4.6 (313 Review)',style: GoogleFonts.quicksand(fontWeight: FontWeight.w600,fontSize: 13,color: ColorX.blackX))
                                                ],
                                              ),
                                               SizedBox(
                                                 height: 0.5.h,
                                               ),
                                               Row(
                                                children: [
                                                Icon(Icons.location_on_outlined,color: ColorX.textColor,),
                                                Text('35 minutes away',style: GoogleFonts.quicksand(fontWeight: FontWeight.w600,fontSize: 13,color: ColorX.blackX))
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
                                                  Text('342 jobs completed',style: GoogleFonts.quicksand(fontWeight: FontWeight.w600,fontSize: 13,color: ColorX.blackX))
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

                                         Text('\$60',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 16,color: ColorX.blackX)),

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
                                                   child: Text('Book Now',style: GoogleFonts.quicksand(fontWeight: FontWeight.w600,fontSize: 13,color: ColorX.blackX)),
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
                              SizedBox(
                                  width: 70.w,
                                  child: Text(_placesList1[index].toString(),textAlign: TextAlign.justify,style: TextStyle(color: ColorX.blackX,fontSize: 12.sp,fontWeight: FontWeight.w500)))
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