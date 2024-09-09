import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  var login = TextEditingController();
  var name = TextEditingController();
  var lastName = TextEditingController();
  var commune = TextEditingController();

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
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset("assets/images/register2.png"),
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
                              InputText(
                                keyboardType: TextInputType.text,
                                controller: name,
                                hintText: "Nom",
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Icon(Icons.person_outline),
                                ),
                                validatorMessage:
                                "Veuillez saisir votre nom",
                              ),
                              Gap(2.h),
                              InputText(
                                keyboardType: TextInputType.text,
                                controller: lastName,
                                hintText: "Prénom",
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Icon(Icons.person_outline),
                                ),
                                validatorMessage:
                                "Veuillez saisir votre prénom",
                              ),
                              Gap(2.h),
                              InputText(
                                keyboardType: TextInputType.text,
                                controller: commune,
                                hintText: "Votre commune",
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Icon(Icons.home_outlined),
                                ),
                                validatorMessage:
                                "Veuillez saisir votre commune",
                              ),
                              Gap(2.h),
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
                                    selectorType:
                                    PhoneInputSelectorType.BOTTOM_SHEET,
                                  ),
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  selectorTextStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  initialValue: number,
                                  textFieldController: login,
                                  formatInput: true,
                                  keyboardType:
                                  const TextInputType.numberWithOptions(
                                    signed: true,
                                    decimal: true,
                                  ),
                                  inputBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  onSaved: (PhoneNumber number) {},
                                ),
                              ),
                              Gap(5.h),
                              SubmitButton(
                                AppConstants.btnRegister,
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(_snackBar);
                                  }
                                },
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
            FloatingActionButton.small(
              backgroundColor: appWhite,
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_outlined),
            )
          ],
        ),
      ),
    );
  }
}
