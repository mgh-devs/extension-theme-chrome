class ResponseLocationModel {
  ResponseLocationModel({

    required this.results,

  });


  final List<Result> results;


  ResponseLocationModel copyWith({

    List<Result>? results,

  }) {
    return ResponseLocationModel(

      results: results ?? this.results,

    );
  }

  factory ResponseLocationModel.fromJson(Map<String, dynamic> json){
    return ResponseLocationModel(

      results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),

    );
  }

  Map<String, dynamic> toJson() => {

    "results": results.map((x) => x?.toJson()).toList(),

  };

}


class Result {
  Result({
    required this.annotations,
    required this.bounds,
    required this.components,
    required this.confidence,
    required this.formatted,
    required this.geometry,
  });

  final Annotations? annotations;
  final Bounds? bounds;
  final Components? components;
  final int? confidence;
  final String? formatted;
  final Geometry? geometry;

  Result copyWith({
    Annotations? annotations,
    Bounds? bounds,
    Components? components,
    int? confidence,
    String? formatted,
    Geometry? geometry,
  }) {
    return Result(
      annotations: annotations ?? this.annotations,
      bounds: bounds ?? this.bounds,
      components: components ?? this.components,
      confidence: confidence ?? this.confidence,
      formatted: formatted ?? this.formatted,
      geometry: geometry ?? this.geometry,
    );
  }

  factory Result.fromJson(Map<String, dynamic> json){
    return Result(
      annotations: json["annotations"] == null ? null : Annotations.fromJson(json["annotations"]),
      bounds: json["bounds"] == null ? null : Bounds.fromJson(json["bounds"]),
      components: json["components"] == null ? null : Components.fromJson(json["components"]),
      confidence: json["confidence"],
      formatted: json["formatted"],
      geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "annotations": annotations?.toJson(),
    "bounds": bounds?.toJson(),
    "components": components?.toJson(),
    "confidence": confidence,
    "formatted": formatted,
    "geometry": geometry?.toJson(),
  };

}

class Annotations {
  Annotations({
    required this.dms,
    required this.mgrs,
    required this.maidenhead,
    required this.mercator,
    required this.osm,
    required this.unM49,
    required this.callingcode,
    required this.currency,
    required this.flag,
    required this.geohash,
    required this.qibla,
    required this.roadinfo,
    required this.sun,
    required this.timezone,
    required this.what3Words,
    required this.wikidata,
  });

  final Dms? dms;
  final String? mgrs;
  final String? maidenhead;
  final Mercator? mercator;
  final Osm? osm;
  final UnM49? unM49;
  final num? callingcode;
  final Currency? currency;
  final String? flag;
  final String? geohash;
  final num? qibla;
  final Roadinfo? roadinfo;
  final Sun? sun;
  final Timezone? timezone;
  final What3Words? what3Words;
  final String? wikidata;

  Annotations copyWith({
    Dms? dms,
    String? mgrs,
    String? maidenhead,
    Mercator? mercator,
    Osm? osm,
    UnM49? unM49,
    num? callingcode,
    Currency? currency,
    String? flag,
    String? geohash,
    num? qibla,
    Roadinfo? roadinfo,
    Sun? sun,
    Timezone? timezone,
    What3Words? what3Words,
    String? wikidata,
  }) {
    return Annotations(
      dms: dms ?? this.dms,
      mgrs: mgrs ?? this.mgrs,
      maidenhead: maidenhead ?? this.maidenhead,
      mercator: mercator ?? this.mercator,
      osm: osm ?? this.osm,
      unM49: unM49 ?? this.unM49,
      callingcode: callingcode ?? this.callingcode,
      currency: currency ?? this.currency,
      flag: flag ?? this.flag,
      geohash: geohash ?? this.geohash,
      qibla: qibla ?? this.qibla,
      roadinfo: roadinfo ?? this.roadinfo,
      sun: sun ?? this.sun,
      timezone: timezone ?? this.timezone,
      what3Words: what3Words ?? this.what3Words,
      wikidata: wikidata ?? this.wikidata,
    );
  }

  factory Annotations.fromJson(Map<String, dynamic> json){
    return Annotations(
      dms: json["DMS"] == null ? null : Dms.fromJson(json["DMS"]),
      mgrs: json["MGRS"],
      maidenhead: json["Maidenhead"],
      mercator: json["Mercator"] == null ? null : Mercator.fromJson(json["Mercator"]),
      osm: json["OSM"] == null ? null : Osm.fromJson(json["OSM"]),
      unM49: json["UN_M49"] == null ? null : UnM49.fromJson(json["UN_M49"]),
      callingcode: json["callingcode"],
      currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
      flag: json["flag"],
      geohash: json["geohash"],
      qibla: json["qibla"],
      roadinfo: json["roadinfo"] == null ? null : Roadinfo.fromJson(json["roadinfo"]),
      sun: json["sun"] == null ? null : Sun.fromJson(json["sun"]),
      timezone: json["timezone"] == null ? null : Timezone.fromJson(json["timezone"]),
      what3Words: json["what3words"] == null ? null : What3Words.fromJson(json["what3words"]),
      wikidata: json["wikidata"],
    );
  }

