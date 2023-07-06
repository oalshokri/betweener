import 'package:betweener/providers/connectivity_provider.dart';
import 'package:betweener/views/home/home_test.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:betweener/views/auth/login_view.dart';
import 'package:betweener/views/auth/register_view.dart';
import 'package:betweener/views/onbording/onbording_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print(
          'Message also contained a notification: ${message.notification!.title}');
    }
  });



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyConnectivity>(
          create: (_) => MyConnectivity(),
        ),
      ],
      child: MaterialApp(
        title: 'Betweener',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: kPrimaryColor,
        ),
        home: const MyHomePageTest(title: 'Betweener'),
=======
        routes: {
          '/': (context) => const OnBoardingView(),
          LoginView.id: (context) => const LoginView(),
          RegisterView.id: (context) => const RegisterView(),
        },
      ),
    );
  }
}
