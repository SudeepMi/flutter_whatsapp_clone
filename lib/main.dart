import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme.dart';
import 'package:whatsapp_messenger/common/routes/routes.dart';
import 'package:whatsapp_messenger/common/theme/dark_theme.dart';
import 'package:whatsapp_messenger/common/theme/light_theme.dart';
import 'package:whatsapp_messenger/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_messenger/features/home/pages/home_page.dart';
import 'package:whatsapp_messenger/features/welcome/pages/welcome_page.dart';
import 'package:whatsapp_messenger/firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  var app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instanceFor(app: app).setSettings(
    appVerificationDisabledForTesting: true,
    forceRecaptchaFlow: true,
  );
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp ',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: ref.watch(userInfoAuthProvider).when(
        data: (user) {
          FlutterNativeSplash.remove();
          if (user == null) return const WelcomePage();
          return const HomePage();
        },
        error: (error, trace) {
          return const Scaffold(
            body: Center(
              child: Text("Someting went wrong"),
            ),
          );
        },
        loading: () {
          return Scaffold(
            body: Center(
              child: Icon(
                Icons.whatshot,
                color: context.theme.authAppBarTextColor,
              ),
            ),
          );
        },
      ),
      // home: const ContactPage(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
