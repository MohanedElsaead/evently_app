import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/model/event_model.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/utils/appassets.dart';
import 'package:evently_app/utils/appcolors.dart';
import 'package:evently_app/utils/approutes.dart';
import 'package:evently_app/utils/dialog_utils.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class EventDetails extends StatelessWidget {
  EventDetails({super.key});

  List<String> EventLightImagesList = [
    Appassets.BirthdayLight,
    Appassets.BookClubLight,
    Appassets.MeetingLight,
    Appassets.SportLight,
    Appassets.ExhibitionLight,
  ];

  List<String> EventDarkImagesList = [
    Appassets.BirthdayDark,
    Appassets.BookClubDark,
    Appassets.MeetingDark,
    Appassets.SportDark,
    Appassets.ExhibitionDark,
  ];

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    var eventsProvider = Provider.of<EventsProvider>(context, listen: false);
    final event = ModalRoute.of(context)!.settings.arguments as EventModel;

    String formattedDate = DateFormat('dd MMMM').format(event.dateTime);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.Transparent,
        centerTitle: true,
        title: Text(
          "event details".tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        leading: Container(
          margin: EdgeInsetsDirectional.only(
            start: width * 0.02,
            top: height * 0.01,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: themeProvider.isDark
                ? Appcolors.InputsD
                : Appcolors.WhiteColor,
            border: Border.all(
              width: 2,
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Theme.of(context).cardColor,
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsetsDirectional.only(
              end: width * 0.01,
              top: height * 0.01,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: themeProvider.isDark
                  ? Appcolors.InputsD
                  : Appcolors.WhiteColor,
              border: Border.all(
                width: 2,
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.EditEventScreen,
                  arguments: event,
                );
              },
              icon: Icon(
                Icons.edit_outlined,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(
              end: width * 0.02,
              top: height * 0.01,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: themeProvider.isDark
                  ? Appcolors.InputsD
                  : Appcolors.WhiteColor,
              border: Border.all(
                width: 2,
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: IconButton(
              onPressed: () {
                _showDeleteDialog(
                    context, eventsProvider, userProvider, event);
              },
              icon: Icon(
                Icons.delete_outline,
                color: Appcolors.Red,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: height * 0.02,
            children: [
              // Category Image
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    themeProvider.isDark
                        ? EventDarkImagesList[event.categoryIndex]
                        : EventLightImagesList[event.categoryIndex],
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Event Title
              Text(
                event.title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              // Date & Time
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.015,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: themeProvider.isDark
                      ? Appcolors.InputsD
                      : Appcolors.WhiteColor,
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.date_range_outlined,
                      color: Theme.of(context).cardColor,
                    ),
                    SizedBox(width: width * 0.03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedDate,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          event.time,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Description Label
              Text(
                "description".tr(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              // Description Content
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(width * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: themeProvider.isDark
                      ? Appcolors.InputsD
                      : Appcolors.WhiteColor,
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                child: Text(
                  event.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, EventsProvider eventsProvider,
      UserProvider userProvider, EventModel event) {
    DialogUtils.showMessage(
      context: context,
      Content: "delete event confirm".tr(),
      Title: "delete event".tr(),
      posActionName: "delete".tr(),
      posAction: () async {
        try {
          DialogUtils.showLoading(
              context: context, LoadingText: "Loading....");
          await eventsProvider.deleteEvent(
              userProvider.currentUser!.uId, event.id);
          DialogUtils.hideLoading(context: context);
          Navigator.pop(context);
        } catch (e) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
              context: context,
              Content: e.toString(),
              Title: "Error",
              posActionName: "Ok");
        }
      },
      negActionName: "cancel".tr(),
    );
  }
}
