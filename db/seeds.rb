# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'

url = "https://www.balldontlie.io/api/v1"
all_players_url = "#{url}/players?per_page=100&page=1"
team_games_from_specific_season_url = "${url}/games/?seasons[]=2018&team_ids[]=14"
all_games_from_specific_player_in_specific_season_url = "#{url}/stats/?per_page=100&seasons[]=2018&player_ids[]=237&postseason=false"
harrison_barnes = 'https://www.balldontlie.io/api/v1/stats/?seasons[]=2018&player_ids[]=30&postseason=false'

# Creates all Teams
# -------------------

# request = RestClient::Request.execute(
#     method: :get,
#     url: 'https://www.balldontlie.io/api/v1/teams'
# )
# response = JSON.parse(request)
# teams = response["data"]
# teams.map do |team|
#     Team.create(id: team["id"], abbreviation: team["abbreviation"], city: team["city"], conference: team["conference"], division: team["division"], full_name: team["full_name"], name: team["name"])
# end 

# Creates all Seasons
# ---------------------

# (1979..2019).to_a.each do |year|
#     Season.create(id: year, year: year)
# end

# Create all Players
# --------------------

# Player.destroy_all

# page = 1
# while page < 34 do
#     request = RestClient::Request.execute(
#         method: :get,
#         url: "https://www.balldontlie.io/api/v1/players?per_page=100&page=#{page}"
#     )
#     response = JSON.parse(request)
#     players = response["data"]
#     players.map do |player|
#         Player.create(id: player["id"], first_name: player["first_name"], last_name: player["last_name"], position: player["position"], height_feet: player["height_feet"], height_inches: player["height_inches"], weight_pounds: player["weight_pounds"], active: false)
#     end
#     page += 1 
# end 

# Create All TeamSeasons
# ------------------------

# Team.all.each do |team|
#     Season.all.each do |year|
#         TeamSeason.create(team: team, season: year)
#     end
# end

counter = 2019
ast = 0
blk = 0
dreb = 0
fg3a = 0
fg3m = 0
fga = 0
fgm = 0
fta = 0
ftm = 0
oreb = 0
pf = 0
pts = 0
reb = 0
stl = 0
turnover = 0

arr = Player.all.limit(500)



# LeBron James
# player_id = 237

# map over the first 500 players and for each player map over all 41 seasons by year (1979-2019)
# a single fetch will return all the games of a season
#   if the data returned is empty, dont do anything and make the next fetch for the next year (of same player)
#   if the data returned exists, iterate through each game while adding up the total to the counter
#    sort the array of GAME objects, from first game to last game
#    if the next GAME's TEAM_ID does not match the current one, create a PLAYER_STAT instance with the PLAYER.ID and TEAM_SEASON.ID matching the current SEASON.YEAR and TEAM.ID
#    , then keep going
#   when you reach the end of a season, create a PLAYER_STAT instance with the PLAYER.ID and TEAM_SEASON.ID matching the current SEASON.YEAR and TEAM.ID

# ----------------------------------------------------------------------------------------------------------------------------------
# USE HARRISON BARNES AS A TEST SUBJECT OF HIS 2018. NEED TO SAVE THE ENTIRE GAME INSTANCE SOMEHOW AND SEE IF I CAN SORT BY DATE/ID
# I can (both DATE or ID)
# -----------------------------------------------------------------------------------------------------------------------------------

arr.each do |player|
    Season.all each do |season|
        request = RestClient::Request.execute(
            method: :get,
            url: "https://www.balldontlie.io/api/v1/stats/?per_page=100&seasons[]=#{season.id}&player_ids[]=#{player.id}&postseason=false"
        )
        response = JSON.parse(request)
        games = response["data"]
        games.each do |game|
            
        end
    end
end

# while counter > 1979 do
#     request = RestClient::Request.execute(
#         method: :get,
#         url: "https://www.balldontlie.io/api/v1/stats/?per_page=100&seasons[]=#{counter}&player_ids[]=#{player_id}&postseason=false" 
#     )
#     response = JSON.parse(request)
#     games = response["data"]
#     games.map do |game|
#         score_total += game["pts"] if game["pts"]
#         rebound_total += game["reb"] if game["reb"]
#         game.team_id 
#     end
#     puts(score_total)
#     puts(rebound_total)
#     counter -= 1
# end
  


    # playerResponce = JSON.parse(response)
    # if playerRespone == []
    #     continue
    # end
    # score_total = score_total + playerResponce.score 
    # counter --
    # break
    # PlayerSeason.Create(
    #     score_total, rebound_total   
    #     )

# end