  Map<String, dynamic> toJson() => {
    "DMS": dms?.toJson(),
    "MGRS": mgrs,
    "Maidenhead": maidenhead,
    "Mercator": mercator?.toJson(),
    "OSM": osm?.toJson(),
    "UN_M49": unM49?.toJson(),
    "callingcode": callingcode,
    "currency": currency?.toJson(),
    "flag": flag,
    "geohash": geohash,
    "qibla": qibla,
    "roadinfo": roadinfo?.toJson(),
    "sun": sun?.toJson(),
    "timezone": timezone?.toJson(),
    "what3words": what3Words?.toJson(),
    "wikidata": wikidata,
  };

}

class Currency {
  Currency({
    required this.alternateSymbols,
    required this.decimalMark,
    required this.htmlEntity,
    required this.isoCode,
    required this.isoNumeric,
    required this.name,
    required this.smallestDenomination,
    required this.subunitToUnit,
    required this.symbol,
    required this.symbolFirst,
    required this.thousandsSeparator,
  });

  final List<dynamic> alternateSymbols;
  final String? decimalMark;
  final String? htmlEntity;
  final String? isoCode;
  final String? isoNumeric;
  final String? name;
  final num? smallestDenomination;
  final num? subunitToUnit;
  final String? symbol;
  final num? symbolFirst;
  final String? thousandsSeparator;

  Currency copyWith({
    List<dynamic>? alternateSymbols,
    String? decimalMark,
    String? htmlEntity,
    String? isoCode,
    String? isoNumeric,
    String? name,
    num? smallestDenomination,
    num? subunitToUnit,
    String? symbol,
    num? symbolFirst,
    String? thousandsSeparator,
  }) {
    return Currency(
      alternateSymbols: alternateSymbols ?? this.alternateSymbols,
      decimalMark: decimalMark ?? this.decimalMark,
      htmlEntity: htmlEntity ?? this.htmlEntity,
      isoCode: isoCode ?? this.isoCode,
      isoNumeric: isoNumeric ?? this.isoNumeric,
      name: name ?? this.name,
      smallestDenomination: smallestDenomination ?? this.smallestDenomination,
      subunitToUnit: subunitToUnit ?? this.subunitToUnit,
      symbol: symbol ?? this.symbol,
      symbolFirst: symbolFirst ?? this.symbolFirst,
      thousandsSeparator: thousandsSeparator ?? this.thousandsSeparator,
    );
  }

  factory Currency.fromJson(Map<String, dynamic> json){
    return Currency(
      alternateSymbols: json["alternate_symbols"] == null ? [] : List<dynamic>.from(json["alternate_symbols"]!.map((x) => x)),
      decimalMark: json["decimal_mark"],
      htmlEntity: json["html_entity"],
      isoCode: json["iso_code"],
      isoNumeric: json["iso_numeric"],
      name: json["name"],
      smallestDenomination: json["smallest_denomination"],
      subunitToUnit: json["subunit_to_unit"],
      symbol: json["symbol"],
      symbolFirst: json["symbol_first"],
      thousandsSeparator: json["thousands_separator"],
    );
  }

  Map<String, dynamic> toJson() => {
    "alternate_symbols": alternateSymbols.map((x) => x).toList(),
    "decimal_mark": decimalMark,
    "html_entity": htmlEntity,
    "iso_code": isoCode,
    "iso_numeric": isoNumeric,
    "name": name,
    "smallest_denomination": smallestDenomination,
    "subunit_to_unit": subunitToUnit,
    "symbol": symbol,
    "symbol_first": symbolFirst,
    "thousands_separator": thousandsSeparator,
  };

}

class Dms {
  Dms({
    required this.lat,
    required this.lng,
  });

  final String? lat;
  final String? lng;

  Dms copyWith({
    String? lat,
    String? lng,
  }) {
    return Dms(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  factory Dms.fromJson(Map<String, dynamic> json){
    return Dms(
      lat: json["lat"],
      lng: json["lng"],
    );
  }

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };

}

class Mercator {
  Mercator({
    required this.x,
    required this.y,
  });

  final num? x;
  final num? y;

