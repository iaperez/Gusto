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

In order to mimic the way Heroku works, many application configuration settings are defined with environment variables. If you are using foreman/etc you may have a different way of accomplishing this. You can also use the included support for the config/env_vars file.

##### You should not check config/env_vars into source control

You will need to set the SECRET_TOKEN value for the app to start (the default value is too short). The other default value may not be required. If need to point the app to a database or database user different than what is in the included database.yml, you should do that with an environment variable. Once complete:

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

We will have the project on Travis-CI. If you submit a pull request, I assume it should check on that. I don't know.


### Copyright & License

The Gusto software is released under the [Affero GNU General Public License](http://www.gnu.org/licenses/agpl.html).

Copyright (c) 2014 Gusto Team

This program is free software: you can redistribute it and/or modify
it under the terms of the Affero GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
Affero GNU General Public License for more details.

You should have received a copy of the Affero GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
