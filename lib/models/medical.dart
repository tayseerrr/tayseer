// offer_id, partner, title, discount, start_date, end_date
// mid, name, logo, description, branches

class Medical {
  Medical({
    this.mid,
    required this.name,
    this.logo,
    required this.description,
    required this.branches,
    required this.offers,
  });

  final int? mid;
  final String name;
  final String? logo;
  final String description;
  final String branches;
  final List<MedicalOffer> offers;

  factory Medical.fromJson(Map<String, dynamic> json) {
    try {

       return Medical(
        mid: json['mid'] as int,
        name: json['name'],
        description: json['description'] as String,
        branches: json['branches'] as String,
        logo: json['logo'],
        offers: List<MedicalOffer>.from(
            json['offers'].map((x) => MedicalOffer.fromJson(x))),
      );
    } catch (e) {
      print(e);
      return Medical(
        mid: 0,
        name: '',
        logo: '',
        description: '',
        branches: '',
        offers: [],
      );
    }
  }

  Map<String, dynamic> toJson() => {
        'mid': mid,
        'name': name,
        'logo': logo,
        'description': description,
        'branches': branches,
        'offers': List<dynamic>.from(offers.map((x) => x.toJson())),
      };
}

class MedicalOffer {
  MedicalOffer({
    this.offerId,
    this.partner,
    required this.title,
    required this.discount,
  });

  final int? offerId;
  final String? partner;
  final String title;
  final double discount;

  factory MedicalOffer.fromJson(Map<String, dynamic> json) {
    try {
      return MedicalOffer(
        offerId: json['offer_id'] ,
        partner: json['partner'].toString(),
        title: json['title'] as String,
        discount: json['discount'] as double,
      );
    } catch (e) {
      print(e);
      return MedicalOffer(
        offerId: 0,
        partner: '',
        title: '',
        discount: 0,
      );
    }
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'discount': discount,
      };
}
