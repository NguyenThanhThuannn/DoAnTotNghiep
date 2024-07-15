import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/blogpage/data/data_source/remote/newapiS.dart';
import 'features/blogpage/data/repository/article_repository_impl.dart';
import 'features/blogpage/domain/repository/article_repository.dart';
import 'features/blogpage/domain/usecases/get_article.dart';
import 'features/blogpage/presentation/bloc/blog_page_bloc.dart';
import 'features/checkoutpage/data/shipping_method_repository_impl.dart';
import 'features/checkoutpage/domain/getShippingMethod.dart';
import 'features/checkoutpage/domain/shipping_method_repository.dart';
import 'features/checkoutpage/presentation/bloc/shipping_method_bloc.dart';
import 'features/faqpage/data/repository/faq_repository_impl.dart';
import 'features/faqpage/domain/repository/faq_repository.dart';
import 'features/faqpage/domain/usecases/get_faq.dart';
import 'features/faqpage/presentation/bloc/faq_page_bloc.dart';
import 'features/favoritepage/data/favourite_repository_impl.dart';
import 'features/favoritepage/domain/favourtire_repository.dart';
import 'features/favoritepage/domain/getFavourite.dart';
import 'features/favoritepage/presentation/bloc/favourite_bloc.dart';
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
import 'features/loginregisterpage/data/repository/auth_repository_impl.dart';
import 'features/loginregisterpage/data/repository/user_repository_impl.dart';
import 'features/loginregisterpage/data/services/auth_service.dart';
import 'features/loginregisterpage/domain/repository/auth_repository.dart';
import 'features/loginregisterpage/domain/repository/user_repository.dart';
import 'features/loginregisterpage/domain/usecases/addProductInCart.dart';
import 'features/loginregisterpage/domain/usecases/deleteProduct.dart';
import 'features/loginregisterpage/domain/usecases/getuserbyid_usecase.dart';
import 'features/loginregisterpage/domain/usecases/login_usecase.dart';
import 'features/loginregisterpage/domain/usecases/signup_usecase.dart';
import 'features/loginregisterpage/presentation/bloc/auth_bloc.dart';
import 'features/loginregisterpage/presentation/bloc/user_bloc.dart';
import 'features/orderpage/data/repository/order_repository_impl.dart';
import 'features/orderpage/domain/repository/order_repository.dart';
import 'features/orderpage/domain/usecases/getOrder.dart';
import 'features/orderpage/presentation/bloc/order_bloc.dart';
import 'features/paymenttype/data/payment_repository_impl.dart';
import 'features/paymenttype/domain/getPaymentType.dart';
import 'features/paymenttype/domain/payment_repository.dart';
import 'features/paymenttype/presentation/bloc/payment_type_bloc.dart';
import 'features/policypage/data/repository/policy_repository_impl.dart';
import 'features/policypage/domain/repository/policy_repository.dart';
import 'features/policypage/domain/usecases/get_policy.dart';
import 'features/policypage/presentation/bloc/policy_screen_bloc.dart';
import 'features/reviewpage/data/review_repository_impl.dart';
import 'features/reviewpage/domain/getReview.dart';
import 'features/reviewpage/domain/review_repository.dart';
import 'features/reviewpage/presentation/bloc/review_bloc.dart';
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
  sl.registerSingleton<AuthService>(AuthService(sl()));
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
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));
  sl.registerSingleton<OrderRepository>(OrderRepositoryImpl(sl()));
  sl.registerSingleton<ShippingMethodRepository>(ShippingMethodRepositoryImpl(sl()));
  sl.registerSingleton<FavouriteRepository>(FavouriteRepositoryImpl(sl()));
  sl.registerSingleton<ReviewRepository>(ReviewRepositoryImpl(sl()));
  sl.registerSingleton<PaymentRepository>(PaymentRepositoryImpl(sl()));

  //Usecases
  sl.registerSingleton<GetBestSellingUseCase>(GetBestSellingUseCase(sl()));
  /* sl.registerSingleton<GetDailyDealsUseCase>(GetDailyDealsUseCase(sl()));
  sl.registerSingleton<GetRecentBrowsingUseCase>(GetRecentBrowsingUseCase(sl()));
  sl.registerSingleton<GetDailyDealsWeekUseCase>(GetDailyDealsWeekUseCase(sl()));
  sl.registerSingleton<GetDailyDealsWeek2UseCase>(GetDailyDealsWeek2UseCase(sl()));
  sl.registerSingleton<GetHotNewArrivalUseCase>(GetHotNewArrivalUseCase(sl()));
  sl.registerSingleton<GetTodaysDealsUseCase>(GetTodaysDealsUseCase(sl())); */

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

  sl.registerSingleton<GetUserByIdUseCase>(GetUserByIdUseCase(sl()));
  sl.registerSingleton<AddProductInCartUseCase>(AddProductInCartUseCase(sl()));
  sl.registerSingleton<DeleteProductInCartUseCase>(DeleteProductInCartUseCase(sl()));
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<SignupUseCase>(SignupUseCase(sl()));

  sl.registerSingleton<GetOrderUseCase>(GetOrderUseCase(sl()));

  sl.registerSingleton<GetShippingMethodUseCase>(GetShippingMethodUseCase(sl()));

  sl.registerSingleton<GetFavouriteUseCase>(GetFavouriteUseCase(sl()));

  sl.registerSingleton<GetReviewUseCase>(GetReviewUseCase(sl()));
  
  sl.registerSingleton<GetPaymentUseCase>(GetPaymentUseCase(sl()));
  //Blocs
  sl.registerFactory(() => HomePageBloc(sl()));
 /*  sl.registerFactory(() => HomePageDailydealsBloc(sl()));
  sl.registerFactory(() => HomePageRecentbrowsingBloc(sl()));
  sl.registerFactory(() => HomePageDailydealsweekBloc(sl()));
  sl.registerFactory(() => HomePageDailydealsweek2Bloc(sl()));
  sl.registerFactory(() => HomePageHotnewarrivalBloc(sl()));
  sl.registerFactory(() => HomePageTodaysdealsBloc(sl())); */

  sl.registerFactory(() => ShopbycategoryPageBloc(sl()));

  sl.registerFactory(() => PolicyScreenBloc(sl()));

  sl.registerFactory(() => TermPageBloc(sl()));

  sl.registerFactory(() => FaqPageBloc(sl()));
  
  sl.registerFactory(() => ThemeBloc(sl(), sl()));

  sl.registerFactory(() => CountdownBloc());

  sl.registerFactory(() => LocalSearchBloc(sl(), sl(), sl()));

  sl.registerFactory(() => BlogPageBloc(sl()));

  sl.registerFactory(() => AuthBloc(sl(), sl()));

  sl.registerFactory(() => UserBloc(sl(),sl(),sl()));

  sl.registerFactory(() => OrderBloc(sl()));

  sl.registerFactory(() => ShippingMethodBloc(sl()));

  sl.registerFactory(() => FavouriteBloc(sl()));

  sl.registerFactory(() => ReviewBloc(sl()));

  sl.registerFactory(() => PaymentTypeBloc(sl()));
}