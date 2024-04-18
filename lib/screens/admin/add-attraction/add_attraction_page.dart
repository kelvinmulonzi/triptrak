import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../models/attractions.dart';
import '../../../repo/firestore_repo.dart';
import '../../../theme/text_scheme.dart';
import '../../widgets/custom_widgets.dart';

class NewAttractionPage extends StatelessWidget {
  NewAttractionPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController openHoursController = TextEditingController();
  final TextEditingController contactsController = TextEditingController();
  final TextEditingController urlImageController = TextEditingController();
  final TextEditingController feeController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('New Attraction'),
            centerTitle: true,
            floating: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    NormalTextFormField(
                      controller: nameController,
                      isNumber: false,
                      labelText: 'Site Name',
                      hintText: 'Enter Site Name',
                      errorText: 'Please enter site name',
                      prefixIcon: const Icon(Icons.location_city_rounded),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: descriptionController,
                      maxLines: 4,
                      textCapitalization: TextCapitalization.sentences,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelStyle: bodyDefault(textTheme).copyWith(
                          color: color.onSurface.withOpacity(0.5),
                        ),
                        labelText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      /*  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      }, */
                    ),
                    const SizedBox(height: 20),
                    NormalTextFormField(
                      controller: locationController,
                      isNumber: false,
                      labelText: 'Location',
                      hintText: 'Enter Location',
                      errorText: 'Please enter location',
                      prefixIcon: const Icon(Icons.location_on_outlined),
                    ),
                    const SizedBox(height: 20),
                    NormalTextFormField(
                      controller: openHoursController,
                      isNumber: false,
                      labelText: 'Open Hours',
                      hintText: 'Enter Open Hours',
                      errorText: 'Please enter open hours',
                      prefixIcon: const Icon(Icons.access_time_rounded),
                    ),
                    const SizedBox(height: 20),
                    NormalTextFormField(
                      controller: contactsController,
                      isNumber: false,
                      labelText: 'Contact',
                      hintText: 'Enter Contact',
                      errorText: 'Please enter contact',
                      prefixIcon: const Icon(Icons.contact_emergency),
                    ),
                    const SizedBox(height: 20),
                    NormalTextFormField(
                      controller: urlImageController,
                      isNumber: false,
                      labelText: 'Image Url',
                      hintText: 'Enter Image Url',
                      errorText: 'Please enter image url',
                      prefixIcon: const Icon(Icons.image),
                    ),
                    const SizedBox(height: 20),
                    NormalTextFormField(
                      controller: feeController,
                      isNumber: true,
                      labelText: 'Entery Fee',
                      hintText: 'Enter Entery Fee',
                      errorText: 'Please enter entry fee',
                      prefixIcon: const Icon(Icons.money),
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: () => _onPressed(context),
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size.fromHeight(60),
                      ),
                      child: const Text(
                        'Add Attraction',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*  required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.openingHours,
    required this.contacts,
    required this.urlImage,
    required this.fee, */

  void _onPressed(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final form = formKey.currentState!;
    if (form.validate()) {
      final String name = nameController.text;
      final String description = descriptionController.text;
      final String location = locationController.text;
      final String openHours = openHoursController.text;
      final String contacts = contactsController.text;
      final String urlImage = urlImageController.text;
      final int fee = int.parse(feeController.text);

      final Destination site = Destination(
        id: const Uuid().v4(),
        name: name,
        description: description,
        location: location,
        openingHours: openHours,
        contacts: contacts,
        urlImage: urlImage,
        fee: fee,
      );

      await DesFirestoreRepo()
          .addAttraction(site)
          .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Attraction added successfully'),
                ),
              ));
    }
    _clearControllers();
  }

  void _clearControllers() {
    nameController.clear();
    descriptionController.clear();
    locationController.clear();
    openHoursController.clear();
    contactsController.clear();
    urlImageController.clear();
    feeController.clear();
  }
}
