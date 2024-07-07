import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'features/blogpage/presentation/bloc/blog_page_bloc.dart';
import 'features/blogpage/presentation/view/blog_screen.dart';
import 'features/changepasswordpage/presentation/view/change_oldpw_screen.dart';
import 'features/checkoutpage/presentation/bloc/shipping_method_bloc.dart';
import 'features/checkoutpage/presentation/view/checkout_screen.dart';
import 'features/favoritepage/presentation/bloc/favourite_bloc.dart';
import 'features/homepage/presentation/bloc/home_page_bloc.dart';
import 'features/homepage/presentation/view/home_page_screen.dart';
import 'features/loginregisterpage/data/services/provider.dart';
import 'features/loginregisterpage/domain/usecases/login_usecase.dart';
import 'features/loginregisterpage/presentation/bloc/auth_bloc.dart';
import 'features/loginregisterpage/presentation/bloc/user_bloc.dart';
import 'features/loginregisterpage/presentation/view/login_screen.dart';
import 'features/orderpage/presentation/bloc/order_bloc.dart';
import 'features/orderpage/presentation/view/order_screen.dart';
import 'features/search/presentation/bloc/local_search_bloc.dart';
import 'features/shopbycategorypage/presentation/view/shopbycategory_screen.dart';
import 'features/themechange/bloc/theme_bloc.dart';
import 'features/themechange/data/theme.dart';
import 'injection_container.dart';
import 'widgets/onboarding_screen.dart';
import 'widgets/payment.dart';
import 'widgets/settings_screen.dart';
import 'widgets/testCurrentLocation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51PWhoP04xeC1lJDPeMuuUCPyRFbKsjHRJ4TG8PpgufF2Q5vUzIiBZ3ujGz1X8OKrcFIL0ROHWq7FayxQ8GPFY4Jk00YOvJLrp7';
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (final context) => UserProvider(),
        ),
        BlocProvider<AuthBloc>(create: (final context) => sl()),
        BlocProvider<ThemeBloc>(
          create: (final context) => sl(),
        ),
        BlocProvider<HomePageBloc>(
          create: (final context) => sl()..add(GetBestSellings()),
        ),
        BlocProvider<LocalSearchBloc>(
          create: (final context) => sl()..add(const GetSavedSearches()),
        ),
        BlocProvider<BlogPageBloc>(
          create: (final context) => sl()..add(GetArticles()),
        ),
        BlocProvider<ShippingMethodBloc>(
          create: (final context) => sl()..add(GetShippingMethods()),
        ),
        BlocProvider<UserBloc>(
          create: (final context) => sl()
            ..add(GetUserById(Provider.of<UserProvider>(context, listen: false)
                .getUser!
                .id!,),),
        ),
        BlocProvider<OrderBloc>(
            create: (final context) => sl()
              ..add(GetOrders(Provider.of<UserProvider>(context, listen: false)
                  .getUser!
                  .id!,),),),
        BlocProvider<FavouriteBloc>(
          create: (final context) => sl()
            ..add(GetFavourites(
                Provider.of<UserProvider>(context, listen: false)
                    .getUser!
                    .id!,),),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (final context, final state) {
          return MaterialApp(
            title: 'DoAnTotNghiep',
            debugShowCheckedModeBanner: false,
            theme: state.theme.themeData,
            darkTheme: darkTheme,
            home: const LocationScreen(),
          );
        },
      ),
    );
  }
}
