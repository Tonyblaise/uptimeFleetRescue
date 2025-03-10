import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
          routes: [
            FFRoute(
              name: LoginWidget.routeName,
              path: LoginWidget.routePath,
              builder: (context, params) => LoginWidget(
                fleetManagerId: params.getParam(
                  'fleetManagerId',
                  ParamType.String,
                ),
                serviceProviderId: params.getParam(
                  'serviceProviderId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ForgotPasswordWidget.routeName,
              path: ForgotPasswordWidget.routePath,
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: CheckYourEmailWidget.routeName,
              path: CheckYourEmailWidget.routePath,
              builder: (context, params) => CheckYourEmailWidget(),
            ),
            FFRoute(
              name: ChangePasswordWidget.routeName,
              path: ChangePasswordWidget.routePath,
              builder: (context, params) => ChangePasswordWidget(
                dfdfg: params.getParam(
                  'dfdfg',
                  ParamType.double,
                ),
              ),
            ),
            FFRoute(
              name: ConnectionProblemWidget.routeName,
              path: ConnectionProblemWidget.routePath,
              builder: (context, params) => ConnectionProblemWidget(),
            ),
            FFRoute(
              name: DashboardDriverWidget.routeName,
              path: DashboardDriverWidget.routePath,
              builder: (context, params) => DashboardDriverWidget(),
            ),
            FFRoute(
              name: VehicleConfirmationWidget.routeName,
              path: VehicleConfirmationWidget.routePath,
              builder: (context, params) => VehicleConfirmationWidget(
                service: params.getParam(
                  'service',
                  ParamType.String,
                ),
                additionalInfo: params.getParam(
                  'additionalInfo',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ServiceConfirmationWidget.routeName,
              path: ServiceConfirmationWidget.routePath,
              builder: (context, params) => ServiceConfirmationWidget(
                request: params.getParam(
                  'request',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: DriverChatWidget.routeName,
              path: DriverChatWidget.routePath,
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'driverChat')
                  : DriverChatWidget(
                      state: params.getParam(
                        'state',
                        ParamType.int,
                      ),
                    ),
            ),
            FFRoute(
              name: ImageDetailsWidget.routeName,
              path: ImageDetailsWidget.routePath,
              builder: (context, params) => ImageDetailsWidget(
                chatRef: params.getParam(
                  'chatRef',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: DashboardTechnicianWidget.routeName,
              path: DashboardTechnicianWidget.routePath,
              builder: (context, params) => DashboardTechnicianWidget(),
            ),
            FFRoute(
              name: ServiceSummaryWidget.routeName,
              path: ServiceSummaryWidget.routePath,
              builder: (context, params) => ServiceSummaryWidget(
                requestId: params.getParam(
                  'requestId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ChangeYourPhotoWidget.routeName,
              path: ChangeYourPhotoWidget.routePath,
              builder: (context, params) => ChangeYourPhotoWidget(),
            ),
            FFRoute(
              name: SettingsWidget.routeName,
              path: SettingsWidget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'settings')
                  : SettingsWidget(),
            ),
            FFRoute(
              name: SettingsSpWidget.routeName,
              path: SettingsSpWidget.routePath,
              builder: (context, params) => SettingsSpWidget(),
            ),
            FFRoute(
              name: SelectLocationWidget.routeName,
              path: SelectLocationWidget.routePath,
              builder: (context, params) => SelectLocationWidget(
                service: params.getParam(
                  'service',
                  ParamType.String,
                ),
                additionalInfo: params.getParam(
                  'additionalInfo',
                  ParamType.String,
                ),
                address: params.getParam(
                  'address',
                  ParamType.String,
                ),
                dropOffLocation: params.getParam(
                  'dropOffLocation',
                  ParamType.LatLng,
                ),
              ),
            ),
            FFRoute(
              name: OnboardWidget.routeName,
              path: OnboardWidget.routePath,
              builder: (context, params) => OnboardWidget(
                fleetManagerId: params.getParam(
                  'fleetManagerId',
                  ParamType.String,
                ),
                serviceProviderId: params.getParam(
                  'serviceProviderId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: StartRequestWidget.routeName,
              path: StartRequestWidget.routePath,
              builder: (context, params) => StartRequestWidget(
                request: params.getParam(
                  'request',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: VerifyWidget.routeName,
              path: VerifyWidget.routePath,
              builder: (context, params) => VerifyWidget(
                phoneNumber: params.getParam(
                  'phoneNumber',
                  ParamType.String,
                ),
                serviceProviderId: params.getParam(
                  'serviceProviderId',
                  ParamType.String,
                ),
                fleetManagerId: params.getParam(
                  'fleetManagerId',
                  ParamType.String,
                ),
                signUpType: params.getParam(
                  'signUpType',
                  ParamType.String,
                ),
                fullName: params.getParam(
                  'fullName',
                  ParamType.String,
                ),
                signUp: params.getParam(
                  'signUp',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: TechStatusWidget.routeName,
              path: TechStatusWidget.routePath,
              builder: (context, params) => TechStatusWidget(),
            ),
            FFRoute(
              name: TechnicianChatWidget.routeName,
              path: TechnicianChatWidget.routePath,
              requireAuth: true,
              builder: (context, params) => TechnicianChatWidget(
                state: params.getParam(
                  'state',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: Chat2Details1Widget.routeName,
              path: Chat2Details1Widget.routePath,
              asyncParams: {
                'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
              },
              builder: (context, params) => Chat2Details1Widget(
                chatRef: params.getParam(
                  'chatRef',
                  ParamType.Document,
                ),
                driver: params.getParam(
                  'driver',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: ImageDetails1Widget.routeName,
              path: ImageDetails1Widget.routePath,
              asyncParams: {
                'chatMessage':
                    getDoc(['chat_messages'], ChatMessagesRecord.fromSnapshot),
              },
              builder: (context, params) => ImageDetails1Widget(
                chatMessage: params.getParam(
                  'chatMessage',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: PreviousJobsWidget.routeName,
              path: PreviousJobsWidget.routePath,
              builder: (context, params) => PreviousJobsWidget(),
            ),
            FFRoute(
              name: SuccessWidget.routeName,
              path: SuccessWidget.routePath,
              builder: (context, params) => SuccessWidget(
                driver: params.getParam(
                  'driver',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: TechEnrouteWidget.routeName,
              path: TechEnrouteWidget.routePath,
              asyncParams: {
                'chat': getDoc(['chats'], ChatsRecord.fromSnapshot),
              },
              builder: (context, params) => TechEnrouteWidget(
                chat: params.getParam(
                  'chat',
                  ParamType.Document,
                ),
                request: params.getParam(
                  'request',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['request'],
                ),
              ),
            ),
            FFRoute(
              name: MoreDetailsWidget.routeName,
              path: MoreDetailsWidget.routePath,
              builder: (context, params) => MoreDetailsWidget(
                fault: params.getParam(
                  'fault',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: LandingPageWidget.routeName,
              path: LandingPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'landing_page')
                  : LandingPageWidget(),
            ),
            FFRoute(
              name: VehicleConfirmation2Widget.routeName,
              path: VehicleConfirmation2Widget.routePath,
              builder: (context, params) => VehicleConfirmation2Widget(
                service: params.getParam(
                  'service',
                  ParamType.String,
                ),
                additionalInfo: params.getParam(
                  'additionalInfo',
                  ParamType.String,
                ),
                licensePlate: params.getParam(
                  'licensePlate',
                  ParamType.String,
                ),
                state: params.getParam(
                  'state',
                  ParamType.String,
                ),
                notes: params.getParam(
                  'notes',
                  ParamType.String,
                ),
                color: params.getParam(
                  'color',
                  ParamType.String,
                ),
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RequestService2Widget.routeName,
              path: RequestService2Widget.routePath,
              builder: (context, params) => RequestService2Widget(
                fleetManagerId: params.getParam(
                  'fleetManagerId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: VehicleConfirmationManualWidget.routeName,
              path: VehicleConfirmationManualWidget.routePath,
              builder: (context, params) => VehicleConfirmationManualWidget(
                service: params.getParam(
                  'service',
                  ParamType.String,
                ),
                additionalInfo: params.getParam(
                  'additionalInfo',
                  ParamType.String,
                ),
                licensePlate: params.getParam(
                  'licensePlate',
                  ParamType.String,
                ),
                state: params.getParam(
                  'state',
                  ParamType.String,
                ),
                notes: params.getParam(
                  'notes',
                  ParamType.String,
                ),
                color: params.getParam(
                  'color',
                  ParamType.String,
                ),
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
                image: params.getParam(
                  'image',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: VehicleConfirmation3Widget.routeName,
              path: VehicleConfirmation3Widget.routePath,
              builder: (context, params) => VehicleConfirmation3Widget(
                service: params.getParam(
                  'service',
                  ParamType.String,
                ),
                additionalInfo: params.getParam(
                  'additionalInfo',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RequestServiceWidget.routeName,
              path: RequestServiceWidget.routePath,
              builder: (context, params) => RequestServiceWidget(
                fleetManagerId: params.getParam(
                  'fleetManagerId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: TestWidget.routeName,
              path: TestWidget.routePath,
              builder: (context, params) => TestWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primary,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Splash-Screen_2667.A-_ios-_Role_1.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
