import 'package:evently_app/model/event_model.dart';
import 'package:evently_app/utils/appassets.dart';
import 'package:evently_app/utils/appcolors.dart';
import 'package:evently_app/utils/approutes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../providers/events_provider.dart';
import '../providers/theme_provider.dart';
import '../providers/user_provider.dart';
import '../utils/size_utils.dart';

class EventItemWidget extends StatelessWidget {
  final EventModel event;

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

  EventItemWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeprovider = Provider.of<AppThemeProvider>(context);

    String imageAsset = themeprovider.isDark
        ? EventDarkImagesList[event.categoryIndex]
        : EventLightImagesList[event.categoryIndex];

    String formattedDate = DateFormat('dd MMM').format(event.dateTime);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.EventDetailsScreen,
          arguments: event,
        );
      },
      child: Container(
        height: height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: 2,
          ),
          image: DecorationImage(
            image: AssetImage(imageAsset),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.01,
              ),
              margin: EdgeInsetsGeometry.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                  width: 2,
                ),
              ),
              child: Text(
                formattedDate,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
              ),
              margin: EdgeInsetsGeometry.all(8),
              decoration: BoxDecoration(
                color: themeprovider.isDark
                    ? Appcolors.InputsD
                    : Appcolors.WhiteColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      event.title,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
