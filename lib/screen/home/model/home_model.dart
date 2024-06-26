class HomeModel {
  String? position;
  String? name;
  String? image;
  String? velocity;
  String? distance;
  String? description;

  HomeModel({
    this.position,
    this.name,
    this.image,
    this.velocity,
    this.distance,
    this.description,
  });

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
      position: m1['position'],
      name: m1['name'],
      image: m1['image'],
      velocity: m1['velocity'],
      distance: m1['distance'],
      description: m1['description'],
    );
  }
}
