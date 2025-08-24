import 'package:flutter/material.dart';
import 'package:helper_module/constants/app_colors.dart';
import 'package:helper_module/widgets/ServiceItem.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ServiceTypes extends StatefulWidget {
  const ServiceTypes({super.key});

  @override
  State<ServiceTypes> createState() => _ServiceTypesState();
}

class _ServiceTypesState extends State<ServiceTypes> {
  final List<Map<String, dynamic>> services = [
    {"icon": PhosphorIcons.broom(PhosphorIconsStyle.regular), "label": "Maid"},
    {
      "icon": PhosphorIcons.cookingPot(PhosphorIconsStyle.regular),
      "label": "Cook",
    },
    {
      "icon": PhosphorIcons.firstAidKit(PhosphorIconsStyle.regular),
      "label": "Nurse",
    },
    {
      "icon": PhosphorIcons.steeringWheel(PhosphorIconsStyle.regular),
      "label": "Driver",
    },
    {
      "icon": PhosphorIcons.pipeWrench(PhosphorIconsStyle.regular),
      "label": "Plumber",
    },
    {
      "icon": PhosphorIcons.lightbulbFilament(PhosphorIconsStyle.regular),
      "label": "Electrician",
    },
    {
      "icon": PhosphorIcons.wrench(PhosphorIconsStyle.regular),
      "label": "Mechanic",
    },
    {
      "icon": PhosphorIcons.tShirt(PhosphorIconsStyle.regular),
      "label": "Laundry",
    },
    {
      "icon": PhosphorIcons.tree(PhosphorIconsStyle.regular),
      "label": "Gardener",
    },
    {
      "icon": PhosphorIcons.student(PhosphorIconsStyle.regular),
      "label": "Tutor",
    },
    {
      "icon": PhosphorIcons.tag(PhosphorIconsStyle.regular),
      "label": "Rent/Sell",
    },
    {
      "icon": PhosphorIcons.wifiHigh(PhosphorIconsStyle.regular),
      "label": "wifi",
    },
    {
      "icon": PhosphorIcons.snowflake(PhosphorIconsStyle.regular),
      "label": "AC",
    },
    {
      "icon": PhosphorIcons.sprayBottle(PhosphorIconsStyle.regular),
      "label": "Cleaning",
    },
    {"icon": PhosphorIcons.drop(PhosphorIconsStyle.regular), "label": "Water"},
    {
      "icon": PhosphorIcons.barbell(PhosphorIconsStyle.regular),
      "label": "Gym Trainer",
    },
    {
      "icon": PhosphorIcons.swimmingPool(PhosphorIconsStyle.regular),
      "label": "Swimming",
    },
    {
      "icon": PhosphorIcons.musicNote(PhosphorIconsStyle.regular),
      "label": "Music",
    },
    {
      "icon": PhosphorIcons.tennisBall(PhosphorIconsStyle.regular),
      "label": "Sports club",
    },
    {"icon": PhosphorIcons.cow(PhosphorIconsStyle.regular), "label": "Milk"},
    {
      "icon": PhosphorIcons.newspaper(PhosphorIconsStyle.regular),
      "label": "NewsPaper",
    },
    {
      "icon": PhosphorIcons.flowerTulip(PhosphorIconsStyle.regular),
      "label": "Flowers",
    },
    {
      "icon": PhosphorIcons.couch(PhosphorIconsStyle.regular),
      "label": "Packers",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
        title: const Text("Select Type of Service"),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: services.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                final service = services[index];
                return ServiceItem(
                  icon: service["icon"],
                  label: service["label"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
