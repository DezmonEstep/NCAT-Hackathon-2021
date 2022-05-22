
import 'package:analytics/models/ny_inpatient.dart';

class NY_Race_Stats {

  num black_percentage = 0;
  num white_percentage = 0;
  num hispanic_percentage = 0;
  num other_percentage = 0;
  num unknown_percentage = 0;

  NY_Race_Stats(List<NY_Inpatient> data) {
    int black_count = 0;
    int white_count = 0;
    int hispanic_count = 0;
    int other_count = 0;
    int unknown_count = 0;
    for (NY_Inpatient point in data) {
      if (point.race == "Black/African American") {
        black_count += 1;
      } else if (point.race == "White") {
        white_count += 1;
      } else if (point.ethnicty == "Spanish/Hispanic") {
        hispanic_count += 1;
      } else if (point.race == "Other") {
        other_count += 1;
      } else {
        unknown_count += 1;
      }
    }
    int total = black_count + white_count + hispanic_count + other_count + unknown_count;
    black_percentage = (black_count / (total) * 100);
    white_percentage = (white_count / (total) * 100);
    hispanic_percentage = (hispanic_count / (total) * 100);
    other_percentage = (other_count / (total) * 100);
    unknown_percentage = (unknown_count / (total) * 100);
  }

}