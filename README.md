## ikeora - Power to the People!

An online consulting platform targeted at Nigerian entrepreneurs and eventually Nigerian businesses as a whole. We link intelligent Nigerian-Americans with Nigerian businesses for mutual benefit.

### Circle CI:

Master: [![Circle CI](https://circleci.com/gh/SundayAdefila/ikeora/tree/master.svg?style=svg&circle-token=c524bb3f1d7191222b2ae6b11aeb653d121d9c8a)](https://circleci.com/gh/SundayAdefila/ikeora/tree/master)

Dev: [![Circle CI](https://circleci.com/gh/SundayAdefila/ikeora/tree/dev.svg?style=svg&circle-token=c524bb3f1d7191222b2ae6b11aeb653d121d9c8a)](https://circleci.com/gh/SundayAdefila/ikeora/tree/dev)

### Dependencies

To be able to run this application on local machines, the following is needed to be installed ( if already not )

1. RVM: for managing different ruby versions ( or rbenv )
2. Ruby 2.3.0
3. Rails 4.2.5
4. Postgress db

Instructions on going about num 1 - 3 can be found [here](https://rvm.io/rvm/install).

Instructions on Installing postgress can be found [here](https://www.moncefbelyamani.com/how-to-install-postgresql-on-a-mac-with-homebrew-and-lunchy/).



### Starting up on development

1. Clone the project => `$ git clone <....>`
2. Install bundles => `$ bundle install`. Note: If you have no bundler yet, first run `$ gem install bundler`
3. Create and Migrate database => `$ rake db:create db:migrate`
4. Create a default admin user => `$ rake db:seed`
4. Check with someone on dev to get a valid `application.yml` file for env vars
5. Start up the local server => `$ ./dev_server.sh`
6. Visit the homepage at: `http://localhost:3000`, or Admin homepabe at `http://localhost:3000/admin` ( Login with email: admin@example.com, password: password )


### Integration Testing

The Continous Integration testing has status has shown above under Circle CI. However, to run these test on the development environment:

  - Unit/Integration test: We are using Rspec => from inside the root folder of the project(on your terminal), run `$ rspec`
  
  - View/Feature test: We are using Cucumber and Capybara => from inside the root folder of the project(on your terminal), run `$ rake cucumber`
   