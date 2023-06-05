import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Resources/colors.dart';
import '../../Resources/Component/common_button.dart';
import '../../Utilities/Routes/routes.dart';
import '../../Utilities/utils.dart';
import '../../View_Model_Data/user_prefences.dart';
import 'package:http/http.dart' as http;

class RegisterForm extends StatefulWidget {
  String? id;
   RegisterForm({Key? key, this.id}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextStyle _textStyle = GoogleFonts.poppins(
      color: ColorX.textColor, fontSize: 14, fontWeight: FontWeight.w400);

  List<String> staticRoleList = ['Male', 'Female', 'Other'];
  String? roleNew;
  /// client
  final ValueNotifier<bool> _obscurePassWord = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passWordFocus = FocusNode();
  FocusNode nameWordFocus = FocusNode();
  FocusNode ageWordFocus = FocusNode();
  FocusNode genderWordFocus = FocusNode();
  FocusNode phoneWordFocus = FocusNode();

  /// service provider
  final TextEditingController _emailControllerService = TextEditingController();
  final TextEditingController _passWordControllerService = TextEditingController();
  final TextEditingController _fullNameControllerService = TextEditingController();
  final TextEditingController _phoneNumberControllerService = TextEditingController();
  final TextEditingController _genderControllerService = TextEditingController();
  final TextEditingController _ageControllerService = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _obscurePassWord.dispose();
    _emailController.dispose();
    _passWordController.dispose();
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    emailFocus.dispose();
    passWordFocus.dispose();
    nameWordFocus.dispose();
    ageWordFocus.dispose();
    genderWordFocus.dispose();
    phoneWordFocus.dispose();
    _emailControllerService.dispose();
    _passWordControllerService.dispose();
    _fullNameControllerService.dispose();
    _phoneNumberControllerService.dispose();
    _genderControllerService.dispose();
    _ageControllerService.dispose();
  }

