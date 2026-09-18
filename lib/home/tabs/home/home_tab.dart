import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:evently_app/providers/language_provider.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/utils/appcolors.dart';
import 'package:evently_app/utils/appstyles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/widgets/event_item_widget.dart';
import 'package:evently_app/widgets/tab_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var userProvider = Provider.of<UserProvider>(context);
    var themeprovider = Provider.of<AppThemeProvider>(context);
    var languageprovider = Provider.of<AppLanguageProvider>(context);
    var eventsProvider = Provider.of<EventsProvider>(context);

    List<String> eventsNameList = [
      "all".tr(),
      "sport".tr(),
      "birthday".tr(),
      "meeting".tr(),
      "book club".tr(),
      "exhibition".tr(),
    ];

    // Category keys for filtering (English names used in Firestore)
    List<String> categoryKeys = [
      "All",
      "Sport",
      "Birthday",
      "Meeting",
      "Book Club",
      "Exhibition",
    ];

    var filteredEvents =
        eventsProvider.getFilteredEvents(categoryKeys[selectedIndex]);

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      child: SafeArea(
        child: DefaultTabController(
          length: eventsNameList.length,
          child: Column(
            spacing: height * 0.02,
            children: [
              Row(
                spacing: width * 0.04,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "welcome back".tr(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        userProvider.currentUser?.name ?? "",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    themeprovider.isDark
                        ? Icons.brightness_2_outlined
                        : Icons.light_mode_outlined,
                    color: Theme.of(context).cardColor,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Text(
                        languageprovider.isEnglish ? "EN" : "AR",
                        style: AppStyles.Semi14White,
                      ),
                    ),
                  ),
                ],
              ),
              TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                dividerColor: Appcolors.Transparent,
                indicatorColor: Appcolors.Transparent,
                labelPadding: EdgeInsets.symmetric(horizontal: width * 0.01),
                tabAlignment: TabAlignment.start,
                tabs: eventsNameList.map((eventName) {
                  return TabItemWidget(
                    isSelected:
                        selectedIndex == eventsNameList.indexOf(eventName),
                    UnSelectedColor: themeprovider.isDark
                        ? Appcolors.InputsD
                        : Appcolors.WhiteColor,
                    eventName: eventName,
                  );
                }).toList(),
              ),
              Expanded(
                child: filteredEvents.isEmpty
                    ? Center(
                        child: Text(
                          "no events".tr(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return EventItemWidget(
                              event: filteredEvents[index]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: height * 0.02);
                        },
                        itemCount: filteredEvents.length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
