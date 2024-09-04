// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  String name;
  int id;
  int height;
  int weight;
  List<Type> types;
  Sprites sprites;
  List<StatElement> stats;

  Pokemon({
    required this.name,
    required this.id,
    required this.height,
    required this.weight,
    required this.types,
    required this.sprites,
    required this.stats,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    name: json["name"],
    id: json["id"],
    height: json["height"],
    weight: json["weight"],
    types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
    //The .map() function is used to transform each item in the list (represented by x) from its
    // original form (a JSON object) into a Type object.
    //Type.fromJson(x) is a constructor or method defined in the Type class that takes a
    // JSON object (x) and converts it into a Type object.
    sprites: Sprites.fromJson(json["sprites"]),
    stats: List<StatElement>.from(json["stats"].map((x) => StatElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "height": height,
    "weight": weight,
    "types": List<dynamic>.from(types.map((x) => x.toJson())),
    "sprites": sprites.toJson(),
    "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
  };
}

class Sprites {
  String frontDefault;

  Sprites({
    required this.frontDefault,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
    frontDefault: json["front_default"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
  };
}

class StatElement {
  int baseStat;
  int effort;
  TypeClass stat;

  StatElement({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory StatElement.fromJson(Map<String, dynamic> json) => StatElement(
    baseStat: json["base_stat"],
    effort: json["effort"],
    stat: TypeClass.fromJson(json["stat"]),
  );

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat.toJson(),
  };
}

class TypeClass {
  String name;
  String url;

  TypeClass({
    required this.name,
    required this.url,
  });

  factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

class Type {
  int slot;
  TypeClass type;

  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    slot: json["slot"],
    type: TypeClass.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "slot": slot,
    "type": type.toJson(),
  };
}

