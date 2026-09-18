import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:evently_app/model/my_user.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/utils/appassets.dart';
import 'package:evently_app/utils/appcolors.dart';
import 'package:evently_app/utils/approutes.dart';
import 'package:evently_app/utils/appstyles.dart';
import 'package:evently_app/utils/dialog_utils.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/widgets/custom_elevated_button.dart';
import 'package:evently_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/firebase_utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  // Form Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Password visibility
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;

    final themeProvider = Provider.of<AppThemeProvider>(context);

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

                  // ================= LOGO =================

                  Image.asset(
                    themeProvider.isDark
                        ? Appassets.SmallEventlyLogoDark
                        : Appassets.SmallEventlyLogoLight,
                  ),

                  // ================= TITLE =================

                  Text(
                    "create your account".tr(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  // ================= NAME =================

                  CustomTextField(
                    TextController: nameController,
                    hintText: "please enter name".tr(),
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    bordercolor: Theme.of(context).dividerColor,
                    fill: true,
                    fillcolor: themeProvider.isDark
                        ? Appcolors.InputsD
                        : Appcolors.InputsL,
                    prefixIcon: const Icon(
                      Icons.person_outline_outlined,
                      color: Appcolors.GreyColor,
                    ),
                    Validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter Name";
                      }

                      if (text.trim().length < 3) {
                        return "Name Must Be At Least 3 Characters";
                      }

                      return null;
                    },
                  ),

                  // ================= EMAIL =================

                  CustomTextField(
                    TextController: emailController,
                    hintText: "please enter email".tr(),
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    bordercolor: Theme.of(context).dividerColor,
                    fill: true,
                    fillcolor: themeProvider.isDark
                        ? Appcolors.InputsD
                        : Appcolors.InputsL,
                    prefixIcon: const Icon(
                      Icons.mail_outline,
                      color: Appcolors.GreyColor,
                    ),
                    Validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter Email";
                      }

                      final email = text.trim();

                      final emailValid = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      ).hasMatch(email);

                      if (!emailValid) {
                        return "Please Enter Valid Email";
                      }

                      return null;
                    },
                  ),

                  // ================= PASSWORD =================

                  CustomTextField(
                    TextController: passwordController,
                    hintText: "please enter password".tr(),
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    bordercolor: Theme.of(context).dividerColor,
                    fill: true,
                    Lines: 1,
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
                    ObscureText: obscurePassword,
                    Validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Please Enter Password";
                      }

                      if (text.length < 6) {
                        return "Password Must Be At Least 6 Chars.";
                      }

                      return null;
                    },
                  ),

                  // ================= CONFIRM PASSWORD =================

                  CustomTextField(
                    TextController: confirmPasswordController,
                    hintText: "confirm your password".tr(),
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    bordercolor: Theme.of(context).dividerColor,
                    fill: true,
                    Lines: 1,
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
                          obscureConfirmPassword =
                          !obscureConfirmPassword;
                        });
                      },
                      icon: Icon(
                        obscureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Appcolors.GreyColor,
                      ),
                    ),
                    ObscureText: obscureConfirmPassword,
                    Validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Please Enter Re-Password";
                      }

                      if (text != passwordController.text) {
                        return "Passwords Aren't Same";
                      }

                      return null;
                    },
                  ),

                  SizedBox(
                    height: height * 0.02,
                  ),

                  // ================= SIGN UP =================

                  CustomElevatedButton(
                    onPressed: Register,
                    child: Text(
                      "sign up".tr(),
                      style: AppStyles.Medium20WhiteDarkColor,
                    ),
                    backgroundColor: Theme.of(context).cardColor,
                    verticalPadding: height * 0.015,
                  ),

                  // ================= LOGIN =================

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "already have an account".tr(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "login".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                            decoration: TextDecoration.underline,
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
                          color: Theme.of(context).dividerColor,
                          thickness: 2,
                          indent: width * 0.06,
                          endIndent: width * 0.06,
                        ),
                      ),
                      Text(
                        "or".tr(),
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).dividerColor,
                          thickness: 2,
                          indent: width * 0.06,
                          endIndent: width * 0.06,
                        ),
                      ),
                    ],
                  ),

                  // ================= GOOGLE =================

                  CustomElevatedButton(
                    onPressed: () {
                      // Google Sign Up
                    },
                    child: Row(
                      spacing: width * 0.02,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Appassets.GoogleIcon,
                        ),
                        Text(
                          "sign up with google".tr(),
                          style:
                          Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    backgroundColor: themeProvider.isDark
                        ? Appcolors.InputsD
                        : Appcolors.WhiteColor,
                    verticalPadding: height * 0.015,
                    sideColor: Theme.of(context).dividerColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================= REGISTER =================

  void Register() async{
    // Validate all fields
    if (!formKey.currentState!.validate()) {
      return;
    }

    // Validation successful
    final String name = nameController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text;

    print("Name: $name");
    print("Email: $email");
    print("Password: $password");

    try {
      DialogUtils.showLoading(context: context, LoadingText: "Loading....");
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      MyUser myUser=MyUser(uId: credential.user?.uid??"", email: emailController.text, name: nameController.text);
      // Save user to Firestore
      await FirebaseUtils.addUserToFireStore(myUser);
      var userProvider=Provider.of<UserProvider>(context,listen:false);
      userProvider.updateUser(myUser);
      // Load events for this user
      var eventsProvider = Provider.of<EventsProvider>(context, listen: false);
      eventsProvider.loadEvents(myUser.uId);
      DialogUtils.hideLoading(context: context);
      DialogUtils.showMessage(context: context,
          Content: "Created Account Successfully",
          Title: "Success",posActionName:"Ok",posAction: (){
          Navigator.pushReplacementNamed(context,AppRoutes.HomeScreen);
          });
    }on FirebaseAuthException catch (e){
      if(e.code=="weak-password"){
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(context: context,
            Content: "The Password You Provided is Weak",
            Title: "Error",posActionName:"Ok");
      }else if(e.code=="email-already-in-use"){
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(context: context,
            Content: "That Email is Already in Use",
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