# Bookmark Manager

This project is ongoing and looks to build a bookmark manager with persistant storage using PostgreSQL.

## User Stories

```
As a user
So that I can quickly go to web sites I regularly visit
I would like to see a list of my bookmarks

As a user
So that I can remember a page I like
I would like to add a bookmark to my homepage
```

## Domain Model Diagram

user->controller:"/bookmarks"
controller->model:".all"
model->controller:"[bookmarks]"
controller->view:"[bookmarks]"
view->controller:"html"

## How to use

### To set up the project

```
git clone https://github.com/cms718/bookmark_manager
bundle
```

### To set up the database

Connect to `psql` and create the `bookmark_manager` and `bookmark_manager_test` databases:

```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

To set up the appropriate tables, connect to the databases in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

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