  Mercator copyWith({
    num? x,
    num? y,
  }) {
    return Mercator(
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  factory Mercator.fromJson(Map<String, dynamic> json){
    return Mercator(
      x: json["x"],
      y: json["y"],
    );
  }

  Map<String, dynamic> toJson() => {
    "x": x,
    "y": y,
  };

}

class Osm {
  Osm({
    required this.editUrl,
    required this.noteUrl,
    required this.url,
  });

  final String? editUrl;
  final String? noteUrl;
  final String? url;

  Osm copyWith({
    String? editUrl,
    String? noteUrl,
    String? url,
  }) {
    return Osm(
      editUrl: editUrl ?? this.editUrl,
      noteUrl: noteUrl ?? this.noteUrl,
      url: url ?? this.url,
    );
  }

  factory Osm.fromJson(Map<String, dynamic> json){
    return Osm(
      editUrl: json["edit_url"],
      noteUrl: json["note_url"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
    "edit_url": editUrl,
    "note_url": noteUrl,
    "url": url,
  };

}

class Roadinfo {
  Roadinfo({
    required this.driveOn,
    required this.road,
    required this.roadType,
    required this.speedIn,
  });

  final String? driveOn;
  final String? road;
  final String? roadType;
  final String? speedIn;

  Roadinfo copyWith({
    String? driveOn,
    String? road,
    String? roadType,
    String? speedIn,
  }) {
    return Roadinfo(
      driveOn: driveOn ?? this.driveOn,
      road: road ?? this.road,
      roadType: roadType ?? this.roadType,
      speedIn: speedIn ?? this.speedIn,
    );
  }

  factory Roadinfo.fromJson(Map<String, dynamic> json){
    return Roadinfo(
      driveOn: json["drive_on"],
      road: json["road"],
      roadType: json["road_type"],
      speedIn: json["speed_in"],
    );
  }

  Map<String, dynamic> toJson() => {
    "drive_on": driveOn,
    "road": road,
    "road_type": roadType,
    "speed_in": speedIn,
  };

}

class Sun {
  Sun({
    required this.rise,
    required this.sunSet,
  });

  final Rise? rise;
  final Rise? sunSet;

  Sun copyWith({
    Rise? rise,
    Rise? sunSet,
  }) {
    return Sun(
      rise: rise ?? this.rise,
      sunSet: sunSet ?? this.sunSet,
    );
  }

  factory Sun.fromJson(Map<String, dynamic> json){
    return Sun(
      rise: json["rise"] == null ? null : Rise.fromJson(json["rise"]),
      sunSet: json["set"] == null ? null : Rise.fromJson(json["set"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "rise": rise?.toJson(),
    "set": sunSet?.toJson(),
  };

}

class Rise {
  Rise({
    required this.apparent,
    required this.astronomical,
    required this.civil,
    required this.nautical,
  });

  final num? apparent;
  final num? astronomical;
  final num? civil;
  final num? nautical;

  Rise copyWith({
    num? apparent,
    num? astronomical,
    num? civil,
    num? nautical,
  }) {
    return Rise(
      apparent: apparent ?? this.apparent,
      astronomical: astronomical ?? this.astronomical,
      civil: civil ?? this.civil,
      nautical: nautical ?? this.nautical,
    );
  }

  factory Rise.fromJson(Map<String, dynamic> json){
    return Rise(
      apparent: json["apparent"],
      astronomical: json["astronomical"],
      civil: json["civil"],
      nautical: json["nautical"],
    );
  }

  Map<String, dynamic> toJson() => {
    "apparent": apparent,
    "astronomical": astronomical,
    "civil": civil,
    "nautical": nautical,
  };

}

class Timezone {
  Timezone({
    required this.name,
    required this.nowInDst,
    required this.offsetSec,
    required this.offsetString,
    required this.shortName,
  });

  final String? name;
  final num? nowInDst;
  final num? offsetSec;
  final String? offsetString;
  final String? shortName;

  Timezone copyWith({
    String? name,
    num? nowInDst,
    num? offsetSec,
    String? offsetString,
    String? shortName,
  }) {
    return Timezone(
      name: name ?? this.name,
      nowInDst: nowInDst ?? this.nowInDst,
      offsetSec: offsetSec ?? this.offsetSec,
      offsetString: offsetString ?? this.offsetString,
      shortName: shortName ?? this.shortName,
    );
  }

  factory Timezone.fromJson(Map<String, dynamic> json){
    return Timezone(
      name: json["name"],
      nowInDst: json["now_in_dst"],
      offsetSec: json["offset_sec"],
      offsetString: json["offset_string"],
      shortName: json["short_name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "now_in_dst": nowInDst,
    "offset_sec": offsetSec,
    "offset_string": offsetString,
    "short_name": shortName,
  };

}

class UnM49 {
  UnM49({
    required this.regions,
    required this.statisticalGroupings,
  });

  final Regions? regions;
  final List<String> statisticalGroupings;

  UnM49 copyWith({
    Regions? regions,
    List<String>? statisticalGroupings,
  }) {
    return UnM49(
      regions: regions ?? this.regions,
      statisticalGroupings: statisticalGroupings ?? this.statisticalGroupings,
    );
  }

  factory UnM49.fromJson(Map<String, dynamic> json){
    return UnM49(
      regions: json["regions"] == null ? null : Regions.fromJson(json["regions"]),
      statisticalGroupings: json["statistical_groupings"] == null ? [] : List<String>.from(json["statistical_groupings"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "regions": regions?.toJson(),
    "statistical_groupings": statisticalGroupings.map((x) => x).toList(),
  };

}

class Regions {
  Regions({
    required this.asia,
    required this.ir,
    required this.southernAsia,
    required this.world,
  });

  final String? asia;
  final String? ir;
  final String? southernAsia;
  final String? world;

  Regions copyWith({
    String? asia,
    String? ir,
    String? southernAsia,
    String? world,
  }) {
    return Regions(
      asia: asia ?? this.asia,
      ir: ir ?? this.ir,
      southernAsia: southernAsia ?? this.southernAsia,
      world: world ?? this.world,
    );
  }

  factory Regions.fromJson(Map<String, dynamic> json){
    return Regions(
      asia: json["ASIA"],
      ir: json["IR"],
      southernAsia: json["SOUTHERN_ASIA"],
      world: json["WORLD"],
    );
  }

  Map<String, dynamic> toJson() => {
    "ASIA": asia,
    "IR": ir,
    "SOUTHERN_ASIA": southernAsia,
    "WORLD": world,
  };

}

class What3Words {
  What3Words({
    required this.words,
  });

  final String? words;

  What3Words copyWith({
    String? words,
  }) {
    return What3Words(
      words: words ?? this.words,
    );
  }

  factory What3Words.fromJson(Map<String, dynamic> json){
    return What3Words(
      words: json["words"],
    );
  }

  Map<String, dynamic> toJson() => {
    "words": words,
  };

}

class Bounds {
  Bounds({
    required this.northeast,
    required this.southwest,
  });

  final Geometry? northeast;
  final Geometry? southwest;

  Bounds copyWith({
    Geometry? northeast,
    Geometry? southwest,
  }) {
    return Bounds(
      northeast: northeast ?? this.northeast,
      southwest: southwest ?? this.southwest,
    );
  }

  factory Bounds.fromJson(Map<String, dynamic> json){
    return Bounds(
      northeast: json["northeast"] == null ? null : Geometry.fromJson(json["northeast"]),
      southwest: json["southwest"] == null ? null : Geometry.fromJson(json["southwest"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "northeast": northeast?.toJson(),
    "southwest": southwest?.toJson(),
  };

}

class Geometry {
  Geometry({
    required this.lat,
    required this.lng,
  });

  final num? lat;
  final num? lng;

  Geometry copyWith({
    num? lat,
    num? lng,
  }) {
    return Geometry(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  factory Geometry.fromJson(Map<String, dynamic> json){
    return Geometry(
      lat: json["lat"],
      lng: json["lng"],
    );
  }

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };

}

class Components {
  Components({

    required this.country,
    required this.countryCode,
    required this.county,
    required this.district,
    required this.road,
    required this.roadType,
    required this.state,
    required this.town,
    required this.city,
    required this.postcode,
  });

  final String? country;
  final String? countryCode;
  final String? county;
  final String? district;
  final String? road;
  final String? roadType;
  final String? state;
  final String? town;
  final String? city;
  final String? postcode;

  Components copyWith({
    String? iso31661Alpha2,
    String? iso31661Alpha3,
    List<String>? iso31662,
    String? category,
    String? normalizedCity,
    String? type,
    String? continent,
    String? country,
    String? countryCode,
    String? county,
    String? district,
    String? road,
    String? roadType,
    String? state,
    String? town,
    String? city,
    String? postcode,
  }) {
    return Components(

      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      county: county ?? this.county,
      district: district ?? this.district,
      road: road ?? this.road,
      roadType: roadType ?? this.roadType,
      state: state ?? this.state,
      town: town ?? this.town,
      city: city ?? this.city,
      postcode: postcode ?? this.postcode,
    );
  }

  factory Components.fromJson(Map<String, dynamic> json){
    return Components(

      country: json["country"],
      countryCode: json["country_code"],
      county: json["county"],
      district: json["district"],
      road: json["road"],
      roadType: json["road_type"],
      state: json["state"],
      town: json["town"],
      city: json["city"],
      postcode: json["postcode"],
    );
  }

  Map<String, dynamic> toJson() => {

    "country": country,
    "country_code": countryCode,
    "county": county,
    "district": district,
    "road": road,
    "road_type": roadType,
    "state": state,
    "town": town,
    "city": city,
    "postcode": postcode,
  };

}




