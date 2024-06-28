import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'features/blogpage/presentation/bloc/blog_page_bloc.dart';
import 'features/blogpage/presentation/view/blog_screen.dart';
import 'features/changepasswordpage/presentation/view/change_oldpw_screen.dart';
import 'features/checkoutpage/presentation/view/checkout_screen.dart';
import 'features/homepage/presentation/bloc/home_page_bloc.dart';
import 'features/homepage/presentation/view/home_page_screen.dart';
import 'features/loginregisterpage/data/services/provider.dart';
import 'features/loginregisterpage/domain/usecases/login_usecase.dart';
import 'features/loginregisterpage/presentation/bloc/auth_bloc.dart';
import 'features/loginregisterpage/presentation/bloc/user_bloc.dart';
import 'features/loginregisterpage/presentation/view/login_screen.dart';
import 'features/search/presentation/bloc/local_search_bloc.dart';
import 'features/shopbycategorypage/presentation/view/shopbycategory_screen.dart';
import 'features/themechange/bloc/theme_bloc.dart';
import 'features/themechange/data/theme.dart';
import 'injection_container.dart';
import 'widgets/onboarding_screen.dart';
import 'widgets/settings_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
            create: (final context) => UserProvider(),),
        BlocProvider<AuthBloc>(create: (final context) => sl()),
        BlocProvider<ThemeBloc>(
          create: (final context) => sl(),
        ),
        BlocProvider<HomePageBloc>(
          create: (final context) => sl()..add(GetBestSellings()),
        ),
        /* BlocProvider<HomePageDailydealsBloc>(
          create: (final context) => sl()..add(GetDailyDeals()),
        ),
        BlocProvider<HomePageRecentbrowsingBloc>(
          create: (final context) => sl()..add(GetRecentBrowsing()),
        ),
        BlocProvider<HomePageDailydealsweekBloc>(
          create: (final context) => sl()..add(GetDailyDealsWeek()),
        ),
        BlocProvider<HomePageDailydealsweek2Bloc>(
          create: (final context) => sl()..add(GetDailyDealsWeek2()),
        ),
        BlocProvider<HomePageHotnewarrivalBloc>(
          create: (final context) => sl()..add(GetHotNewArrivals()),
        ),
        BlocProvider<HomePageTodaysdealsBloc>(
          create: (final context) => sl()..add(GetTodaysDeals()),
        ), */
        BlocProvider<LocalSearchBloc>(
          create: (final context) => sl()..add(const GetSavedSearches()),
        ),
        BlocProvider<BlogPageBloc>(
          create: (final context) => sl()..add(GetArticles()),
        ),
        BlocProvider<UserBloc>(
          create: (final context) => sl()
            ..add(const GetUserById(1)),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (final context, final state) {
          return MaterialApp(
            title: 'DoAnTotNghiep',
            debugShowCheckedModeBanner: false,
            theme: state.theme.themeData,
            darkTheme: darkTheme,
            home: const HomePageScreen(),
          );
        },
      ),
    );
  }
}
