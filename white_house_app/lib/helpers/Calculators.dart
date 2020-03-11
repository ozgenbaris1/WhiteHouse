import 'package:white_house_app/models/SensorData.dart';

class Calculators {
  static String getMaxValue(List<SensorData> data, String unitSymbol) {
    return data
            .reduce((curr, next) =>
                double.parse(curr.value) > double.parse(next.value)
                    ? curr
                    : next)
            .value +
        ' ' +
        unitSymbol;
  }

  static String getAverageValue(List<SensorData> data, String unitSymbol) {
    return (data
                    .map((item) => double.parse(item.value))
                    .reduce((a, b) => a + b) /
                data.length)
            .toStringAsFixed(1) +
        ' ' +
        unitSymbol;
  }

  static String getMinValue(List<SensorData> data, String unitSymbol) {
    return data
            .reduce((curr, next) =>
                double.parse(curr.value) < double.parse(next.value)
                    ? curr
                    : next)
            .value +
        ' ' +
        unitSymbol;
  }
}
