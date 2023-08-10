import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/country_model.dart';
import 'package:untitled/network/api_service.dart';
import 'package:untitled/provider/provider_service.dart';

class Example1 extends StatelessWidget {
  Example1({Key? key}) : super(key: key);
  ApiService service = ApiService();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderService>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Example 1'),
        ),
        body: FutureBuilder(
          future: service.getCountries(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              final res = snapshot.data!;
              return (res.isSuccess)
                  ? ListView.separated(
                      padding: const EdgeInsets.all(20),
                      itemBuilder: (context, index) {
                        CountryModel country = res.data[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              country.emoji,
                              style: const TextStyle(fontSize: 48),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Country Name: ${country.name}',
                              style: const TextStyle(fontSize: 24),
                            ),
                            Text(
                              'Capital: ${country.capital}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Continent: ${country.continent.name}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Currency: ${country.currency}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Phone Code: +${country.phone}',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: res.data.length)
                  : Center(
                      child: Text(res.errorMessage!),
                    );
            }
            return Text('Snapshot state ${snapshot.connectionState}');
          },
        ));
  }
}
