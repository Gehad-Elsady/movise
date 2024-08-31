class CategoryModel {
  String id;
  String name;
  String image;

  CategoryModel({required this.id, required this.name, required this.image});

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          id: '28',
          name: 'Action',
          image: 'assets/images/Category/Action.jpeg'),
      CategoryModel(
          id: '12',
          name: 'Adventure',
          image: 'assets/images/Category/Adventure.jpeg'),
      CategoryModel(
          id: '16',
          name: 'Animation',
          image: 'assets/images/Category/Animation.jpeg'),
      CategoryModel(
          id: '35',
          name: 'Comedy',
          image: 'assets/images/Category/Comedy.jpeg'),
      CategoryModel(
          id: '80', name: 'Crime', image: 'assets/images/Category/Crime.jpeg'),
      CategoryModel(
          id: '99',
          name: 'Documentary',
          image: 'assets/images/Category/Documentary.jpeg'),
      CategoryModel(
          id: '18',
          name: 'Drama',
          image: 'assets/images/Category/Documentary.jpeg'),
      CategoryModel(
          id: '10751',
          name: 'Family',
          image: 'assets/images/Category/Family.jpeg'),
      CategoryModel(
          id: '14',
          name: 'Fantasy',
          image: 'assets/images/Category/Fantasy.jpeg'),
      CategoryModel(
          id: '36',
          name: 'History',
          image: 'assets/images/Category/History.jpeg'),
      CategoryModel(
          id: '27',
          name: 'Horror',
          image: 'assets/images/Category/Horror.jpeg'),
      CategoryModel(
          id: '10402',
          name: 'Music',
          image: 'assets/images/Category/Music.jpeg'),
      CategoryModel(
          id: '9648',
          name: 'Mystery',
          image: 'assets/images/Category/Mystery.jpeg'),
      CategoryModel(
          id: '10749',
          name: 'Romance',
          image: 'assets/images/Category/Romance.jpeg'),
      CategoryModel(
          id: '878',
          name: 'Science Fiction',
          image: 'assets/images/Category/Science-Fiction.jpeg'),
      CategoryModel(
          id: '10770',
          name: 'TV Movie',
          image: 'assets/images/Category/TV-Movie.jpeg'),
      CategoryModel(
          id: '53',
          name: 'Thriller',
          image: 'assets/images/Category/Thriller.jpeg'),
      CategoryModel(
          id: '10752', name: 'War', image: 'assets/images/Category/War.jpeg'),
      CategoryModel(
          id: '37',
          name: 'Western',
          image: 'assets/images/Category/Western.jpeg'),
    ];
  }
}
