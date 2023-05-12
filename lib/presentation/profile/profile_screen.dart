import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_button_setting.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/repositories/shared_preferences_repository.dart';
import 'package:get/get.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/auth/add_info/add_info_route.dart';

class ProfileScreen extends StatelessWidget {
  final SharedPreferencesRepository prefsRepo;
  const ProfileScreen({super.key, required this.prefsRepo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("Profile"),
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
                        Text("Logout")
                      ],
                    ),
                  )
                ],
                offset: Offset(0, 50),
                onSelected: null,
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
                              image:
                                  DecorationImage(image: AssetImage(mAGoogle)),
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
                            "Andrew Ainsley",
                            style: mST20M,
                          ),
                          Text(
                            "doanxemnaobro@gmail.comkfjsdhfkjh",
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
                title: "Edit Profile",
                icon: Icon(Icons.person_outline),
                onPressed: (_) => XMDRouter.pushNamed(routerIds[AddInfoRoute]!),
              ),
              MButtonSetting(
                title: "Downloads",
                icon: Icon(Icons.download_done),
              ),
              MButtonSetting(
                title: "Language",
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
                                        MultiLanguage.of(context).language,
                                        style: mST16M)),
                              ),
                            );
                          });
                    }),
              ),
              MButtonSetting(
                title: "Dark theme",
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
                title: "Help Center",
                icon: Icon(Icons.help_center),
              ),
            ],
          ),
        ));
  }
}
