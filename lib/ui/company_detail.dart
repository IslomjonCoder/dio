import 'package:flutter/material.dart';
import 'package:untitled/models/company_detail.dart';
import 'package:untitled/network/api_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CompanyDetail extends StatelessWidget {
  CompanyDetail({Key? key, required this.companyID}) : super(key: key);
  int companyID;
  ApiService service = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: service.getCompanyDetail(companyID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            final res = snapshot.data!;
            return res.isSuccess
                ? Scaffold(
                    appBar: AppBar(
                      title: const Text('Toyota Car Details'),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(res.data.logo),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Car Model: ${res.data.carModel}',
                                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Established Year: ${res.data.establishedYear}',
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'Average Price: \$${res.data.averagePrice}',
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Description:',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  res.data.description,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Car Pictures:',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: res.data.carPics.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CachedNetworkImage(
                                          imageUrl: res.data.carPics[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: Text(''),
                  );
          }
          return Text('Snapshot state ${snapshot.connectionState}');
        },
      ),
    );
  }
}
