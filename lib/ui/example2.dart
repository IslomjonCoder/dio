import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/country_model.dart';
import 'package:untitled/network/api_service.dart';
import 'package:untitled/provider/provider_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:untitled/ui/company_detail.dart';

class Example2 extends StatelessWidget {
  Example2({Key? key}) : super(key: key);
  ApiService service = ApiService();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderService>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Example 2'),
        ),
        body: FutureBuilder(
          future: service.getCompanies(),
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
                        final car = res.data[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => CompanyDetail(companyID: index)));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                imageUrl: car.logo,
                                width: 100,
                                height: 100,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Car Model: ${car.carModel}',
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Average Price: \$${car.averagePrice}',
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                'Established Year: ${car.establishedYear}',
                                style: const TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Container(),
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
