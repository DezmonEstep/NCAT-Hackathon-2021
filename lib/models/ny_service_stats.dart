
import 'package:analytics/models/ny_inpatient.dart';

class NY_Service_Stats {

  num infection_disease = 0; // 0 - 19
  num cancer = 0; // 20 - 47
  num nutrition = 0; // 48 - 59
  num hemorrhage = 0; // 60 - 64
  num mental = 0; // 65 - 81
  num convulsions = 0; // 82 - 83
  num head_ear_nose = 0; // 84 - 95
  num chest_complications = 96; // 96 - 108 // 122 - 134
  num veins_blood_vessels = 109; // 109 - 121
  num gastro_intestinal_complications = 0; // 135 - 149
  num organ = 50; // 150 - 169
  num female_health = 0; // 170 - 196
  num skin_conditions = 0; // 197 - 200
  num bone_muscle_health = 0; // 201 - 233
  num wounds = 0; // 234 - 245
  num discomfort = 0; // 246 - 259
  num other = 260; //+ and any other

  NY_Service_Stats(List<NY_Inpatient> data) {
    int infection_disease_count = 0;
    int cancer_count = 0;
    int nutrition_count = 0;
    int hemorrhage_count = 0;
    int mental_count = 0;
    int convulsions_count = 0;
    int head_ear_nose_count = 0;
    int chest_complications_count = 0;
    int veins_blood_vessels_count = 0;
    int gastro_intestinal_count = 0;
    int organ_count = 0;
    int female_health_count = 0;
    int skin_conditions_count = 0;
    int bone_muscle_health_count = 0;
    int wounds_count = 0;
    int discomfort_count = 0;
    int other_count = 0;
    for (NY_Inpatient point in data) {
      late int value;
      if (point.ailment_code != null) {
        try {
          value = int.tryParse(point.ailment_code ?? "") ?? 0;
          if (value >= 0 && value < 19) {
            infection_disease_count += 1;
          } else if (value >= 20 && value < 47) {
            cancer_count += 1;
          } else if (value >= 48 && value < 59) {
            nutrition_count += 1;
          } else if (value >= 60 && value < 64) {
            hemorrhage_count += 1;
          } else if (value >= 65 && value < 81) {
            mental_count += 1;
          } else if (value >= 82 && value < 83) {
            convulsions_count += 1;
          } else if (value >= 84 && value < 95) {
            head_ear_nose_count += 1;
          } else if ((value >= 96 && value < 108) || (value >= 122 && value < 134)) {
            chest_complications_count += 1;
          } else if (value >= 109 && value < 121) {
            veins_blood_vessels_count += 1;
          } else if (value >= 135 && value < 149) {
            gastro_intestinal_count += 1;
          } else if (value >= 150 && value < 169) {
            organ_count += 1;
          } else if (value >= 170 && value < 196) {
            female_health_count += 1;
          } else if (value >= 197 && value < 200) {
            skin_conditions_count += 1;
          } else if (value >= 201 && value < 233) {
            bone_muscle_health_count += 1;
          } else if (value >= 234 && value < 245) {
            wounds_count += 1;
          } else if (value >= 246 && value < 259) {
            discomfort_count += 1;
          } else {
            other_count += 1;
          }
        } catch (e) {
          other_count += 1;
          continue;
        }
      }

    }
    
    int total = infection_disease_count + cancer_count + nutrition_count + hemorrhage_count + mental_count +
        convulsions_count + head_ear_nose_count + chest_complications_count + veins_blood_vessels_count + gastro_intestinal_count +
        organ_count + female_health_count + skin_conditions_count + bone_muscle_health_count + wounds_count + discomfort_count + other_count;

    infection_disease = (infection_disease_count / total) * 100;
    cancer = (cancer_count / total) * 100;
    nutrition = (nutrition_count / total) * 100;
    hemorrhage = (hemorrhage_count / total) * 100;
    mental = (mental_count / total) * 100;
    convulsions = (convulsions_count / total) * 100;
    head_ear_nose = (head_ear_nose_count / total) * 100;
    chest_complications = (chest_complications_count / total) * 100;
    veins_blood_vessels = (veins_blood_vessels_count / total) * 100;
    gastro_intestinal_complications = (gastro_intestinal_count / total) * 100;
    organ = (organ_count / total) * 100;
    female_health = (female_health_count / total) * 100;
    skin_conditions = (skin_conditions_count / total) * 100;
    bone_muscle_health = (bone_muscle_health_count / total) * 100;
    wounds = (wounds_count / total) * 100;
    discomfort = (discomfort_count / total) * 100;
    other = (other_count / total) * 100;
    
  }

}