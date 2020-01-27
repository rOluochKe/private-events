# Private Events

This is part of the Association Project in The Odin Project’s Ruby on Rails Curriculum. Find it at [here](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations).

## Function description

1. User
   - Sign up / Log in / Log out
      * User can sign up with name, email
      * User can log in with email
   - Without log out, reopen browser, log in status remain

2. Event
   - Create : Log in user can create a new event
   - Delete : Event creator can delete the event
   - Attend : Users can attend/leave event
   - main view : In the root path
      * User can see any Upcoming event, Past event
   - Each event view : When user clicked an event
      * User can see event attendees

3. Event option access for log in user
   - Create event
   - User created upcoming / past event list
   - User attended upcoming / past event list

## Technology

- Ruby 2.6.3
- Rails 5.2.3

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Then, load data from seed into the database:

```
$ rails db:seed
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

## Contributors

This is a collaborative project by us: [Simon Wathigo](https://github.com/wathigo) and [Suhyeon Jang](https://github.com/shjang7)


## Contributing

1. Fork it (https://github.com/wathigo/private-events/fork)
2. Create your feature branch (git checkout -b feature/[choose-a-name])
3. Commit your changes (git commit -am 'what this commit will fix/add')
4. Push to the branch (git push origin feature/[chosen-name])
5. Create a new Pull Request


## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
