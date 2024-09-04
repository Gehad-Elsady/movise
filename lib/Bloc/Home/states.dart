abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

//----------------------App Bar
class HomeGetPopularMoviesLoadingState extends HomeStates {}

class HomeGetPopularMoviesErrorState extends HomeStates {}

class HomeGetPopularMoviesSuccessState extends HomeStates {}

//--------------------------------------------
//------------------------new releases
class HomeGetUpcomingMoviesLoadingState extends HomeStates {}

class HomeGetUpcomingMoviesErrorState extends HomeStates {}

class HomeGetUpcomingMoviesSuccessState extends HomeStates {}

//--------------------------------------------
//------------------------recommended
class HomeGetRecommendedMoviesErrorState extends HomeStates {}

class HomeGetRecommendedMoviesSuccessState extends HomeStates {}

class HomeGetRecommendedMoviesLoadingState extends HomeStates {}
