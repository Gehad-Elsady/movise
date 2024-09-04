abstract class MoviesStates {}

class MoviesInitialState extends MoviesStates {}

class MoviesLoadingState extends MoviesStates {}

class MoviesErrorState extends MoviesStates {}

class MoviesSuccessState extends MoviesStates {}

class MoviesDetailsLoadingState extends MoviesStates {}

class MoviesDetailsErrorState extends MoviesStates {}

class MoviesDetailsSuccessState extends MoviesStates {}

class TrailerLoadingState extends MoviesStates {}

class TrailerErrorState extends MoviesStates {}

class TrailerSuccessState extends MoviesStates {}
