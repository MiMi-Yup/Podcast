import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_button_setting.dart';
import 'package:join_podcast/common/widgets/m_confirm_bottom_modal.dart';
import 'package:join_podcast/data/session_info.dart';
import 'package:join_podcast/domain/repositories/shared_preferences_repository.dart';
import 'package:get/get.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/auth/login/login_route.dart';
import 'package:join_podcast/presentation/download/download_route.dart';
import 'package:join_podcast/presentation/new_user/add_info/add_info_route.dart';

class ProfileScreen extends StatelessWidget {
  final SharedPreferencesRepository prefsRepo;
  final SessionInfo session;
  const ProfileScreen(
      {super.key, required this.prefsRepo, required this.session});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(MultiLanguage.of(context).profile),
            elevation: 0.0,
            actions: [
              PopupMenuButton<int>(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(Icons.logout),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(MultiLanguage.of(context).logout)
                      ],
                    ),
                  )
                ],
                offset: Offset(0, 50),
                onSelected: (index) async {
                  switch (index) {
                    case 0:
                      final result = await showConfirmBottomModal(
                          context, MultiLanguage.of(context).askLogout);
                      if (result == true) {
                        session.logout();
                        XMDRouter.pushNamedAndRemoveUntil(
                            routerIds[LoginRoute]!);
                      }
                      break;
                    default:
                      break;
                  }
                },
                icon: Icon(Icons.more_horiz),
              )
            ]),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 75,
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(session.user!.avatar!)),
                              color: Colors.grey),
                        ),
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 165, 51, 255),
                              borderRadius: BorderRadius.circular(4)),
                          child: Icon(
                            Icons.edit,
                            size: 16,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            session.user?.name ??
                                MultiLanguage.of(context).username,
                            style: mST20M,
                          ),
                          Text(
                            session.user?.email ??
                                MultiLanguage.of(context).email,
                            style: mST16M,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              MButtonSetting(
                title: MultiLanguage.of(context).editProfile,
                icon: Icon(Icons.person_outline),
                onPressed: (_) => XMDRouter.pushNamed(routerIds[AddInfoRoute]!),
              ),
              MButtonSetting(
                title: MultiLanguage.of(context).downloads,
                icon: Icon(Icons.download_done),
                onPressed: (_) =>
                    XMDRouter.pushNamed(routerIds[DownloadRoute]!),
              ),
              MButtonSetting(
                title: MultiLanguage.of(context).language,
                icon: const Icon(Icons.language),
                onPressed: (_) => showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10.0))),
                    builder: (_) {
                      final locales = MultiLanguage.delegate.supportedLocales;
                      final currentLocale = Localizations.localeOf(context);
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: locales.length,
                          itemBuilder: (context, index) {
                            final itemLocale = locales[index];
                            return ListTile(
                              onTap: () {
                                XMDRouter.pop();
                                prefsRepo.setLanguage(itemLocale);
                                Get.updateLocale(itemLocale);
                              },
                              trailing: locales[index].languageCode ==
                                      currentLocale.languageCode
                                  ? const Icon(Icons.check)
                                  : null,
                              title: Localizations.override(
                                context: context,
                                locale: itemLocale,
                                child: Builder(
                                    builder: (context) => Text(
                                        MultiLanguage.of(context).languageName,
                                        style: mST16M)),
                              ),
                            );
                          });
                    }),
              ),
              MButtonSetting(
                title: MultiLanguage.of(context).darkTheme,
                icon: Icon(Icons.brightness_2),
                isSwitch: true,
                initState: Theme.of(context).brightness == Brightness.dark,
                onPressed: (p0) {
                  final mode = p0 == true ? ThemeMode.dark : ThemeMode.light;
                  prefsRepo.setTheme(mode);
                  Get.changeThemeMode(mode);
                },
              ),
              MButtonSetting(
                title: MultiLanguage.of(context).helpCenter,
                icon: Icon(Icons.help_center),
              ),
            ],
          ),
        ));
  }
}
