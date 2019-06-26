### Task

Develop software that can be used to manage tournament scoring - prepare and fill tournament schedule. User can enter list of teams. Together 16 teams are participating. Teams by random are split in 2 divisions – A and B (8 teams in each). In each division teams play each against other. The best 4 teams from each division meet in Play-off. Play-off initial schedule is made by principle - best team plays against worst team. The winning team stays to play further but the losing team is out of the game. Overall winning team is the one who wins all games in play-off.
 
Software should be developed on Ruby on Rails 4.2 or newer. Please show your best knowledge of object-oriented programming.

In order not to enter the tournament results by hand please use auto generation - by pressing a button generate Division A results, then Division B results, then Playoff results. No rules for UI layout. Results must be saved in database, that could be erased to create a new tournament.  


### Demo server
https://rails-tournament.herokuapp.com/

### Требования:

- Ruby 2.4.4
- PostgreSQL 9.6+
  - `brew install postgresql` (Mac OS)
  - `sudo apt-get install postgresql postgresql-contrib` (Linux)
  - `psql postgres` (Mac OS)
  - `sudo -u postgres psql` (Linux)
  - `createuser -s postgres`

### Set up
- Install gems
  - `gem install bundler`
  - `bundle install`
- Set up db connection in 
  - `database.yml`
- Setup DB
  - `rails db:setup`
- Start server:
  - `rails s`