  /// formData variables
  String? countryCode = "91";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: UserPrefences.feedType == "USER"
          ? Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'image/Vector (2).svg',
                        fit: BoxFit.fitWidth,
                        width: 100.w,
                      ),
                    ),
                    Positioned(
                        top: 4.h,
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
                              SizedBox(
                                height: 2.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Inscription",
                                  style: GoogleFonts.poppins(
                                      fontSize: 32,
                                      color: ColorX.whiteX,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Client",
                                  style: GoogleFonts.quicksand(
                                      fontSize: 34,
                                      color: ColorX.buttonColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 6.w),
                            child: Text("Full Name", style: _textStyle),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w, right: 6.w),
                            child: TextFormField(
                              controller: _fullNameController,
                              focusNode: nameWordFocus,
                              onFieldSubmitted: (value) {
                                Utils.fieldFocusNode(
                                    context, nameWordFocus, ageWordFocus);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 6.w, right: 41.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Age", style: _textStyle),
                                Text("Gender", style: _textStyle)
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w, right: 2.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 45.w,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 4.w),
                                    child: TextFormField(
                                      controller: _ageController,
                                      focusNode: ageWordFocus,
                                      onFieldSubmitted: (value) {
                                        Utils.fieldFocusNode(context,
                                            ageWordFocus, phoneWordFocus);
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 1.h, right: 3.w),
                                  child: Container(
                                    width: 45.w,
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey, width: 1.0),
                                      ),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(right: 0.w),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                              isDense: true,
                                              value: roleNew,
                                              items: staticRoleList
                                                  .map((String items) {
                                                return DropdownMenuItem<String>(
                                                  value: items,
                                                  child: Text(
                                                    items,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  roleNew = newValue.toString();
                                                });
                                              },
                                              hint: Text(
                                                  roleNew == null
                                                      ? ''
                                                      : roleNew.toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14))),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w),
                            child: Text("Mobile Number", style: _textStyle),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w, right: 6.w),
                            child: Row(
                              children: [
                                Container(
                                  width: 37.w,
                                  padding: EdgeInsets.only(top: 2.h),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                  ),
                                  child: CountryPickerDropdown(
                                    initialValue: 'IN',
                                    itemBuilder: _buildDropdownItem,
                                    priorityList: [
                                      CountryPickerUtils.getCountryByIsoCode(
                                          'GB'),
                                      CountryPickerUtils.getCountryByIsoCode(
                                          'CN'),
                                    ],
                                    sortComparator: (Country a, Country b) =>
                                        a.isoCode.compareTo(b.isoCode),
                                    onValuePicked: (Country country) {
                                      countryCode = country.phoneCode;


                                      if (kDebugMode) {
                                        print(country.phoneCode);
                                      }
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2.h),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(),
                                      focusNode: phoneWordFocus,
                                      controller: _phoneNumberController,
                                      onFieldSubmitted: (value) {
                                        Utils.fieldFocusNode(context,
                                            phoneWordFocus, emailFocus);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 6.w),
                            child: Text("Email Address", style: _textStyle),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w, right: 6.w),
                            child: TextFormField(
                              controller: _emailController,
                              focusNode: emailFocus,
                              onFieldSubmitted: (value) {
                                Utils.fieldFocusNode(
                                    context, emailFocus, passWordFocus);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 6.w),
                            child: Text("Password", style: _textStyle),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w, right: 6.w),
                            child: ValueListenableBuilder(
                              valueListenable: _obscurePassWord,
                              builder: (context, value, child){

                                return  TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: _obscurePassWord.value,
                                  controller: _passWordController,
                                  focusNode: passWordFocus,
                                  obscuringCharacter: '*',
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          _obscurePassWord.value = !_obscurePassWord.value;
                                        },
                                        child: Icon(_obscurePassWord.value
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility,color: ColorX.textColor,)),
                                  ),
                                );
                              },

                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () async {
                          /*Map formData = {
                            'email': _emailController.text,
                            'password': _passWordController.text,
                            'name': _fullNameController.text,
                            'age': _ageController.text,
                            'gender': roleNew.toString(),
                            'mobile_no': '+${countryCode!+_phoneNumberController.text}',
                          };*/

                          // var data = {
                          //   'email': 'gggfllflfglia@gmail.comdddddddwwwwhhhgg',
                          //   'password': '12345678',
                          //   'name': 'arbind',
                          //   'age': '25',
                          //   'gender': 'male',
                          //   'mobile_no': '+91385459905',
                          //
                          // };
                          GoRouter.of(context).pushNamed(MyAppRouteConstants.registerOtpScreen, queryParams: {'email': _emailController.text,});
                         /* authViewModel.registerClient(formData, context);
                          if (kDebugMode) {
                            print('hit api $formData');
                          }*/
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 6.w, right: 6.w),
                          child: CommonButton(
                            buttonText: 'FOLLOWING',
                            height: 6.h,
                            // loading: authViewModel.loading,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text("Or", style: _textStyle),
                      Padding(
                        padding: EdgeInsets.only(top: 0.5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 5.h,
                              width: 14.w,
                              decoration: BoxDecoration(
                                  color: ColorX.whiteX,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: ColorX.blackX)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset('image/facebook.svg'),
                              ),
                            ),
                            Container(
                              height: 5.h,
                              width: 14.w,
                              decoration: BoxDecoration(
                                  color: ColorX.whiteX,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: ColorX.blackX)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    SvgPicture.asset('image/Group 16171.svg'),
                              ),
                            ),
                            Container(
                              height: 5.h,
                              width: 14.w,
                              decoration: BoxDecoration(
                                  color: ColorX.whiteX,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: ColorX.blackX)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset('image/Logo.svg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      GestureDetector(
                          onTap: () {
                            GoRouter.of(context)
                                .pushNamed(MyAppRouteConstants.loginScreen);
                          },
                          child: Text(
                            "Already have an account?",
                            style: _textStyle,
                          )),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ))
              ],
            )
          : Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'image/Vector (2).svg',
                  fit: BoxFit.fitWidth,
                  width: 100.w,
                ),
              ),
              Positioned(
                  top: 4.h,
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
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Registration",
                            style: GoogleFonts.poppins(
                                fontSize: 32,
                                color: ColorX.whiteX,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Artisan",
                            style: GoogleFonts.quicksand(
                                fontSize: 34,
                                color: ColorX.buttonColor,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: Text("Full Name", style: _textStyle),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.w, right: 6.w),
                          child: TextFormField(
                            controller: _fullNameController,
                            focusNode: nameWordFocus,
                            onFieldSubmitted: (value) {
                              Utils.fieldFocusNode(
                                  context, nameWordFocus, ageWordFocus);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6.w, right: 41.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Age", style: _textStyle),
                              Text("Gender", style: _textStyle)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2.w, right: 2.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 45.w,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 4.w),
                                  child: TextFormField(
                                    controller: _ageController,
                                    focusNode: ageWordFocus,
                                    onFieldSubmitted: (value) {
                                      Utils.fieldFocusNode(context,
                                          ageWordFocus, phoneWordFocus);
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(top: 1.h, right: 3.w),
                                child: Container(
                                  width: 45.w,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 0.w),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                            isDense: true,
                                            value: roleNew,
                                            items: staticRoleList
                                                .map((String items) {
                                              return DropdownMenuItem<String>(
                                                value: items,
                                                child: Text(
                                                  items,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                roleNew = newValue.toString();
                                              });
                                            },
                                            hint: Text(
                                                roleNew == null
                                                    ? ''
                                                    : roleNew.toString(),
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14))),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: Text("Mobile Number", style: _textStyle),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.w, right: 6.w),
                          child: Row(
                            children: [
                              Container(
                                width: 37.w,
                                padding: EdgeInsets.only(top: 2.h),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                ),
                                child: CountryPickerDropdown(
                                  initialValue: 'IN',
                                  itemBuilder: _buildDropdownItem,
                                  priorityList: [
                                    CountryPickerUtils.getCountryByIsoCode(
                                        'GB'),
                                    CountryPickerUtils.getCountryByIsoCode(
                                        'CN'),
                                  ],
                                  sortComparator: (Country a, Country b) =>
                                      a.isoCode.compareTo(b.isoCode),
                                  onValuePicked: (Country country) {
                                    countryCode = country.phoneCode;


                                    if (kDebugMode) {
                                      print(country.phoneCode);
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 2.h),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(),
                                    focusNode: phoneWordFocus,
                                    controller: _phoneNumberController,
                                    onFieldSubmitted: (value) {
                                      Utils.fieldFocusNode(context,
                                          phoneWordFocus, emailFocus);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: Text("Email Address", style: _textStyle),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.w, right: 6.w),
                          child: TextFormField(
                            controller: _emailController,
                            focusNode: emailFocus,
                            onFieldSubmitted: (value) {
                              Utils.fieldFocusNode(
                                  context, emailFocus, passWordFocus);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: Text("Password", style: _textStyle),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.w, right: 6.w),
                          child: ValueListenableBuilder(
                            valueListenable: _obscurePassWord,
                            builder: (context, value, child){

                              return  TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                obscureText: _obscurePassWord.value,
                                controller: _passWordController,
                                focusNode: passWordFocus,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        _obscurePassWord.value = !_obscurePassWord.value;
                                      },
                                      child: Icon(_obscurePassWord.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility,color: ColorX.textColor,)),
                                ),
                              );
                            },

                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    InkWell(
                      onTap: () async {
                        /*Map formData = {
                          'email': _emailController.text,
                          'password': _passWordController.text,
                          'name': _fullNameController.text,
                          'age': _ageController.text,
                          'gender': roleNew.toString(),
                          'mobile_no': '+${countryCode! + _phoneNumberController.text}',
                        };
                        authViewModel.registerServiceProviders(formData, context);
                        if (kDebugMode) {
                          print('hit api $formData');
                        }*/
                        GoRouter.of(context).pushNamed(MyAppRouteConstants.registerOtpScreen, queryParams: {'email': _emailController.text,});

                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 6.w, right: 6.w),
                        child: CommonButton(
                          buttonText: 'FOLLOWING',
                          height: 6.h,
                          // loading: authViewModel.loading,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text("Or", style: _textStyle),
                    Padding(
                      padding: EdgeInsets.only(top: 0.5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5.h,
                            width: 14.w,
                            decoration: BoxDecoration(
                                color: ColorX.whiteX,
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorX.blackX)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset('image/facebook.svg'),
                            ),
                          ),
                          Container(
                            height: 5.h,
                            width: 14.w,
                            decoration: BoxDecoration(
                                color: ColorX.whiteX,
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorX.blackX)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                              SvgPicture.asset('image/Group 16171.svg'),
                            ),
                          ),
                          Container(
                            height: 5.h,
                            width: 14.w,
                            decoration: BoxDecoration(
                                color: ColorX.whiteX,
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorX.blackX)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset('image/Logo.svg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    GestureDetector(
                        onTap: () {
                          GoRouter.of(context)
                              .pushNamed(MyAppRouteConstants.loginScreen);
                        },
                        child: Text(
                          "Already have an account?",
                          style: _textStyle,
                        )),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ))
        ],
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
