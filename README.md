# Library-Management-System-PostgreSQL-
# Project Overview

This project implements a Library Management System using PostgreSQL to manage books, authors, and patrons. The system supports core CRUD operations (Create, Read, Update, Delete) and features advanced querying capabilities.

# Environment Setup

Prerequisites

    PostgreSQL installed.

    pgAdmin (recommended for database management and querying) or psql command-line client.

# Database Creation

    Open pgAdmin and connect to your PostgreSQL server.

    Right-click on Databases and select Create > Database...

    Name the new database: LibraryDB

## Instructions for Running Queries

These commands can be executed in the **Query Tool** within **pgAdmin** or directly using the `psql` command-line client after connecting to the `LibraryDB` database.

### 1. Project Setup

Execute the following commands to create the database schema:

```sql
-- Create Authors Table
CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    nationality VARCHAR(50),
    birth_year INT,
    death_year INT
);

-- Create Books Table 
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL UNIQUE,
    author_id INT REFERENCES authors(id) ON DELETE CASCADE,
    genres TEXT[],
    published_year INT,
    available BOOLEAN DEFAULT TRUE
);

-- Create Patrons Table 
CREATE TABLE patrons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    borrowed_books INT[] DEFAULT ARRAY[]::INT[]
);

### CRUD Operations (Queries) Can Be found in the CRUD.sql file
    Each opertion is described in a comment above it.
