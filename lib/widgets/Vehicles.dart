// ignore: file_names
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Vehicle {
  final String name;
  final Icon icon;

  Vehicle({required this.name, required this.icon});
}

List<Vehicle> vehicles = [
  Vehicle(
    name: "Bike",
    icon: Icon(PhosphorIconsRegular.moped, color: Colors.white),
  ),
  Vehicle(
    name: "Van",
    icon: Icon(PhosphorIconsRegular.van, color: Colors.white),
  ),
  Vehicle(
    name: "Car",
    icon: Icon(PhosphorIconsRegular.car, color: Colors.white),
  ),
  Vehicle(
    name: "Heavy",
    icon: Icon(PhosphorIconsRegular.truck, color: Colors.white),
  ),
];
