import 'package:defiscan/shared/locale/app_locale.dart';
import 'package:defiscan/shared/prefs/app_preferences.dart';
import 'package:defiscan/shared/services/storage/storage_service.dart';
import 'package:defiscan/shared/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/app_core.dart';
import 'features/settings/bloc/settings_cubit.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    loadApp();
  }

  void loadApp() async {
    await AppPreferences.init();
    await StorageService.initLocalDatabase();
    LocalJsonLocalization.delegate.directories = ['packages/defiscan/lib/i18n'];
    if (mounted) {
      setState(() => loaded = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      return SizedBox();
    }
    return MultiRepositoryProvider(
      providers: repositoryProviders,
      child: BlocProvider(
        create: (context) => SettingsCubit(),
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return MaterialApp(
              theme: AppTheme.lightTheme(),
              darkTheme: AppTheme.darkTheme(),
              themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              initialRoute: AppRoute.splash,
              onGenerateRoute: RouteGenerator.generateRoute,
              locale: Locale(state.languageCode),
              supportedLocales:
                  AppLocale.list.map((e) => Locale(e.code)).toList(),
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                LocalJsonLocalization.delegate,
              ],
            );
          },
        ),
      ),
    );
  }
}
