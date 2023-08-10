class CompanyModel {
  int id;
  String carModel;
  int averagePrice;
  String logo;
  int establishedYear;

  CompanyModel({
    required this.id,
    required this.carModel,
    required this.averagePrice,
    required this.logo,
    required this.establishedYear,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        id: json["id"],
        carModel: json["car_model"],
        averagePrice: json["average_price"],
        logo: json["logo"],
        establishedYear: json["established_year"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "car_model": carModel,
        "average_price": averagePrice,
        "logo": logo,
        "established_year": establishedYear,
      };
}
