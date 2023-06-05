import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../Resources/Component/common_button.dart';
import '../../Resources/colors.dart';
import '../../Utilities/Routes/routes.dart';
import '../../Utilities/ServiceProvider.dart';
import '../../View_Model_Data/user_prefences.dart';



class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ///client
  final ValueNotifier<bool> _obscurePassWord = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passWordController = TextEditingController();

  FocusNode emailFocus = FocusNode();

  FocusNode passWordFocus = FocusNode();

  @override
  void dispose(){
    _obscurePassWord.dispose();
    _emailController.dispose();
    _passWordController.dispose();
    emailFocus.dispose();
    passWordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: UserPrefences.feedType=='USER'?
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'image/Vector (1).svg',
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
                        SizedBox(height: 0.5.h,),
                        Text(
                          "Login",
                          style: GoogleFonts.poppins(
                              fontSize: 32,
                              color: ColorX.whiteX,
                              fontWeight: FontWeight.w600),
                        ),
                        Text('Lorem Ipsum is simply dummy text \nof the printing and typesetting industry.',textAlign: TextAlign.justify,style: GoogleFonts.quicksand(
                            fontSize: 16,
                            color: ColorX.whiteX,
                            fontWeight: FontWeight.w500),)
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
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: Text("Email or Phone Number", style: _textStyle),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.w, right: 6.w),
                          child: TextFormField(
                            controller: _emailController,
                            focusNode: emailFocus,
                            onFieldSubmitted: (value){
                              passWordFocus.requestFocus();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
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
                          child:  ValueListenableBuilder(
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
                      height: 4.h,
                    ),
                    GestureDetector(
                      onTap: (){

                        loginCall();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 6.w, right: 6.w),
                        child: CommonButton(
                          height: 7.h,
                          buttonText: 'LOGIN',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(
                        child: Text(
                          'Or Login with',
                          style: _textStyle,
                        )),
                    SizedBox(
                      height: 1.h,
                    ),
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
                              child: SvgPicture.asset('image/Group 16171.svg'),
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
                      height: 2.h,
                    ),
                    InkWell(
                      onTap: (){
                        GoRouter.of(context).pushNamed(MyAppRouteConstants.registerForm);
                      },
                      child: Center(
                        child: Text(
                          'Don’t have an account?',
                          style: _textStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                  ],
                ),
              ))
        ],
      ): Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'image/Vector (1).svg',
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
                        SizedBox(height: 0.5.h,),
                        Text(
                          "Login",
                          style: GoogleFonts.poppins(
                              fontSize: 32,
                              color: ColorX.whiteX,
                              fontWeight: FontWeight.w600),
                        ),
                        Text('Lorem Ipsum is simply dummy text \nof the printing and typesetting industry.',textAlign: TextAlign.justify,style: GoogleFonts.quicksand(
                            fontSize: 16,
                            color: ColorX.whiteX,
                            fontWeight: FontWeight.w500),)
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
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: Text("Email or Phone Number", style: _textStyle),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.w, right: 6.w),
                          child: TextFormField(
                            controller: _emailController,
                            focusNode: emailFocus,
                            onFieldSubmitted: (value){
                              passWordFocus.requestFocus();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
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
                          child:  ValueListenableBuilder(
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
                      height: 4.h,
                    ),
                    GestureDetector(
                      onTap: (){

                        loginCall();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 6.w, right: 6.w),
                        child: CommonButton(
                          height: 7.h,
                          buttonText: 'LOGIN',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(
                        child: Text(
                          'Or Login with',
                          style: _textStyle,
                        )),
                    SizedBox(
                      height: 1.h,
                    ),
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
                              child: SvgPicture.asset('image/Group 16171.svg'),
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
                      height: 2.h,
                    ),
                    InkWell(
                      onTap: (){
                        GoRouter.of(context).pushNamed(MyAppRouteConstants.registerForm);
                      },
                      child: Center(
                        child: Text(
                          'Don’t have an account?',
                          style: _textStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  final TextStyle _textStyle = GoogleFonts.poppins(
      color: ColorX.textColor, fontSize: 14, fontWeight: FontWeight.w400);

   loginCall() async{
     print("sadasdas");
     Map formData = {
       'email':_emailController.text,
       'password':_passWordController.text

     };
    var response = await ServiceProvider.apiPostCall(
        ServiceProvider.signInUrl, formData, context);
    if (kDebugMode) {
      print('signup response os $response');
    }
    if (kDebugMode) {
      print('user is is ${response['data']['userId']}');
      // print(json.decode(response.body)['data']['otp']);
      // print(json.decode(response.body)['data']['userId']);
    }
    /*GoRouter.of(context)
        .pushNamed(MyAppRouteConstants.phoneVerification, params: {
      'phoneNumber': phoneController.text,
    });
    UserPrefs.userId = response['data']['userId'];
    SharedPreferences pres = await SharedPreferences.getInstance();*/
  }
}
