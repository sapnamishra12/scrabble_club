# Instruction for setup

# Language Version Required
* Ruby version : 2.6.3
* Rails version : 5.2.0

# Application Setup
* Database : MySQL
* Clone this Git Repo : https://github.com/sapnamishra12/scrabble_club
* Run Command : bundle install

# Database Creation, Migration & Populate Data
* Create : rails db:create
* Migration : rails db:migrate
* Poupulate Model Data : rails model:populate

# Gem Details
* Faker - For inserting fake data to model
* rails-env-credentials - Enhances Rails credentials for multiple environments

  To Setup your env variables run below command and add your variables into that file
  
  EDITOR=nano rails env_credentials:edit -e development

# Browser URL Details
A member’s profile screen showing their
    1. number of wins
    2. number of losses
    3. their average score
    4. their highest score, when and where it was scored, and against whom

Please visit this link in browser for above functionality

http://localhost:3000/members/{id} 

example: http://localhost:3000/members/1 (Here 1 is reference id of member)

Interfaces (preferably browser based) to create and edit members’ details, such as name, contact number etc.

Please visit this link in browser for above functionality

http://localhost:3000/members

A leader board screen to list the members with the top 10 average scores, for those members who have played at least 10 matches.

http://localhost:3000/matches/top_players

