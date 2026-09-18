import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/model/event_model.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/utils/appassets.dart';
import 'package:evently_app/utils/appcolors.dart';
import 'package:evently_app/utils/appstyles.dart';
import 'package:evently_app/utils/dialog_utils.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/widgets/custom_elevated_button.dart';
import 'package:evently_app/widgets/custom_text_field.dart';
import 'package:evently_app/widgets/date_or_time_widget.dart';
import 'package:evently_app/widgets/tab_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class EditEvent extends StatefulWidget {
  EditEvent({super.key});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
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

  List<String> eventsNameList = [];
  var formkey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  DateTime? SelectedDate;
  String formatDate = "";
  TimeOfDay? SelectedTime;
  String formatTime = "";
  int selectedIndex = 0;
  late EventModel event;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      event = ModalRoute.of(context)!.settings.arguments as EventModel;
      titleController = TextEditingController(text: event.title);
      descriptionController = TextEditingController(text: event.description);
      selectedIndex = event.categoryIndex;
      SelectedDate = event.dateTime;
      formatDate = DateFormat('MMM dd, yyyy').format(event.dateTime);
      // Parse time string back to TimeOfDay
      formatTime = event.time;
      _initialized = true;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    eventsNameList = [
      "birthday".tr(),
      "book club".tr(),
      "meeting".tr(),
      "sport".tr(),
      "exhibition".tr(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.Transparent,
        centerTitle: true,
        title: Text(
          "edit event".tr(),
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          ? EventDarkImagesList[selectedIndex]
                          : EventLightImagesList[selectedIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Category Tabs
                SizedBox(
                  height: height * 0.05,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        child: TabItemWidget(
                          isSelected: selectedIndex == index,
                          UnSelectedColor: themeProvider.isDark
                              ? Appcolors.InputsD
                              : Appcolors.WhiteColor,
                          eventName: eventsNameList[index],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: width * 0.02);
                    },
                    itemCount: eventsNameList.length,
                  ),
                ),

                // Title
                Text(
                  "title".tr(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                CustomTextField(
                  hintText: "event title".tr(),
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  bordercolor: Theme.of(context).dividerColor,
                  fill: true,
                  fillcolor: themeProvider.isDark
                      ? Appcolors.InputsD
                      : Appcolors.WhiteColor,
                  TextController: titleController,
                  Validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please Enter Event Title";
                    }
                    return null;
                  },
                ),

                // Description
                Text(
                  "description".tr(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                CustomTextField(
                  hintText: "event description".tr(),
                  bordercolor: Theme.of(context).dividerColor,
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  fill: true,
                  fillcolor: themeProvider.isDark
                      ? Appcolors.InputsD
                      : Appcolors.WhiteColor,
                  Lines: 4,
                  TextController: descriptionController,
                  Validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please Enter Event Description";
                    }
                    return null;
                  },
                ),

                // Date
                DateOrTimeWidget(
                  Icon: Icon(
                    Icons.date_range_outlined,
                    color: Theme.of(context).cardColor,
                  ),
                  eventDateorTime: "event date".tr(),
                  onChooseClick: onChooseDate,
                  chooseDateorTime: formatDate,
                ),

                // Time
                DateOrTimeWidget(
                  Icon: Icon(
                    Icons.timer,
                    color: Theme.of(context).cardColor,
                  ),
                  eventDateorTime: "event time".tr(),
                  onChooseClick: onChooseTime,
                  chooseDateorTime: formatTime,
                ),

                // Update Button
                CustomElevatedButton(
                  onPressed: updateEvent,
                  child: Text(
                    "update event".tr(),
                    style: AppStyles.Medium20WhiteColor,
                  ),
                  backgroundColor: Theme.of(context).cardColor,
                  verticalPadding: height * 0.01,
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onChooseDate() async {
    var date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      initialDate: SelectedDate ?? DateTime.now(),
    );
    if (date != null) {
      SelectedDate = date;
      formatDate = DateFormat('MMM dd, yyyy').format(SelectedDate!);
      setState(() {});
    }
  }

  void onChooseTime() async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      SelectedTime = time;
      formatTime = time.format(context);
      setState(() {});
    }
  }

  void updateEvent() async {
    if (formkey.currentState?.validate() != true) return;

    var userProvider = Provider.of<UserProvider>(context, listen: false);
    var eventsProvider = Provider.of<EventsProvider>(context, listen: false);

    List<String> categoryKeys = [
      "Birthday",
      "Book Club",
      "Meeting",
      "Sport",
      "Exhibition",
    ];

    EventModel updatedEvent = EventModel(
      id: event.id,
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      categoryName: categoryKeys[selectedIndex],
      categoryIndex: selectedIndex,
      dateTime: SelectedDate ?? event.dateTime,
      time: formatTime,
      userId: userProvider.currentUser!.uId,
    );

    try {
      DialogUtils.showLoading(context: context, LoadingText: "Loading....");
      await eventsProvider.updateEvent(
          userProvider.currentUser!.uId, updatedEvent);
      DialogUtils.hideLoading(context: context);
      // Pop back to details, then to home, so user sees updated list
      Navigator.pop(context);
      Navigator.pop(context);
    } catch (e) {
      DialogUtils.hideLoading(context: context);
      DialogUtils.showMessage(
        context: context,
        Content: e.toString(),
        Title: "Error",
        posActionName: "Ok",
      );
    }
  }
}
