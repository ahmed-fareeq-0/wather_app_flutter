import 'package:get/get_state_manager/get_state_manager.dart';
import '/model/currentWeatherData.dart';
import '/model/fiveDaysData.dart';
import '/service/weatherService.dart';

class HomeController extends GetxController {
  String? city;
  String? searchText;
  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];
  var isLoading = true;

  HomeController({required this.city});

  @override
  void onInit() {
    initState();
    getTopFiveCities();
    super.onInit();
  }

  void updateWeather() {
    initState();
  }

  void initState() {
    getCurrentWeatherData();
    getFiveDaysData();
  }

  void getCurrentWeatherData() {
    isLoading = false;
    update();
    WeatherService(city: '$city').getCurrentWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
          isLoading = true;
          update();
        },
        onError: (error) => {print(error), update(), isLoading = true});
  }

  void getTopFiveCities() {
    List<String> cities = [
      // 'karbala',
      'بغداد',
      'البصرة',
      'الحلة',
      'النجف',
      'أربيل',
      'السليمانية',
      'كركوك',
      'حلبجة',
      'الموصل',
      'السماوه'
    ];
    cities.forEach((c) {
      // isLoading = false;
      WeatherService(city: '$c').getCurrentWeatherData(onSuccess: (data) {
        dataList.add(data);
        update();
        // isLoading = true;
      }, onError: (error) {
        print(error);
        update();
        // isLoading = true;
      });
    });
  }

  void getFiveDaysData() {
    WeatherService(city: '$city').getFiveDaysThreeHoursForcastData(
        onSuccess: (data) {
      fiveDaysData = data;
      update();
    }, onError: (error) {
      print(error);
      update();
    });
  }
}
