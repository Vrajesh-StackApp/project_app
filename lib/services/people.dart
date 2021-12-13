class People {
  String name,
      height,
      mass,
      hairColor,
      skinColor,
      eyeColor,
      birthYear,
      gender,
      homeWorld;
  List<String> filmsList;
  List<Null> speciesList;
  List<String> vehicleList;
  List<String> starshipsList;
  String created, edited, url;

  People(
      this.name,
      this.height,
      this.mass,
      this.hairColor,
      this.skinColor,
      this.eyeColor,
      this.birthYear,
      this.gender,
      this.homeWorld,
      this.filmsList,
      this.speciesList,
      this.vehicleList,
      this.starshipsList,
      this.created,
      this.edited,
      this.url);

  factory People.fromJson(Map<String, dynamic> parsedJson) {
    return People(
      parsedJson['name'],
      parsedJson['height'],
      parsedJson['mass'],
      parsedJson['hair_color'],
      parsedJson['skin_color'],
      parsedJson['eye_color'],
      parsedJson['birth_year'],
      parsedJson['gender'],
      parsedJson['homeworld'],
      parsedJson['films'].cast<String>(),
      parsedJson['species'].cast<Null>(),
      parsedJson['vehicles'].cast<String>(),
      parsedJson['starships'].cast<String>(),
      parsedJson['created'],
      parsedJson['edited'],
      parsedJson['url'],
    );
  }
}

class Species {
  List<Null> species;

  Species(this.species);

  factory Species.fromJson(Map<String, dynamic> parsedJson) {
    return Species(parsedJson['species']);
  }
}

class Vehicles {
  List<String> vehicle;

  Vehicles(this.vehicle);

  factory Vehicles.fromJson(Map<String, dynamic> parsedJson) {
    var vehiclesFromJson = parsedJson['vehicles'];
    List<String> vehiclesList = vehiclesFromJson.cast<String>();

    return Vehicles(vehiclesList);
  }
}

class Starships {
  List<String> starships;

  Starships(this.starships);

  factory Starships.fromJson(Map<String, dynamic> parsedJson) {
    var vehiclesFromJson = parsedJson['starships'];
    List<String> starshipsList = vehiclesFromJson.cast<String>();

    return Starships(starshipsList);
  }
}
