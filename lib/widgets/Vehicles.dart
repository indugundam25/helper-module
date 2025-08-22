// ignore: file_names
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

final Color iconColor = Colors.black;

class Vehicle {
  final String name;
  Icon icon;

  Vehicle({required this.name, required this.icon});
}

List<Vehicle> vehicles = [
  Vehicle(
    name: "Bike",
    icon: Icon(PhosphorIconsRegular.moped, color: iconColor),
  ),
  Vehicle(
    name: "Van",
    icon: Icon(PhosphorIconsRegular.van, color: iconColor),
  ),
  Vehicle(
    name: "Car",
    icon: Icon(PhosphorIconsRegular.car, color: iconColor),
  ),
  Vehicle(
    name: "Heavy",
    icon: Icon(PhosphorIconsRegular.truck, color: iconColor),
  ),
];
