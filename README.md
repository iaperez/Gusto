# Gusto
<table>
  <tr>
    <th>
      Ruby Version
    </th>
    <td>
      2.0.0-p247
    </td>
  </tr>
  <tr>
    <th>
      Rails Version
    </th>
    <td>
      4.1.0.rc2
    </td>
  </tr>
  <tr>
    <th>
      Production Deployment
    </th>
    <td>
      git@heroku.com:gustoapp.git - http://gustoapp.herokuapp.com
    </td>
  </tr>
</table>

### Recommended setup

This guide expects that you have git and homebrew installed, and have a ruby environment set up with 2.0.0-p247 (using rbenv).

    brew install postgres
    git clone git@github.com:iaperez/Gusto.git

    gem install bundler
    cd gusto
    bundle install
    cp config/env_vars.example config/env_vars
    

#### Environment variables

In order to mimic the way Heroku works, many application configuration settings are defined with environment variables. You can also use the included support for the config/env_vars file.

##### You should not check config/env_vars into source control

If need to point the app to a database or database user different than what is in the included database.yml, you should do that with an environment variable. Once complete:

    bundle exec rake db:create
    rake db:setup
    rake db:migrate

If you receive a Postgres connection error or role error, you may need to create a Postgres user:

    createuser -s -r <USERNAME FROM database.yml>
    
### Development

    rails server

The site should now be running. If you need to use sidekiq, or elasticsearch, you may need to start other services manually.

### Testing

All that should be required is running `guard` in the project root. You can also just run `rake`.

We will have the project on Snap-ci.

