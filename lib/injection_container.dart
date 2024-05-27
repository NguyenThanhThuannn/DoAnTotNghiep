import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/blogpage/data/data_source/remote/newapiS.dart';
import 'features/blogpage/data/repository/article_repository_impl.dart';
import 'features/blogpage/domain/repository/article_repository.dart';
import 'features/blogpage/domain/usecases/get_article.dart';
import 'features/blogpage/presentation/bloc/blog_page_bloc.dart';
import 'features/faqpage/data/repository/faq_repository_impl.dart';
import 'features/faqpage/domain/repository/faq_repository.dart';
import 'features/faqpage/domain/usecases/get_faq.dart';
import 'features/faqpage/presentation/bloc/faq_page_bloc.dart';
import 'features/homepage/data/repository/product_repository_impl.dart';
import 'features/homepage/domain/repository/product_repository.dart';
import 'features/homepage/domain/usecases/get_bestselling.dart';
import 'features/homepage/domain/usecases/get_dailydeals.dart';
import 'features/homepage/domain/usecases/get_dailydealsweek.dart';
import 'features/homepage/domain/usecases/get_dailydealsweek2.dart';
import 'features/homepage/domain/usecases/get_hotnewarrival.dart';
import 'features/homepage/domain/usecases/get_recentbrowsing.dart';
import 'features/homepage/domain/usecases/get_todaysdeals.dart';
import 'features/homepage/presentation/bloc/countdown_bloc.dart';
import 'features/homepage/presentation/bloc/home_page_bloc.dart';
import 'features/homepage/presentation/bloc/home_page_dailydeals_bloc.dart';
import 'features/homepage/presentation/bloc/home_page_dailydealsweek2_bloc.dart';
import 'features/homepage/presentation/bloc/home_page_dailydealsweek_bloc.dart';
import 'features/homepage/presentation/bloc/home_page_hotnewarrival_bloc.dart';
import 'features/homepage/presentation/bloc/home_page_recentbrowsing_bloc.dart';
import 'features/homepage/presentation/bloc/home_page_todaysdeals_bloc.dart';
import 'features/policypage/data/repository/policy_repository_impl.dart';
import 'features/policypage/domain/repository/policy_repository.dart';
import 'features/policypage/domain/usecases/get_policy.dart';
import 'features/policypage/presentation/bloc/policy_screen_bloc.dart';
import 'features/search/data/data_sources/local/app_database.dart';
import 'features/search/data/repository/search_repository_impl.dart';
import 'features/search/domain/repository/search_repository.dart';
import 'features/search/domain/usecases/get_saved_search.dart';
import 'features/search/domain/usecases/remove_itemsearch.dart';
import 'features/search/domain/usecases/save_itemsearch.dart';
import 'features/search/presentation/bloc/local_search_bloc.dart';
import 'features/shopbycategorypage/data/repository/category_repository_impl.dart';
import 'features/shopbycategorypage/domain/repository/category_repository.dart';
import 'features/shopbycategorypage/domain/usecases/get_category.dart';
import 'features/shopbycategorypage/presentation/bloc/shopbycategory_page_bloc.dart';
import 'features/termpage/data/repository/term_repository_impl.dart';
import 'features/termpage/domain/repository/term_repository.dart';
import 'features/termpage/domain/usecases/get_term.dart';
import 'features/termpage/presentation/bloc/term_page_bloc.dart';
import 'features/themechange/bloc/theme_bloc.dart';
import 'features/themechange/data/theme_repository_impl.dart';
import 'features/themechange/domain/get_theme.dart';
import 'features/themechange/domain/set_theme.dart';
import 'features/themechange/domain/theme_repository.dart';
import 'network/api.dart';
import 'network/api_provider.dart';
final sl=GetIt.instance;
Future<void> initializeDependencies() async{

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  //Dio
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<NewApiS>(NewApiS(sl()));

  //Dependencies
  sl.registerSingleton<ApiProvider>(ApiProvider());
  sl.registerSingleton<Api>(Api());
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl(sl()));
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl(sl()));
  sl.registerSingleton<PolicyRepository>(PolicyRepositoryImpl(sl()));
  sl.registerSingleton<TermRepository>(TermRepositoryImpl(sl()));
  sl.registerSingleton<FAQRepository>(FAQRepositoryImpl(sl()));
  sl.registerSingleton<ThemeRepository>(ThemeRepositoryImpl());
  sl.registerSingleton<SearchRepository>(SearchRepositoryImpl(sl(), sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //Usecases
  sl.registerSingleton<GetBestSellingUseCase>(GetBestSellingUseCase(sl()));
  sl.registerSingleton<GetDailyDealsUseCase>(GetDailyDealsUseCase(sl()));
  sl.registerSingleton<GetRecentBrowsingUseCase>(GetRecentBrowsingUseCase(sl()));
  sl.registerSingleton<GetDailyDealsWeekUseCase>(GetDailyDealsWeekUseCase(sl()));
  sl.registerSingleton<GetDailyDealsWeek2UseCase>(GetDailyDealsWeek2UseCase(sl()));
  sl.registerSingleton<GetHotNewArrivalUseCase>(GetHotNewArrivalUseCase(sl()));
  sl.registerSingleton<GetTodaysDealsUseCase>(GetTodaysDealsUseCase(sl()));

  sl.registerSingleton<GetCategoryUseCase>(GetCategoryUseCase(sl()));

  sl.registerSingleton<GetPolicyUseCase>(GetPolicyUseCase(sl()));

  sl.registerSingleton<GetTermUseCase>(GetTermUseCase(sl()));

  sl.registerSingleton<GetFAQUseCase>(GetFAQUseCase(sl()));

  sl.registerSingleton<GetThemeUseCase>(GetThemeUseCase(sl()));
  sl.registerSingleton<SetThemeUseCase>(SetThemeUseCase(sl()));

  sl.registerSingleton<GetSavedSearchUseCase>(GetSavedSearchUseCase(sl()));
  sl.registerSingleton<RemoveItemSearchUseCase>(RemoveItemSearchUseCase(sl()));
  sl.registerSingleton<SaveItemSearchUseCase>(SaveItemSearchUseCase(sl()));

  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  //Blocs
  sl.registerFactory(() => HomePageBloc(sl()));
  sl.registerFactory(() => HomePageDailydealsBloc(sl()));
  sl.registerFactory(() => HomePageRecentbrowsingBloc(sl()));
  sl.registerFactory(() => HomePageDailydealsweekBloc(sl()));
  sl.registerFactory(() => HomePageDailydealsweek2Bloc(sl()));
  sl.registerFactory(() => HomePageHotnewarrivalBloc(sl()));
  sl.registerFactory(() => HomePageTodaysdealsBloc(sl()));

  sl.registerFactory(() => ShopbycategoryPageBloc(sl()));

  sl.registerFactory(() => PolicyScreenBloc(sl()));

  sl.registerFactory(() => TermPageBloc(sl()));

  sl.registerFactory(() => FaqPageBloc(sl()));
  
  sl.registerFactory(() => ThemeBloc(sl(), sl()));

  sl.registerFactory(() => CountdownBloc());

  sl.registerFactory(() => LocalSearchBloc(sl(), sl(), sl()));

  sl.registerFactory(() => BlogPageBloc(sl()));
}