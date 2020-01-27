# Associations With Rails - Eventbrite Clone

A site similar to a private Eventbrite which allows users to create events and then manage user signups. Users can create events and send invitations and parties. Events take place at a specific date and at a location. This project is designed to mimic the logic behind [Eventbrite](https://www.https:/www.eventbrite.com/).


## Technologies

- HTML
- CSS
- SASS
- Ruby
- Ruby on Rails

## Usage

> Clone the repository to your local machine

```
$ git clone git@github.com:ampaire/private_events.git
```

> cd into the directory

```
$ cd private_events
```

> Then install the needed gems (while skipping any gems needed only in production):

```
$ bundle install --without production
```

> Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

> If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

[![Run on Repl.it](https://repl.it/badge/github/rOluochKe/test)](https://repl.it/github/rOluochKe/test)

## Functionalities

- Create an account
- Login with an email
- Create an events
- Attend other people's events
- People attending your events
- Check your upcoming and past events

## Designed and developed by

[Phemia Ampaire](https://github.com/ampaire) &&
[Raymond Oluoch](https://github.com/rOluochKe)

## Contributing

1. Fork it (git clone git@github.com:ampaire/private_events/fork)
2. Create your feature branch (git checkout -b feature/[choose-a-name])
3. Commit your changes (git commit -am 'What this commit will fix/add')
4. Push to the branch (git push origin feature/[chosen name])
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE.md) file for details
