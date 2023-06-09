import 'package:country_code_picker/country_code_picker.dart';
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
import '../../Utilities/ServiceProvider.dart';
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
      body:Column(
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
                            UserPrefences.feedType == "USER"?"Inscription":"Registration",
                            style: GoogleFonts.poppins(
                                fontSize: 32,
                                color: ColorX.whiteX,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            UserPrefences.feedType == "USER"?"Client":"Artisan",
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
                                width: 38.w,
                                height: 7.9.h,
                                padding: EdgeInsets.only(top: 2.h),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    countryPick(),
                                    Icon(Icons.keyboard_arrow_down, size: 20,)
                                  ],
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

  /*"{
""fullName"": ""neeraj sharmaa"",
""age"": ""20"",
""gender"": ""Male"",
""email"": ""neklfjd@gmail.com"",
""mobile"": ""1234567890"",
""password"": ""password123"",
""description"": ""Customer description"",
""phone"": ""9865321478"",
""card"":{
""fullName"": ""sk"",
""cardNo"": ""9876543217654321"",
""expiryDate"": ""09/25"",
""cvv"": ""789""
},
""isVerified"": false,
""location"":{
""lat"":""342"",
""long"":""232""
},
""role"": ""serviceProvider""
}"*/

  signupCall() async{
    Map formData = {
    'email': _emailController.text,
    'password': _passWordController.text,
    'name': _fullNameController.text,
    'age': _ageController.text,
    'gender': roleNew.toString(),
    'mobile_no': '+${countryCode! + _phoneNumberController.text}',
    };

    var response = await ServiceProvider.apiPostCall(
        ServiceProvider.signInUrl, formData, context);
    print('signup response os $response');
    if (kDebugMode) {
      print('signup response os $response');
    }
    if (kDebugMode) {
      print('user is is ${response['data']['userId']}');
      // print(json.decode(response.body)['data']['otp']);
      // print(json.decode(response.body)['data']['userId']);
    }

/*
    GoRouter.of(context)
        .pushNamed(MyAppRouteConstants.phoneVerification, params: {
      'phoneNumber': phoneController.text,
    });
    UserPrefs.userId = response['data']['userId'];

    point number 3: We are not getting your point properly, I think you want to show request on main page with red mark after request decline
    We have start worked on another queries.
    SharedPreferences pres = await SharedPreferences.getInstance();
*/

  }
  Widget countryPick(){
    return CountryCodePicker(
      /*initialValue: 'IN',
      itemBuilder: _buildDropdownItem,
      priorityList: [
        CountryPickerUtils.getCountryByIsoCode('GB'),
        CountryPickerUtils.getCountryByIsoCode('CN'),
      ],
      sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
      onValuePicked: (Country country) {
        countryCode = country.phoneCode;
      },*/

      onChanged: (value) {
        countryCode = value.dialCode;
      },
      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
      initialSelection: 'IN',
      favorite: ['+91','US'],
      // optional. Shows only country name and flag
      showCountryOnly: false,
      showFlagDialog: true,
      // optional. Shows only country name and flag when popup is closed.
      showOnlyCountryWhenClosed: false,
      // optional. aligns the flag and the Text left
      alignLeft: false,
    );
  }
}
