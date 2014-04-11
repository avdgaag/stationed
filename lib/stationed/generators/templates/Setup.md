# Setup instructions

This page will guide you through setting up the application.

## 1. Get the code

First, make sure you have the repository checked out:

    % git clone path/to/repo.git

## 2. System dependencies

As this is a Ruby on Rails application, your system will need both Ruby and
Rubygems installed. Ensure that it is:

    % ruby --version
    ruby 2.1.1p76 (2014-02-24 revision 45161) [x86_64-linux]
    % gem --version
    2.2.2

If you don't have Ruby installed yet, using
{Rbenv}[https://github.com/sstephenson/rbenv] or {rvm}[http://rvm.io] is
recommeded to install it.

Once you've got Ruby set up, install {Bundler}[http://bundler.io] to install
further dependencies.

    % gem install bundler
    % bundle install

## 3. Database configuration

Once Bundler has installed all required Ruby gems, you can go ahead and setup
your database. You will need to specify your database connection details in
`config/database.yml`. There is a template for you to customize in
`config/database.yml.example`.

## 4. Application configuration

The application further depends on a couple of environment variables. These are
read from `.env`. There is a template file `env.example` for you to customize.
Create your personal `.env` file and make sure to fill in the blanks.

## 5. Database setup

Once all your settings are done, you can create your database, load the schema
and any seed data with Rake:

    % bin/rake db:setup

## 6. Launch web server

Now you can start a new Rails server to browse through the application:

    % bin/rails server

The application should now be accessible at
[http://localhost:3000](http://localhost:3000).
