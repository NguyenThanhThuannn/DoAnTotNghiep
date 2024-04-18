class FooterResponseModel{
  FooterResponseModel({
    this.code,
    this.message,
    required this.data,
  });
  int? code;
  String? message;
  FooterModel data;
}

class FooterModel{
  FooterModel({
    required this.item,
  });
  List<FooterItemModel> item;
}

class FooterItemModel{
  FooterItemModel({
    this.pathIcon,
    required this.title,
    required this.subtitle,
  });
  String? pathIcon;
  String title;
  String subtitle;
}