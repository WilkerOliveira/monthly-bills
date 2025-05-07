import 'package:flutter/material.dart';

enum BillTypesEnum {
  electricity('Electricity', Icons.bolt),
  water('Water', Icons.water_drop),
  rent('Rent', Icons.home),
  mortgage('Mortgage', Icons.credit_score),
  groceries('Groceries', Icons.shopping_cart),
  diningOut('Dining Out', Icons.restaurant),
  transportation('Transportation', Icons.directions_car),
  fuel('Fuel', Icons.local_gas_station),
  phoneBill('Phone Bill', Icons.phone_android),
  internet('Internet', Icons.wifi),
  streaming('Streaming', Icons.live_tv),
  gym('Gym', Icons.fitness_center),
  healthInsurance('Health Insurance', Icons.medical_services),
  medications('Medications', Icons.medication),
  education('Education', Icons.school),
  clothing('Clothing', Icons.checkroom),
  entertainment('Entertainment', Icons.movie),
  gifts('Gifts', Icons.card_giftcard),
  donations('Donations', Icons.volunteer_activism),
  travel('Travel', Icons.flight),
  subscriptions('Subscriptions', Icons.subscriptions),
  petCare('Pet Care', Icons.pets),
  childcare('Childcare', Icons.child_care),
  carMaintenance('Car Maintenance', Icons.directions_car_filled),
  homeMaintenance('Home Maintenance', Icons.handyman),
  taxes('Taxes', Icons.receipt_long),
  insurance('Insurance', Icons.security),
  savings('Savings', Icons.savings),
  investments('Investments', Icons.trending_up),
  miscellaneous('Miscellaneous', Icons.more_horiz),
  other('Other', Icons.receipt);

  const BillTypesEnum(this.label, this.icon);

  final String label;
  final IconData icon;
}
