import 'lib_exp.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
String? locale;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  const String locale = '';

  runApp(const MyApp(locale: locale));
}

class MyApp extends StatefulWidget {
  const MyApp({required this.locale, Key? key}) : super(key: key);
  final String? locale;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  @override
  void initState() {
    super.initState();

    if (widget.locale != null) {
      _locale = Locale.fromSubtags(languageCode: widget.locale!);
      locale = widget.locale;
    }
  }

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
      locale = _locale!.languageCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// to hide keyboard globally when user touch out of the inbox box
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ethical Info 2D',
        theme: ThemeData(),
        navigatorKey: navigatorKey,
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('zh', ''),
          Locale('th', ''),
          Locale('mm', ''),
        ],
        locale: _locale,
        home: Container(),
      ),
    );
  }
}
