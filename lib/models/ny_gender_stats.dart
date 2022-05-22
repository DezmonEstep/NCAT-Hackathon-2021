
import 'package:analytics/models/ny_inpatient.dart';

class NY_Gender_Stats {

  num male_percentage = 0;
  num female_percentage = 0;
  num other_percentage = 0;

  NY_Gender_Stats(List<NY_Inpatient> data) {
    int male_count = 0;
    int female_count = 0;
    int other_count = 0;
    for (NY_Inpatient point in data) {
      if (point.gender == "M") {
        male_count += 1;
      } else if (point.gender == "F") {
        female_count += 1;
      } else {
        other_count += 1;
      }
    }
    male_percentage = (male_count / (male_count + female_count + other_count) * 100);
    female_percentage = (female_count / (male_count + female_count + other_count) * 100);
    other_percentage = (other_count / (male_count + female_count + other_count) * 100);
  }

}