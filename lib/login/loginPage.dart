import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/utils/appassets.dart';
import 'package:evently_app/utils/appcolors.dart';
import 'package:evently_app/utils/approutes.dart';
import 'package:evently_app/utils/appstyles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/widgets/custom_elevated_button.dart';
import 'package:evently_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/my_user.dart';
import '../providers/user_provider.dart';
import '../utils/dialog_utils.dart';
import '../utils/firebase_utils.dart';

class Loginpage extends StatefulWidget {
  Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: height * 0.02,
                children: [

                  Image.asset(
                    themeProvider.isDark
                        ? Appassets.SmallEventlyLogoDark
                        : Appassets.SmallEventlyLogoLight,
                  ),

                  Text(
                    "login to your account".tr(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  // ================= EMAIL =================

                  CustomTextField(
                    hintText: "please enter email".tr(),
                    TextController: emailController,
                    KeyboardType: TextInputType.emailAddress,

                    Validator: (text) {
                      // Empty validation
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter Email";
                      }

                      // Email validation
                      final emailValid = RegExp(
                        r'^[a-zA-Z0-9.!#$%&'
                        r'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$',
                      ).hasMatch(text.trim());

                      if (!emailValid) {
                        return "Please Enter Valid Email";
                      }

                      return null;
                    },

                    hintStyle:
                    Theme.of(context).textTheme.bodyLarge,

                    bordercolor:
                    Theme.of(context).dividerColor,

                    fill: true,

                    fillcolor: themeProvider.isDark
                        ? Appcolors.InputsD
                        : Appcolors.InputsL,

                    prefixIcon: const Icon(
                      Icons.mail_outline,
                      color: Appcolors.GreyColor,
                    ),
                  ),

                  // ================= PASSWORD =================

                  CustomTextField(
                    hintText: "please enter password".tr(),
                    TextController: passwordController,

                    ObscureText: obscurePassword,

                    Lines: 1,

                    Validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter Password";
                      }

                      if (text.length < 6) {
                        return "Password Must Be At Least 6 Chars.";
                      }

                      return null;
                    },

                    hintStyle:
                    Theme.of(context).textTheme.bodyLarge,

                    bordercolor:
                    Theme.of(context).dividerColor,

                    fill: true,

                    fillcolor: themeProvider.isDark
                        ? Appcolors.InputsD
                        : Appcolors.InputsL,

                    prefixIcon: const Icon(
                      Icons.lock_open_outlined,
                      color: Appcolors.GreyColor,
                    ),

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Appcolors.GreyColor,
                      ),
                    ),
                  ),

                  // ================= FORGET PASSWORD =================

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "forget password".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                            decoration:
                            TextDecoration.underline,
                            decorationColor:
                            Theme.of(context).cardColor,
                            decorationThickness: 2,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // ================= LOGIN BUTTON =================

                  CustomElevatedButton(
                    onPressed: login,
                    child: Text(
                      "login".tr(),
                      style: AppStyles.Medium20WhiteDarkColor,
                    ),
                    backgroundColor:
                    Theme.of(context).cardColor,
                    verticalPadding: height * 0.015,
                  ),

                  // ================= SIGN UP =================

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "dont have account".tr(),
                        style:
                        Theme.of(context).textTheme.bodyLarge,
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.RegisterScreen,
                          );
                        },
                        child: Text(
                          "sign up".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                            decoration:
                            TextDecoration.underline,
                            decorationColor:
                            Theme.of(context).cardColor,
                            decorationThickness: 2,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // ================= OR =================

                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color:
                          Theme.of(context).dividerColor,
                          thickness: 2,
                          indent: width * 0.06,
                          endIndent: width * 0.06,
                        ),
                      ),

                      Text(
                        "or".tr(),
                        style:
                        Theme.of(context).textTheme.labelMedium,
                      ),

                      Expanded(
                        child: Divider(
                          color:
                          Theme.of(context).dividerColor,
                          thickness: 2,
                          indent: width * 0.06,
                          endIndent: width * 0.06,
                        ),
                      ),
                    ],
                  ),

                  // ================= GOOGLE =================

                  CustomElevatedButton(
                    onPressed: () {},
                    child: Row(
                      spacing: width * 0.02,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Appassets.GoogleIcon),

                        Text(
                          "login with google".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium,
                        ),
                      ],
                    ),
                    backgroundColor: themeProvider.isDark
                        ? Appcolors.InputsD
                        : Appcolors.WhiteColor,
                    verticalPadding: height * 0.015,
                    sideColor:
                    Theme.of(context).dividerColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================= LOGIN =================

  void login() async{
    // Run all validators
    if (!formKey.currentState!.validate()) {
      return;
    }

    // Validation succeeded
    print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");

    try {
      DialogUtils.showLoading(context: context, LoadingText: "Loading....");
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
      );
      // Fetch user from Firestore
      MyUser? myUser = await FirebaseUtils.readUserFromFireStore(credential.user?.uid ?? "");
      if (myUser == null) {
        myUser = MyUser(uId: credential.user?.uid ?? "", email: emailController.text, name: credential.user?.displayName ?? "User");
      }
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.updateUser(myUser);
      // Load events for this user
      var eventsProvider = Provider.of<EventsProvider>(context, listen: false);
      eventsProvider.loadEvents(myUser.uId);
      DialogUtils.hideLoading(context: context);
      DialogUtils.showMessage(context: context,
          Content: "Login Successfully",
          Title: "Success",posActionName:"Ok",posAction: (){
        Navigator.pushReplacementNamed(context, AppRoutes.HomeScreen);
          });
    }on FirebaseAuthException catch(e){
      print(e.code);
      if(e.code=='invalid-credential'){
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(context: context,
            Content: "The supplied auth credential is incorrect, Malformed or has expired.",
            Title: "Error",posActionName:"Ok");
      }
    }
    catch (e) {
      DialogUtils.hideLoading(context: context);
      DialogUtils.showMessage(context: context,
          Content: e.toString(),
          Title: "Error",posActionName:"Ok");
    }
  }
}
