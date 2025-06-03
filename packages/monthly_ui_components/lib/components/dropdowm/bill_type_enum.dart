import 'package:flutter/material.dart';
import 'package:monthly_ui_components/core/translation/ui_strings.dart';

enum BillTypesEnum {
  carMaintenance('carMaintenance', Icons.directions_car_filled),
  childcare('childcare', Icons.child_care),
  clothing('clothing', Icons.checkroom),
  creditCard('creditCard', Icons.credit_card),
  diningOut('diningOut', Icons.restaurant),
  donations('donations', Icons.volunteer_activism),
  education('education', Icons.school),
  electricity('electricity', Icons.bolt),
  entertainment('entertainment', Icons.movie),
  fuel('fuel', Icons.local_gas_station),
  gifts('gifts', Icons.card_giftcard),
  groceries('groceries', Icons.shopping_cart),
  gym('gym', Icons.fitness_center),
  healthInsurance('healthInsurance', Icons.medical_services),
  homeMaintenance('homeMaintenance', Icons.handyman),
  insurance('insurance', Icons.security),
  internet('internet', Icons.wifi),
  investments('investments', Icons.trending_up),
  medications('medications', Icons.medication),
  miscellaneous('miscellaneous', Icons.more_horiz),
  mortgage('mortgage', Icons.credit_score),
  other('other', Icons.receipt),
  petCare('petCare', Icons.pets),
  phoneBill('phoneBill', Icons.phone_android),
  rent('rent', Icons.home),
  savings('savings', Icons.savings),
  streaming('streaming', Icons.live_tv),
  subscriptions('subscriptions', Icons.subscriptions),
  taxes('taxes', Icons.receipt_long),
  transportation('transportation', Icons.directions_car),
  travel('travel', Icons.flight),
  water('water', Icons.water_drop);

  const BillTypesEnum(this.key, this.icon);

  final String key;
  final IconData icon;

  static BillTypesEnum toBillType(String type) {
    try {
      return BillTypesEnum.values.firstWhere(
        (e) => e.name.toLowerCase() == type.toLowerCase(),
      );
    } on Exception {
      return BillTypesEnum.other;
    }
  }

  String get description {
    switch (this) {
      case BillTypesEnum.electricity:
        return UIStrings.I.electricity;
      case BillTypesEnum.water:
        return UIStrings.I.water;
      case BillTypesEnum.rent:
        return UIStrings.I.rent;
      case BillTypesEnum.mortgage:
        return UIStrings.I.mortgage;
      case BillTypesEnum.groceries:
        return UIStrings.I.groceries;
      case BillTypesEnum.diningOut:
        return UIStrings.I.diningOut;
      case BillTypesEnum.transportation:
        return UIStrings.I.transportation;
      case BillTypesEnum.fuel:
        return UIStrings.I.fuel;
      case BillTypesEnum.phoneBill:
        return UIStrings.I.phoneBill;
      case BillTypesEnum.internet:
        return UIStrings.I.internet;
      case BillTypesEnum.streaming:
        return UIStrings.I.streaming;
      case BillTypesEnum.gym:
        return UIStrings.I.gym;
      case BillTypesEnum.healthInsurance:
        return UIStrings.I.healthInsurance;
      case BillTypesEnum.medications:
        return UIStrings.I.medications;
      case BillTypesEnum.education:
        return UIStrings.I.education;
      case BillTypesEnum.clothing:
        return UIStrings.I.clothing;
      case BillTypesEnum.entertainment:
        return UIStrings.I.entertainment;
      case BillTypesEnum.gifts:
        return UIStrings.I.gifts;
      case BillTypesEnum.donations:
        return UIStrings.I.donations;
      case BillTypesEnum.travel:
        return UIStrings.I.travel;
      case BillTypesEnum.subscriptions:
        return UIStrings.I.subscriptions;
      case BillTypesEnum.petCare:
        return UIStrings.I.petCare;
      case BillTypesEnum.childcare:
        return UIStrings.I.childcare;
      case BillTypesEnum.carMaintenance:
        return UIStrings.I.carMaintenance;
      case BillTypesEnum.homeMaintenance:
        return UIStrings.I.homeMaintenance;
      case BillTypesEnum.taxes:
        return UIStrings.I.taxes;
      case BillTypesEnum.insurance:
        return UIStrings.I.insurance;
      case BillTypesEnum.savings:
        return UIStrings.I.savings;
      case BillTypesEnum.investments:
        return UIStrings.I.investments;
      case BillTypesEnum.miscellaneous:
        return UIStrings.I.miscellaneous;
      case BillTypesEnum.creditCard:
        return UIStrings.I.creditCard;
      case BillTypesEnum.other:
        return UIStrings.I.other;
    }
  }
}
