class Permit {
  String? type;
  Properties? properties;
  Geometry? geometry;

  Permit({this.type, this.properties, this.geometry});

  Permit.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
  }
}

class Properties {
  String? tipas;
  String? galiojaNuo;
  String? galiojaIki;
  String? kadastrinisNr;
  String? vmuPadalinys;
  String? girininkija;
  int? kvartalas;
  String? sklypas;
  double? kertamasPlotas;
  String? vyraujantysMedziai;
  String? kirtimoRusis;
  String? atkurimoBudas;

  Properties(
      {this.tipas,
      this.galiojaNuo,
      this.galiojaIki,
      this.kadastrinisNr,
      this.vmuPadalinys,
      this.girininkija,
      this.kvartalas,
      this.sklypas,
      this.kertamasPlotas,
      this.vyraujantysMedziai,
      this.kirtimoRusis,
      this.atkurimoBudas});

  Properties.fromJson(Map<String, dynamic> json) {
    tipas = json['tipas'];
    galiojaNuo = json['galioja_nuo'];
    galiojaIki = json['galioja_iki'];
    kadastrinisNr = json['kadastrinis_nr'];
    vmuPadalinys = json['vmu_padalinys'];
    girininkija = json['girininkija'];
    kvartalas = json['kvartalas'];
    sklypas = json['sklypas'];
    kertamasPlotas = json['kertamas_plotas'];
    vyraujantysMedziai = json['vyraujantys_medziai'];
    kirtimoRusis = json['kirtimo_rusis'];
    atkurimoBudas = json['atkurimo_budas'];
  }
}

class Geometry {
  String? type;
  List<List<List<List<double>>>>? coordinates;

  Geometry({this.type, this.coordinates});

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      type: json["type"],
      coordinates: json["coordinates"] == null
          ? []
          : List<List<List<List<double>>>>.from(json["coordinates"]!.map((x) =>
              x == null
                  ? []
                  : List<List<List<double>>>.from(x!.map((x) => x == null
                      ? []
                      : List<List<double>>.from(x!.map((x) => x == null
                          ? []
                          : List<double>.from(x!.map((x) => x)))))))),
    );
  }
}
