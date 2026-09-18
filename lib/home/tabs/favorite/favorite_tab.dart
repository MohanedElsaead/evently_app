import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:evently_app/utils/appcolors.dart';
import 'package:evently_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';
import '../../../utils/size_utils.dart';
import '../../../widgets/event_item_widget.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeprovider = Provider.of<AppThemeProvider>(context);
    var eventsProvider = Provider.of<EventsProvider>(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: Column(
          spacing: height * 0.02,
          children: [
            CustomTextField(
              hintStyle: Theme.of(context).textTheme.bodyLarge,
              hintText: "search for event".tr(),
              suffixIcon: Icon(
                Icons.search,
                color: Theme.of(context).cardColor,
              ),
              fill: true,
              bordercolor: Theme.of(context).dividerColor,
              fillcolor: themeprovider.isDark
                  ? Appcolors.InputsD
                  : Appcolors.WhiteColor,
            ),
            Expanded(
              child: eventsProvider.events.isEmpty
                  ? Center(
                      child: Text(
                        "no events".tr(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return EventItemWidget(
                            event: eventsProvider.events[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: height * 0.02);
                      },
                      itemCount: eventsProvider.events.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
