import 'package:client/src/config/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'components/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final passwordFormatter = MaskTextInputFormatter(
    mask: '###############################',
    filter: {"#": RegExp(r'[a-zA-Z0-9]')},
  );

  final numberDocumentFormatter = MaskTextInputFormatter(
    mask: '########',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final phoneFormatter = MaskTextInputFormatter(
    mask: '(+##) ### ### ###',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Registro',
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ),

                  // Formulario de Registro
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 40),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(45))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomTextField(
                          icon: Icons.email,
                          labelText: 'Email',
                        ),
                        CustomTextField(
                          icon: Icons.lock,
                          labelText: 'Contraseña',
                          isSecret: true,
                          inputFormatters: [passwordFormatter],
                        ),
                        const CustomTextField(
                            icon: Icons.person, labelText: 'Nombres'),
                        CustomTextField(
                          icon: Icons.phone,
                          labelText: 'Celular',
                          inputFormatters: [phoneFormatter],
                        ),
                        CustomTextField(
                          icon: Icons.document_scanner_sharp,
                          labelText: 'Número de DNI',
                          inputFormatters: [numberDocumentFormatter],
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              )),
                              onPressed: () {},
                              child: const Text(
                                'Registrar Usuario',
                                style: TextStyle(fontSize: 18),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios,
                          color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
