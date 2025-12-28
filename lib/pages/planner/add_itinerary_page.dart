import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/planner_controller.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class AddItineraryPage extends StatelessWidget {
  final controller = Get.find<PlannerController>();
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final notesController = TextEditingController();
  final selectedDateTime = Rx<DateTime?>(null);

  @override
  Widget build(BuildContext context) {
    final tripId = Get.arguments as int?;

    return Scaffold(
      appBar: AppBar(title: Text('Add Activity')),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            CustomTextField(
              controller: titleController,
              hintText: 'Activity Title',
              validator: (value) =>
                  Validators.validateRequired(value, fieldName: 'Title'),
            ),
            SizedBox(height: 16),
            Obx(() => ListTile(
                  title: Text('Activity Time'),
                  subtitle: Text(
                    selectedDateTime.value != null
                        ? selectedDateTime.value.toString()
                        : 'Select date and time',
                  ),
                  trailing: Icon(Icons.calendar_today),
                  onTap: () => _selectDateTime(context),
                )),
            SizedBox(height: 16),
            CustomTextField(
              controller: notesController,
              hintText: 'Notes (optional)',
              maxLines: 4,
            ),
            SizedBox(height: 24),
            CustomButton(
              text: 'Add Activity',
              onPressed: () {
                if (formKey.currentState!.validate() &&
                    selectedDateTime.value != null &&
                    tripId != null) {
                  controller.addItinerary(
                    tripId: tripId,
                    title: titleController.text,
                    activityTime: selectedDateTime.value!,
                    notes: notesController.text.isEmpty
                        ? null
                        : notesController.text,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null) {
        selectedDateTime.value = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
      }
    }
  }
}
