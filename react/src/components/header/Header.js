import React from 'react';
import Navbar from './Navbar';

const Header = () => {
  return (
    <section className="navigation">
      <div className="nav-container">
        <div className="brand">
          <a href="/">fLICKlIST</a>
        </div>
        <Navbar />
      </div>
    </section>
  );
};

export default Header;
