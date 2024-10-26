import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:client/src/auth/components/custom_text_field.dart';
import 'package:client/src/auth/sign_up_screen.dart';
import 'package:client/src/base/base_screen.dart';
import 'package:client/src/config/custom_colors.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                        TextSpan(style: const TextStyle(fontSize: 40), children: [
                      const TextSpan(
                          text: 'Green',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Grocer',
                          style: TextStyle(
                            color: CustomColors.customContrastColor,
                          ))
                    ])),
                    // Categorias
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                        child: AnimatedTextKit(
                            pause: Duration.zero,
                            repeatForever: true,
                            animatedTexts: [
                              FadeAnimatedText('Frutas'),
                              FadeAnimatedText('Verduras'),
                              FadeAnimatedText('Carnes'),
                              FadeAnimatedText('Cereales'),
                              FadeAnimatedText('Lácteos'),
                            ]),
                      ),
                    )
                  ],
                ),
              ),

              // Formulario de inicio de sesión
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(45),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CustomTextField(
                      icon: Icons.email,
                      labelText: 'Email',
                    ),
                    const CustomTextField(
                      isSecret: true,
                      icon: Icons.lock,
                      labelText: 'Contraseña',
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          )),
                          onPressed: () {

                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const BaseScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Ingresar',
                            style: TextStyle(fontSize: 18),
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            '¿Olvidaste tu contraseña?',
                            style:
                                TextStyle(color: CustomColors.customContrastColor),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 1,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text('O'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              side:
                                  const BorderSide(width: 2, color: Colors.green)),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (c) {
                                  return SignUpScreen();
                              })
                            );
                          },
                          child: const Text(
                            'Crear cuenta',
                            style: TextStyle(fontSize: 16),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
