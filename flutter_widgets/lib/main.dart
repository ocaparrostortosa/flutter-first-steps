import 'package:flutter/material.dart';
import 'package:flutter_widgets/src/pages/alert_page.dart';
import 'package:flutter_widgets/src/routes/routes.dart'; //Rutas de las aplicaciones
import 'package:flutter_localizations/flutter_localizations.dart'; //Idiomas

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('es', 'ES'), // Hebrew, no country code
        const Locale.fromSubtags(
            languageCode: 'zh'), // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
      title: 'Flutter Widgets',
      //home: HomePagePages(),
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      routes:
          getApplicationRoutes(), //Metodo para obtener las rutas de router.dart
      onGenerateRoute: (settings) {
        //Metodo a ejecutar cuando se genere una ruta con nombre
        print("Ruta llamada ${settings.name}");
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      }, //Definimos las rutas para las paginas en la app
    );
  }
}
