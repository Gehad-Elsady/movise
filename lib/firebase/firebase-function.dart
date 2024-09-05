import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movise/Models/popularMoviesResponse%20.dart';

class FirebaseFunctions {
  static CollectionReference<Results> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Watchlist")
        .withConverter<Results>(
      fromFirestore: (snapshot, options) {
        return Results.fromJson(snapshot.data()!);
      },
      toFirestore: (movie, options) {
        return movie.toJson();
      },
    );
  }

  static Future<void> addMovie(Results movie) {
    var collection = getTasksCollection();
    var docRef = collection.doc(movie.title);
    movie.title = docRef.id;
    return docRef.set(movie);
  }

  static Stream<QuerySnapshot<Results>> getMovies() {
    var collection = getTasksCollection();
    return collection.snapshots();
  }

  static Future<void> deleteTask(String id) {
    return getTasksCollection().doc(id).delete();
  }
}
