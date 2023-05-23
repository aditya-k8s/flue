import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../Resources/Component/common_button.dart';
import '../../Resources/colors.dart';
import '../../View_Model_Data/user_prefences.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final TextStyle _textStyle = GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w700,color: ColorX.blackX);
  List<String> staticRoleList = ['Male', 'Female', 'Other'];
  String? roleNew;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: UserPrefences.feedType=='USER'?
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    top: 6.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                size: 25.sp,
                                color: ColorX.whiteX,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Edit Profile",
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  color: ColorX.whiteX,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    )),

              ],
            ),
            SizedBox(
              height: 26.h,
              width: 100.w,
              child:  Stack(
                children: [
                  SizedBox(
                    height: 20.h,
                    width: 100.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.w),
                        bottomRight: Radius.circular(10.w),
                      ),
                      child: Stack(
                        children: [
                          Center(child: Image.asset('image/Rectangle 1959.png')),
                          Padding(
                            padding:  EdgeInsets.only(left: 75.w,top: 13.h),
                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: ColorX.whiteX,width: 1),
                                    color: ColorX.scaffoldBackGroundX
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset('image/imagepicker.svg',color: ColorX.textColor,height: 2.h,),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top:11.h,
                    left: 30.w,
                    child: Container(
                      height: 15.h,
                      width: 40.w,
                      decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorX.whiteX,width: 2),
                          color: Colors.purple.shade300
                      ),
                      child: Stack(
                        children: [
                          Center(child: Image.asset('image/Rectangle 1876.png',)),
                          Padding(
                            padding:  EdgeInsets.only(left: 28.w,top: 9.h),
                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: ColorX.whiteX,width: 1),
                                    color: ColorX.scaffoldBackGroundX
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset('image/imagepicker.svg',color: ColorX.textColor,height: 2.h,),
                                )),
                          ),
                        ],
                      ),
                    ),),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: Text("Full Name", style:GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w700,color: ColorX.blackX)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: TextFormField(),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 37.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Age", style: GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w700,color: ColorX.blackX)),
                      Text("Gender", style: GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w700,color: ColorX.blackX))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 45.w,
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: TextFormField(),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 1.h,right: 3.w),
                      child: Container(
                        width: 45.w,
                        padding: const EdgeInsets.all(8.0),
                        decoration:  const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.grey,
                                width: 1.0
                            ),
                          ),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(right: 0.w),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                  isDense: true,
                                  value: roleNew,
                                  items: staticRoleList.map((String items) {
                                    return DropdownMenuItem<String>(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      roleNew = newValue.toString();
                                    });
                                  },
                                  hint:  Text( roleNew==null? '': roleNew.toString(),
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 14))),
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: Text("Mobile Number", style: GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w700,color: ColorX.blackX)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: Row(
                    children: [
                      Container(
                        width: 37.w,
                        padding:  EdgeInsets.only(top: 2.h),
                        decoration:  const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.grey,
                                width: 1.0
                            ),
                          ),
                        ),
                        child:  CountryPickerDropdown(
                          initialValue: 'IN',
                          itemBuilder: _buildDropdownItem,
                          priorityList:[
                            CountryPickerUtils.getCountryByIsoCode('GB'),
                            CountryPickerUtils.getCountryByIsoCode('CN'),
                          ],
                          sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
                          onValuePicked: (Country country) {
                            print(country.name);
                          },
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:  EdgeInsets.only(top: 2.h
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration:  const InputDecoration(

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: Text("Email Address", style: GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w700,color: ColorX.blackX)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: TextFormField(),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Padding(
                padding:  EdgeInsets.only(left: 8.w,right: 8.w),
                child: CommonButton(
                  height: 6.h,
                  buttonText: 'SAVE CHANGE',
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ):SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    top: 6.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                size: 25.sp,
                                color: ColorX.whiteX,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Edit Profile",
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  color: ColorX.whiteX,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    )),

              ],
            ),
            SizedBox(
              height: 26.h,
              width: 100.w,
              child:  Stack(
                children: [
                  SizedBox(
                    height: 20.h,
                    width: 100.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.w),
                        bottomRight: Radius.circular(10.w),
                      ),
                      child: Stack(
                        children: [
                          Center(child: Image.asset('image/Rectangle 1959.png')),
                          Padding(
                            padding:  EdgeInsets.only(left: 75.w,top: 13.h),
                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: ColorX.whiteX,width: 1),
                                    color: ColorX.scaffoldBackGroundX
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset('image/imagepicker.svg',color: ColorX.textColor,height: 2.h,),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top:11.h,
                    left: 30.w,
                    child: Container(
                      height: 15.h,
                      width: 40.w,
                      decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorX.whiteX,width: 2),
                          color: Colors.purple.shade300
                      ),
                      child: Stack(
                        children: [
                          Center(child: Image.asset('image/Rectangle 1876.png',)),
                          Padding(
                            padding:  EdgeInsets.only(left: 28.w,top: 9.h),
                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: ColorX.whiteX,width: 1),
                                    color: ColorX.scaffoldBackGroundX
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset('image/imagepicker.svg',color: ColorX.textColor,height: 2.h,),
                                )),
                          ),
                        ],
                      ),
                    ),),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: Text("Full Name", style:GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w700,color: ColorX.blackX)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: TextFormField(),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 37.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Age", style: GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w700,color: ColorX.blackX)),
                      Text("Gender", style: GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w700,color: ColorX.blackX))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 45.w,
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: TextFormField(),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 1.h,right: 3.w),
                      child: Container(
                        width: 45.w,
                        padding: const EdgeInsets.all(8.0),
                        decoration:  const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.grey,
                                width: 1.0
                            ),
                          ),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(right: 0.w),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                  isDense: true,
                                  value: roleNew,
                                  items: staticRoleList.map((String items) {
                                    return DropdownMenuItem<String>(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      roleNew = newValue.toString();
                                    });
                                  },
                                  hint:  Text( roleNew==null? '': roleNew.toString(),
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 14))),
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: Text("Mobile Number", style: GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w700,color: ColorX.blackX)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: Row(
                    children: [
                      Container(
                        width: 37.w,
                        padding:  EdgeInsets.only(top: 2.h),
                        decoration:  const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.grey,
                                width: 1.0
                            ),
                          ),
                        ),
                        child:  CountryPickerDropdown(
                          initialValue: 'IN',
                          itemBuilder: _buildDropdownItem,
                          priorityList:[
                            CountryPickerUtils.getCountryByIsoCode('GB'),
                            CountryPickerUtils.getCountryByIsoCode('CN'),
                          ],
                          sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
                          onValuePicked: (Country country) {
                            print(country.name);
                          },
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:  EdgeInsets.only(top: 2.h
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration:  const InputDecoration(

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: Text("Email Address", style: GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w700,color: ColorX.blackX)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: TextFormField(),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 8.w,right: 8.w),
              child: CommonButton(
                height: 6.h,
                buttonText: 'SAVE CHANGE',
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildDropdownItem(Country country) => Row(
    children: <Widget>[
      CountryPickerUtils.getDefaultFlagImage(country),
      const SizedBox(
        width: 8.0,
      ),
      Text("+${country.phoneCode}")
    ],
  );
}
