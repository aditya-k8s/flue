import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../../../Resources/colors.dart';
import '../../../../Utilities/Routes/routes.dart';
import '../../../../View_Model_Data/user_prefences.dart';




class HomePageClient extends StatefulWidget {
  const HomePageClient({Key? key}) : super(key: key);

  @override
  State<HomePageClient> createState() => _HomePageClientState();
}

class _HomePageClientState extends State<HomePageClient> {
  ///map
  late  Completer<GoogleMapController> _controller = Completer();
   BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  // final FocusNode focusNode = FocusNode();
   MapType mapType = MapType.normal;
  @override
  void initState() {
    addCustomIcon();
    _heading = "Suggestions";
    _placesList1;
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  ///custom searchField

   final TextEditingController _searchController = TextEditingController();
  Timer? _throttle;
  String? _heading;
  final List _placesList1 = [];

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _placesList1.clear();
    _controller = Completer();
    super.dispose();
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
  _onSearchChanged() {
    if (_throttle?.isActive ?? false) _throttle!.cancel();
    _throttle = Timer(const Duration(milliseconds: 500), () {
      getLocationResults(_searchController.text);
    });
  }

  Dio dio = Dio();
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
    Response response = await dio.get(request);
    final predictions = response.data['predictions'];
    for (var i = 0; i < predictions.length; i++) {
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
        child: Column(
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
                            padding: EdgeInsets.only(right: 2.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('Find a Craftsman',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22,
                                            color: ColorX.whiteX)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        GoRouter.of(context).pushNamed(
                                            MyAppRouteConstants.supportScreen);
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
                                              padding:
                                                  const EdgeInsets.all(10.0),
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
                                      onTap: () {
                                        GoRouter.of(context).pushNamed(
                                            MyAppRouteConstants
                                                .notificationScreen);
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: ColorX.whiteX,
                                                  width: 2)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Icon(
                                              Icons.notifications,
                                              color: ColorX.whiteX,
                                            ),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Text('Near you',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: ColorX.buttonColor)),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text('Choose the type of services',
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: ColorX.whiteX))
                        ],
                      ),
                    )),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                child: SizedBox(
                    height: 35.h,
                    width: 100.w,
                    child: GridView.builder(
                        itemCount: 12,
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 0,
                                crossAxisSpacing: 0),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                height: 9.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.w)),
                                child: Image.asset('image/Rectangle 1913.png'),
                              ),
                              Center(
                                  child: Text('Painter',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: ColorX.blackX)))
                            ],
                          );
                        }))),
            GestureDetector(
              onTap: () {
                bottomSheetSearchBar();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 6.w, right: 4.w),
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorX.whiteX,
                      border: Border.all(color: ColorX.underLineColor),
                      borderRadius: BorderRadius.circular(8.w),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: Offset(0, 1))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: TextField(
                      onTap: () {},
                      textAlign: TextAlign.left,
                      autocorrect: false,
                      decoration:
                          //disable single line border below the text field
                          InputDecoration(
                        enabled: false,
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: ColorX.underLineColor,
                        ),
                        hintText: 'Place of repair',
                        hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: ColorX.underLineColor),
                        border: InputBorder.none,
                      ),
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: ColorX.blackX),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 20.h,
                width: 100.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2.w),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    heightFactor: 0.3,
                    widthFactor: 2.5,
                    child: UserPrefences.lng == 0.0? const Center(child: Text("map")):GoogleMap(
                      initialCameraPosition:CameraPosition(target: LatLng(UserPrefences.lat,UserPrefences.lng),  zoom: 15,),
                      mapType: mapType,
                      markers: {
                        Marker(
                          markerId: const MarkerId("marker1"),
                          position:  LatLng(UserPrefences.lat,UserPrefences.lng),
                          icon: markerIcon,
                        )
                      },
                      // onMapCreated: (mapController)async{
                      //   _controller.complete(mapController);
                      // },
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
  bottomSheetSearchBar() async {
    showModalBottomSheet<Future>(
        backgroundColor: ColorX.scaffoldBackGroundX,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.w),
            topRight: Radius.circular(4.w),
          ),
        ),
        isScrollControlled: true,
        constraints: BoxConstraints.tight(Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * .8)),
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Center(
                    child: Container(
                      height: 0.8.h,
                      width: 15.w,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4.w)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("cancel");
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 3.w),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SvgPicture.asset('image/Shape1.svg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.w, right: 4.w),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorX.whiteX,
                          border: Border.all(color: ColorX.blackX),
                          borderRadius: BorderRadius.circular(8.w)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                          controller: _searchController,
                          onChanged: (val) {
                            setState(() {
                              print(val);
                              _placesList1.clear();
                              _onSearchChanged();
                              _searchController.text.isEmpty
                                  ? _placesList1.clear()
                                  : Container();
                            });
                          },
                          //textAlign: TextAlign.left,
                          autocorrect: true,
                          autofocus: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: ColorX.underLineColor,
                            ),
                            hintText: _searchController.text == ""
                                ? 'Place of repair'
                                : _searchController.text,
                            hintStyle: TextStyle(
                                color: ColorX.underLineColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp),
                            border: InputBorder.none,
                          ),
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: ColorX.blackX),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3.h, right: 5.w),
                    child: Text(
                        'Search the place of repair and discover the craftsmen nearby.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: ColorX.blackX)),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Divider(thickness: 2),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.h, right: 5.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.radio_button_checked_rounded,
                          color: ColorX.underLineColor,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text('My current location',
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: ColorX.blackX))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Divider(thickness: 2),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text('Popular $_heading',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: ColorX.blackX)),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(MyAppRouteConstants.searchServiceClient);
                      },
                      child: SizedBox(
                        height: 40.h,
                        width: 100.w,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: _placesList1.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 4.w),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: const Color(0xffF52D56),
                                      size: 4.h,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    SizedBox(
                                        width: 85.w,
                                        child: Text(
                                            _placesList1[index].toString(),
                                            textAlign: TextAlign.justify,
                                            style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17,
                                                color: ColorX.textColor)))
                                  ],
                                ),
                              );
                            }),
                      ))
                ],
              ),
            );
          });
        });
  }
}
