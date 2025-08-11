import 'package:flutter/material.dart';
import 'package:flutter_shared_components/screens/home_screen.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

class SoloScriptedApp extends StatefulWidget {
  const SoloScriptedApp(
      {super.key,
      required this.title,
      required this.localizationsDelegates,
      required this.supportedLocales,
      required this.mainScreen});

  final String title;

  final List<LocalizationsDelegate<dynamic>> localizationsDelegates;

  final List<Locale> supportedLocales;

  final Widget mainScreen;

  @override
  State<SoloScriptedApp> createState() => _SoloScriptedAppState();
}

class _SoloScriptedAppState extends State<SoloScriptedApp> {
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _initialize();
    });
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    await _requestTrackingAuthorization();
    if (mounted) {
      setState(() {
        _isReady = true;
      });
    }
  }

  Future<String?> _requestTrackingAuthorization() async {
    try {
      final status = await AppTrackingTransparency.trackingAuthorizationStatus;
      if (status == TrackingStatus.authorized) {
        final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
        return uuid;
      } else if(status == TrackingStatus.notDetermined) {
        await AppTrackingTransparency.requestTrackingAuthorization();
        final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
        return uuid;
      }
    } catch (e) {
      // Silently ignore if there's an error during the request, as the
      // app should continue to function without this permission.
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      localizationsDelegates: widget.localizationsDelegates,
      supportedLocales: widget.supportedLocales,
      home: _isReady
          ? HomeScreen(
              nextScreen: widget.mainScreen,
            )
          : const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
