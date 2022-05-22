// "Hospital Service Area","Hospital County","Operating Certificate Number","Permanent Facility Id","Facility Name","Age Group",
// "Zip Code - 3 digits","Gender","Race","Ethnicity","Length of Stay","Type of Admission","Patient Disposition","Discharge Year",
// "CCS Diagnosis Code","CCS Diagnosis Description","CCS Procedure Code","CCS Procedure Description","APR DRG Code",
// "APR DRG Description","APR MDC Code","APR MDC Description","APR Severity of Illness Code","APR Severity of Illness Description",
// "APR Risk of Mortality","APR Medical Surgical Description","Payment Typology 1","Payment Typology 2","Payment Typology 3",
// "Birth Weight","Abortion Edit Indicator","Emergency Department Indicator","Total Charges","Total Costs"

import 'data_point.dart';

class NY_Inpatient {

  String? service_area;
  String? age_group;
  String? gender;
  String? race;
  String? ethnicty;
  String? ailment_code;
  String? type_of_admission;
  String? treatment_description;
  String? treatment_category;
  String? payment_type;
  String? payment_description;
  String? total_charges;
  String? total_cost;

  NY_Inpatient({
    this.service_area,
    this.age_group,
    this.gender,
    this.race,
    this.ethnicty,
    this.ailment_code,
    this.type_of_admission,
    this.treatment_description,
    this.treatment_category,
    this.payment_type,
    this.payment_description,
    this.total_charges,
    this.total_cost,
  });

}