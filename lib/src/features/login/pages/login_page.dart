import 'package:flutter/material.dart';
import 'package:footmoney/constants/constants.dart';
import 'package:footmoney/src/themes/themes.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/widgets.dart';
import '../../forgot/forgot.dart';
import '../../register/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  var login = TextEditingController();

  String phoneInicator = "";
  String initialCountry = 'CI';
  PhoneNumber number = PhoneNumber(isoCode: 'CI');

  final _snackBar = const SnackBar(
    content: Text("Veuillez saisir votre numéro de téléphone"),
    backgroundColor: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/login.png"),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: appWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 4.w),
                            decoration: BoxDecoration(
                              color: appWhite,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(),
                            ),
                            child: InternationalPhoneNumberInput(
                              onInputChanged: (PhoneNumber number) {
                                phoneInicator = number.phoneNumber!;
                              },
                              onInputValidated: (bool value) {},
                              errorMessage: "Le numéro est invalide",
                              hintText: "Numéro de téléphone",
                              selectorConfig: const SelectorConfig(
                                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                              ),
                              ignoreBlank: false,
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              initialValue: number,
                              textFieldController: login,
                              formatInput: true,
                              keyboardType: const TextInputType.numberWithOptions(
                                signed: true,
                                decimal: true,
                              ),
                              inputBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              onSaved: (PhoneNumber number) {},
                            ),
                          ),
                          Gap(1.h),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgotPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Téléphone oublié?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: appOrange,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Gap(1.h),
                          SubmitButton(
                            AppConstants.btnLogin,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(_snackBar);
                              }
                            },
                          ),
                          Gap(3.h),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Vous n'avez pas de compte? S'enregistrer",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: appOrange,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
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
}
