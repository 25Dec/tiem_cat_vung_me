import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiem_cat_vung_me/features/auth/presentation/pages/auth_page.dart';
import 'package:tiem_cat_vung_me/features/auth/presentation/pages/register_account_page.dart';
import 'package:tiem_cat_vung_me/features/auth/presentation/pages/verify_otp_page.dart';
import 'core/res/app_theme.dart';
import 'core/routes/app_route_config.dart';
import 'core/services/firebase_options.dart';
import 'core/services/injection_container.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/product_details/presentation/bloc/product_details_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await InjectionContainer.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthBloc>()),
        BlocProvider(create: (context) => sl<HomeBloc>()),
        BlocProvider(create: (context) => sl<ProductDetailsBloc>()),
      ],
      child: MaterialApp(
        title: 'Tiem cat Vung Me',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(context).theme,
        home: RegisterAccountPage(),
        // routerConfig: AppRouteConfig(context).router,
      ),
    );
  }
}
