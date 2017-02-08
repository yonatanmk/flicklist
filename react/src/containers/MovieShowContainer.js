import React from 'react';
import { connect } from 'react-redux';
import { browserHistory } from 'react-router';
import MovieShow from '../components/MovieShow';
import { setUserMovie, deleteUserMovie } from '../actions';

const mapStateToProps = (state, ownProps) => {
  let selectedMovie;
  let userMovies = [];
  if (state.user) {
    userMovies = state.user.movies;
  }
  if (ownProps.rec) {
    selectedMovie = ownProps.rec;
  } else {
    selectedMovie = state.selectedMovie;
  }
  debugger;
  return {
    user: state.user,
    movies: state.movies,
    selectedMovie,
    userMovies: userMovies
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    dispatch,
    handleButtonClick: (user, movie, status) => {
      dispatch(setUserMovie(user, movie, status));
    },
    handleDeleteButtonClick: (user, movie) => {
      dispatch(deleteUserMovie(user, movie));
      // browserHistory.push(`/movies`);
    }
  };
};

const MovieShowContainer = connect(mapStateToProps, mapDispatchToProps)(MovieShow);

export default MovieShowContainer;
