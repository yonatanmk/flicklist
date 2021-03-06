import React from 'react';
import { Link } from 'react-router';
import IndexMovieBoxContainer from '../containers/IndexMovieBoxContainer';

const MovieList = ({movies, firstSearch, handleMovieClick, handleAddUserMovieClick}) => {
  if (!firstSearch && movies.length == 0) {
    return <p></p>;
  }
  else if (movies.length == 0) {
    return <div className='movieList-filler'></div>;
  }
  else {
    movies = movies.map((movie) => {
      return (
        <IndexMovieBoxContainer
          key={movie.id}
          movie={movie}
          movies={movies}
          page="index"
        />
      );
    });
    return (
      <div>
        <div className='index-list'>
          {movies}
        </div>
      </div>
    );
  }
};

export default MovieList;
