# Data Model Design with Python and SQLite

This repository contains the source code for a Python script that demonstrates how to design a data model using SQLite. The script creates a database with tables for Artists, Genres, Albums, and Tracks, and populates these tables from a CSV file.

## Overview

The main script performs the following tasks:

1. **Database Connection and Setup**: 
   - Connects to an SQLite database (`trackdb.sqlite`).
   - Drops existing tables if they exist and creates new tables for `Artist`, `Genre`, `Album`, and `Track`.

2. **CSV File Parsing**:
   - Reads data from a CSV file (`tracks.csv`).
   - Extracts relevant information such as track name, artist, album, genre, length, rating, and play count.

3. **Data Insertion**:
   - Inserts or updates data into the respective tables in the SQLite database.

## Database Schema

The script creates the following tables:

- **Artist**:
  - `artist_id` (Primary Key, Auto-increment)
  - `name` (Unique)

- **Genre**:
  - `genre_id` (Primary Key, Auto-increment)
  - `name` (Unique)

- **Album**:
  - `album_id` (Primary Key, Auto-increment)
  - `artist_id` (Foreign Key referencing `Artist`)
  - `title` (Unique)

- **Track**:
  - `track_id` (Primary Key, Auto-increment)
  - `title` (Unique)
  - `album_id` (Foreign Key referencing `Album`)
  - `genre_id` (Foreign Key referencing `Genre`)
  - `len` (Length of the track)
  - `rating` (Track rating)
  - `count` (Number of times the track was played)

## How to Use

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
