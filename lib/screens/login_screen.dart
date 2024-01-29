import 'package:flutter/material.dart';
import 'package:pfe_test_app/menu.dart';

class LoginScrenn extends StatelessWidget {
  const LoginScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
          child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.sizeOf(context).width * 0.3,
              height: MediaQuery.sizeOf(context).height * 0.2,
              child: ClipRect(
                child: CustomPaint(
                  painter: LargeCirclePainter(
                    circleColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                ///chck this latter **********************************************
                ///***************************************************************
                height: MediaQuery.sizeOf(context).height / 6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome,",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 24,
                      ),
                      child: Text(
                        "Sign in to continue",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(20),
                      topEnd: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 24,
                              bottom: 8,
                            ),
                            child: Text(
                              "User Name",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 32),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                prefixIcon: const Icon(
                                  Icons.person_outline,
                                ),
                                prefixIconColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.focused)) {
                                      return Theme.of(context)
                                          .colorScheme
                                          .primary;
                                    }
                                    if (states.contains(MaterialState.error)) {
                                      return Theme.of(context)
                                          .colorScheme
                                          .error;
                                    }
                                    return Colors.grey;
                                  },
                                ),
                                label: const Text("enter your user name"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Password",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 32),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                ),
                                prefixIconColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.focused)) {
                                      return Theme.of(context)
                                          .colorScheme
                                          .primary;
                                    }
                                    if (states.contains(MaterialState.error)) {
                                      return Theme.of(context)
                                          .colorScheme
                                          .error;
                                    }
                                    return Colors.grey;
                                  },
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.visibility_outlined),
                                ),
                                suffixIconColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.focused)) {
                                      return Theme.of(context)
                                          .colorScheme
                                          .primary;
                                    }
                                    if (states.contains(MaterialState.error)) {
                                      return Theme.of(context)
                                          .colorScheme
                                          .error;
                                    }
                                    return Colors.grey;
                                  },
                                ),
                                label: const Text("enter your password"),
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width / 2,
                              height: 48,
                              child: FilledButton(
                                style: const ButtonStyle(),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Menu(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Login",
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

class LargeCirclePainter extends CustomPainter {
  Color? circleColor;

  LargeCirclePainter({required this.circleColor});

  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = Offset(size.width, 0);
    final largeCircle = Paint()
      ..color = circleColor!
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      centerPoint,
      size.width,
      largeCircle,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
