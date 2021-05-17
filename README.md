# Bookmark Manager

This project is ongoing and looks to build a bookmark manager with persistant storage using PostgreSQL.

## User Stories

```
As a user
So that I can quickly go to web sites I regularly visit
I would like to see a list of my bookmarks
```

## Domain Model Diagram

## How to use

### To set up the project

```
git clone https://github.com/cms718/bookmark_manager
bundle
```

### To set up the database

Connect to `psql` and create the `bookmark_manager` database:

```
CREATE DATABASE bookmark_manager;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Bookmark Manager app:

```
rackup
```

To view bookmarks, navigate to `localhost:9292/bookmarks`.

### To run tests:

```
rspec
```

### To run linting:

```
rubocop
```
