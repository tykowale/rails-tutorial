# Ruby on Rails Tutorial sample application

## Reference implementation

This is the reference implementation of the sample application from
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](https://www.railstutorial.org/)
(6th Edition)
by [Michael Hartl](http://www.michaelhartl.com/).

## Getting started

To get started with the app, first clone the repo and `cd` into the directory:

```
$ git clone https://github.com/mhartl/sample_app_6th_ed.git
$ cd sample_app_6th_ed
```

Then install the needed packages (while skipping any Ruby gems needed only in production):

```
$ yarn add jquery@3.5.1 bootstrap@3.4.1
$ gem install bundler -v 2.2.15
$ bundle _2.2.15_ config set --local without 'production'
$ bundle _2.2.15_ install
```

(If you run into any installation issues or missing dependencies, refer to
the [first chapter](https://www.railstutorial.org/book/beginning) of the tutorial for details.)

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rspec
```

If the test suite passes, you’ll be ready to seed the database with sample users and run the app in a local server:

```
$ rails db:seed
$ rails server
```

You can then register a new user or log in as the sample administrative user with the email `example@railstutorial.org`
and password `foobar`.
