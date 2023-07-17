
import 'package:bonte/bottom_nav_bar/dashboard_screen.dart';
import 'package:bonte/route/route_names.dart';
import 'package:bonte/screens/kullanici_screens/badges_edit_screen.dart';
import 'package:bonte/screens/kullanici_screens/badges_screen.dart';
import 'package:bonte/screens/kullanici_screens/badges_two_edit_screen.dart';
import 'package:bonte/screens/kullanici_screens/badges_two_screen.dart';
import 'package:bonte/screens/kullanici_screens/edit_kullanici_profile_screen.dart';
import 'package:bonte/screens/kurumsal_screens/edit_kurumsal_profile_screen.dart';
import 'package:bonte/screens/guest_screen.dart';
import 'package:bonte/screens/home_screen.dart';
import 'package:bonte/screens/kullanici_screens/katildigi_etkinlikler_screen.dart';
import 'package:bonte/screens/kullanici_screens/kullanici_profile_settings_screen.dart';
import 'package:bonte/screens/kullanici_screens/kullanici_settings_screen.dart';
import 'package:bonte/screens/kurumsal_screens/kurumsal_settings_screen.dart';
import 'package:bonte/screens/login_screen.dart';
import 'package:bonte/screens/notifications_screen.dart';
import 'package:bonte/screens/open_screen.dart';
import 'package:bonte/screens/reset_password_screen.dart';
import 'package:bonte/screens/search_screen.dart';
import 'package:bonte/screens/signup_screen.dart';
import 'package:bonte/screens/kurumsal_screens/your_kurumsal_profile_screen.dart';
import 'package:bonte/utilis/etkinlik_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../bottom_nav_bar/my_screen.dart';
import '../error/route_error_screen.dart';
import '../model_providers/user_kullanici_provider.dart';


final _rootNavigator = GlobalKey<NavigatorState>();
final _shellNavigator = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {


  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/open',
      routes: [
        StatefulShellRoute.indexedStack(

            builder: (context, state, navigationShell) => DashboardScreen(key: state.pageKey, child: navigationShell),

            branches: <StatefulShellBranch>[
                StatefulShellBranch(
                    routes: <RouteBase>[
                      GoRoute(
                        path: '/',
                        name: home,
                        pageBuilder: (context, state) {
                          return NoTransitionPage(
                              child: Home(
                                key: state.pageKey,
                              )
                          );
                        },
                      ),
                    ],
                ),

              StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/search',
                      name: search,
                      pageBuilder: (context, state) {
                        return NoTransitionPage(
                            child: Search(
                              key: state.pageKey,
                            )
                        );
                      },
                    ),
                  ],
              ),
              StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/notifications',
                      name: notifications,
                      pageBuilder: (context, state) {
                        return NoTransitionPage(
                            child: Notifications(
                              key: state.pageKey,
                            )
                        );
                      },
                    ),
                  ],
              ),
              StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/yourKurumsalProfile',
                      name: yourKurumsalProfile,
                      pageBuilder: (context, state) {
                        return NoTransitionPage(
                            child: YourKurumsalProfile(
                              key: state.pageKey,
                            )
                        );
                      },
                    ),
                    //GoRoute(
                    //  path: '/yourKullaniciProfile',
                    //  name: yourKullaniciProfile,
                    //  pageBuilder: (context, state) {
                    //    return NoTransitionPage(
                    //        child: YourKullaniciProfile(
                    //          key: state.pageKey,
                    //        )
                    //    );
                    //  },
                    //),
                  ],
              ),
            ],

        ),
        ShellRoute(
          navigatorKey: _shellNavigator,
          builder: (context, state, child) => MyScreen(key: state.pageKey, child: child),
            routes: [
              GoRoute(
                path: '/open',
                name: open,
                builder: (context, state) => OpeningPage(key: state.pageKey,),
              ),
              GoRoute(
                path: '/badgesEdit',
                name: badgesEdit,
                builder: (context, state) => BadgesEdit(key: state.pageKey,),
              ),
              GoRoute(
                path: '/badges',
                name: badges,
                builder: (context, state) => Badges(key: state.pageKey,),
              ),
              GoRoute(
                path: '/badgesTwo',
                name: badgesTwo,
                builder: (context, state) => BadgesTwo(key: state.pageKey,),
              ),
              GoRoute(
                path: '/badgesTwoEdit',
                name: badgesTwoEdit,
                builder: (context, state) => BadgesTwoEdit(key: state.pageKey,),
              ),
              GoRoute(
                path: '/editKullaniciProfile',
                name: editKullaniciProfile,
                builder: (context, state) => EditProfile(key: state.pageKey,),
              ),
              GoRoute(
                path: '/editKurumsalProfile',
                name: editKurumsalProfile,
                builder: (context, state) => EditKurumsalProfile(key: state.pageKey,),
              ),
              GoRoute(
                path: '/guest',
                name: guest,
                builder: (context, state) => Guest_Login(key: state.pageKey,),
              ),
              GoRoute(
                path: '/katildigiEtkinlikler',
                name: katildigiEtkinlikler,
                builder: (context, state) => KatildigiEtkinlikler(key: state.pageKey,),
              ),
              GoRoute(
                path: '/kullaniciProfileSettings',
                name: kullaniciProfileSettings,
                builder: (context, state) => KullaniciProfileSettings(key: state.pageKey,),
              ),
              //GoRoute(
              //  path: '/kurumsalProfileSettings',
              //  name: kurumsalProfileSettings,
              //  builder: (context, state) => KurumsalSettings(key: state.pageKey,),
              //),
              GoRoute(
                path: '/kullaniciSettings',
                name: kullaniciSettings,
                builder: (context, state) => KullaniciSettings(key: state.pageKey,),
              ),
              GoRoute(
                path: '/kurumsalSettings',
                name: kurumsalSettings,
                builder: (context, state) => KurumsalSettings(key: state.pageKey,),
              ),
              GoRoute(
                path: '/login',
                name: login,
                builder: (context, state) => Login_Page(key: state.pageKey,),
              ),
              GoRoute(
                path: '/resetPassword',
                name: resetPassword,
                builder: (context, state) => Reset_Pas(key: state.pageKey,),
              ),
              GoRoute(
                path: '/signUp',
                name: signUp,
                builder: (context, state) => SignUp(key: state.pageKey,),
              ),
              //GoRoute(
              //  path: '/yourKurumsalProfile',
              //  name: yourKurumsalProfile,
              //  builder: (context, state) => YourKurumsalProfile(key: state.pageKey,),
              //),
              GoRoute(
                path: '/etkinlikInfo',
                name: etkinlikInfo,
                builder: (context, state) => EtkinlikInfo(key: state.pageKey,),
              ),
            ],
        ),
      ],
    errorBuilder: (context, state) => RouteError(
      errorMsg: state.error.toString(),
      key: state.pageKey,
    ),
  );
});