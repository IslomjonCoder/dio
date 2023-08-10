import 'package:untitled/models/country_model.dart';
import 'package:untitled/network/api_service.dart';

class ApiRepository {
  ApiService service = ApiService();

  Future<List<CountryModel>> getCountries() async {
    final countries = await service.getCountries();

    return (countries.isSuccess) ? countries.data : [];
  }
}
