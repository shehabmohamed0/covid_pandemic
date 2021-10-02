import 'dart:convert';

Country countryFromJson(String str) => Country.fromJson(json.decode(str));

class Country {
  Country({
    required this.population,
    required this.actuals,
    required this.lastUpdatedDate,
    required this.actualsTimeseries,
    required this.riskLevelsTimeseries,
  });

  int population; //

  Actuals actuals; //

  DateTime lastUpdatedDate; //
  List<ActualsTimesery> actualsTimeseries; //
  List<RiskLevelsTimesery> riskLevelsTimeseries; //

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        population: json["population"] ?? 0,
        actuals: Actuals.fromJson(json["actuals"]),
        lastUpdatedDate: DateTime.parse(json["lastUpdatedDate"]),
        actualsTimeseries: List<ActualsTimesery>.from(
            json["actualsTimeseries"].map((x) => ActualsTimesery.fromJson(x))),
        riskLevelsTimeseries: List<RiskLevelsTimesery>.from(
            json["riskLevelsTimeseries"]
                .map((x) => RiskLevelsTimesery.fromJson(x))),
      );
}

class Actuals {
  Actuals({
    required this.cases,
    required this.deaths,
    required this.positiveTests,
    required this.negativeTests,
    required this.contactTracers,
    required this.hospitalBeds,
    required this.icuBeds,
    required this.newCases,
    required this.newDeaths,
    required this.vaccinesDistributed,
    required this.vaccinationsInitiated,
    required this.vaccinationsCompleted,
    required this.vaccinesAdministered,
  });

  int cases;
  int deaths;
  int positiveTests;
  int negativeTests;
  int contactTracers;
  Beds hospitalBeds;
  Beds icuBeds;
  int newCases;
  int newDeaths;
  int vaccinesDistributed;
  int vaccinationsInitiated;
  int vaccinationsCompleted;
  int vaccinesAdministered;

  factory Actuals.fromJson(Map<String, dynamic> json) => Actuals(
        cases: json["cases"] ?? 0,
        deaths: json["deaths"] ?? 0,
        positiveTests: json["positiveTests"] ?? 0,
        negativeTests: json["negativeTests"] ?? 0,
        contactTracers: json["contactTracers"] ?? 0,
        hospitalBeds: Beds.fromJson(json["hospitalBeds"]),
        icuBeds: Beds.fromJson(json["icuBeds"]),
        newCases: json["newCases"] ?? 0,
        newDeaths: json["newDeaths"] ?? 0,
        vaccinesDistributed: json["vaccinesDistributed"] ?? 0,
        vaccinationsInitiated: json["vaccinationsInitiated"] ?? 0,
        vaccinationsCompleted: json["vaccinationsCompleted"] ?? 0,
        vaccinesAdministered: json["vaccinesAdministered"] ?? 0,
      );
}

class Beds {
  Beds({
    required this.capacity,
    required this.currentUsageTotal,
    required this.currentUsageCovid,
  });

  int capacity;
  int currentUsageTotal;
  int currentUsageCovid;

  factory Beds.fromJson(Map<String, dynamic> json) => Beds(
        capacity: json["capacity"] ?? 0,
        currentUsageTotal: json["currentUsageTotal"] ?? 0,
        currentUsageCovid: json["currentUsageCovid"] ?? 0,
      );
}

class ActualsTimesery {
  ActualsTimesery({
    required this.cases,
    required this.deaths,
    required this.positiveTests,
    required this.negativeTests,
    required this.contactTracers,
    required this.hospitalBeds,
    required this.icuBeds,
    required this.newCases,
    required this.newDeaths,
    required this.date,
  });

  int cases;
  int deaths;
  int positiveTests;
  int negativeTests;
  int contactTracers;
  Beds hospitalBeds;
  Beds icuBeds;
  int newCases;
  int newDeaths;
  DateTime? date;

  factory ActualsTimesery.fromJson(Map<String, dynamic> json) =>
      ActualsTimesery(
        cases: json["cases"] ?? 0,
        deaths: json["deaths"] ?? 0,
        positiveTests: json["positiveTests"] ?? 0,
        negativeTests: json["negativeTests"] ?? 0,
        contactTracers: json["contactTracers"] ?? 0,
        hospitalBeds: Beds.fromJson(json["hospitalBeds"]),
        icuBeds: Beds.fromJson(json["icuBeds"]),
        newCases: json["newCases"] ?? 0,
        newDeaths: json["newDeaths"] ?? 0,
        date: DateTime.parse(json["date"]),
      );
}

class RiskLevelsTimesery {
  RiskLevelsTimesery({
    this.overall,
    this.caseDensity,
    this.date,
  });

  int? overall;
  int? caseDensity;
  DateTime? date;

  factory RiskLevelsTimesery.fromJson(Map<String, dynamic> json) =>
      RiskLevelsTimesery(
        overall: json["overall"] ?? 0,
        caseDensity: json["caseDensity"] ?? 0,
        date: DateTime.parse(json["date"]),
      );
}
