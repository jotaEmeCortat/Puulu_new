# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
puts "Destroy participations"
Participation.destroy_all
puts "Destroy users"
User.destroy_all
puts "Destroy games"
Game.destroy_all
puts "Destroy teams"
Team.destroy_all
puts "Destroy players"
Player.destroy_all
puts "Destroy actions"
PlayerAction.destroy_all

puts "Creating users..."
user1 = User.create!({ email: "test@test.com", password: "123456", name: "Cercle des Nageurs de Marseille" })

puts "Creating teams..."
team1 = Team.create!({ name: "Cercle des Nageurs de Marseille", category: "Senior", country: "France", user: user1 })

puts "Creating players..."
player1 = Player.create!({ name: "Clément DUBOIS", nationality: "French", gender: "Male",
                           birthdate: "1995".to_i, position: "GK", handedness: "Right",
                           available: true, team: team1 })

player2 = Player.create!({ name: "Remi SAUDADIER", nationality: "French", gender: "Male",
                            birthdate: "1986", position: "Field Player", handedness: "Right-Handed",
                            available: true, team: team1 })

player3 = Player.create!({ name: "Ugo CROUSILLAT", nationality: "French", gender: "Male",
                           birthdate: "1990", position: "FP", handedness: "Right",
                           available: true, team: team1 })

player4 = Player.create!({ name: "Alexandre BOUET", nationality: "French", gender: "Male",
                           birthdate: "2000", position: "FP", handedness: "Right",
                           available: true, team: team1 })

player5 = Player.create!({ name: "Enzo KHASZ", nationality: "French", gender: "Male",
                           birthdate: "1993", position: "FP", handedness: "Right",
                           available: true, team: team1 })

player6 = Player.create!({ name: "Thomas VERNOUX", nationality: "French", gender: "Male",
                           birthdate: "2002", position: "FP", handedness: "Right",
                           available: true, team: team1 })

player7 = Player.create!({ name: "Duje ZIVKOVIC", nationality: "French", gender: "Male",
                           birthdate: "1990", position: "FP", handedness: "Left",
                           available: true, team: team1 })

player8 = Player.create!({ name: "Emil BJORCH", nationality: "French", gender: "Male",
                           birthdate: "1987", position: "FP", handedness: "Right",
                           available: true, team: team1 })

player9 = Player.create!({ name: "Mehdi MARZOUKI", nationality: "French", gender: "Male",
                           birthdate: "1987", position: "FP", handedness: "Right",
                           available: true, team: team1 })

player10 = Player.create!({ name: "Charles CANNONE", nationality: "French", gender: "Male",
                            birthdate: "1996", position: "FP", handedness: "Left",
                            available: true, team: team1 })

player11 = Player.create!({ name: "Pierre-Frederic VANPEPERSTRAETE", nationality: "French",
                            gender: "Male", birthdate: "1992", position: "FP", handedness: "Right",
                            available: true, team: team1 })

player12 = Player.create!({ name: "Andrea DE NARDI", nationality: "French", gender: "Male",
                            birthdate: "1998", position: "FP", handedness: "Right",
                            available: true, team: team1 })

player13 = Player.create!({ name: "Hugo FONTANI", nationality: "French", gender: "Male",
                            birthdate: "1994", position: "GK", handedness: "Right",
                            available: true, team: team1 })

puts "seed game"
current_game = Game.create!(date: Date.today, tournament: "Tournoi des 6 nations", location: "Paris", round: 1, result: 11, opponent_result: 9, team: team1)

puts 'seed actions'
PlayerAction.create!({ kind: "Starting GK", time: "08:00", game: current_game, player: current_game.team.players.sample })
PlayerAction.create!({ kind: "Starting GK", time: "08:00", game: current_game, player: current_game.opponent_team.players.sample })
PlayerAction.create!({ kind: "Sprint won possession", time: "08:00", game: current_game, player: current_game.team.players.sample })

timings = ["7:38", "7:23", "7:23", "6:59", "6:37", "6:21", "6:02", "5:50", "5:36", "5:28", "5:11", "4:48", "4:43", "4:26", "4:14", "4:01", "3:51", "3:33", "3:18", "2:58", "2:37", "2:17", "1:47", "1:24", "1:06", "0:53", "0:39", "0:19", "0:02"]

timings.each do |time|
  kind   = PlayerAction::TYPE_OF_ACTIONS.sample
  result = PlayerAction::RESULT_PER_KIND[kind].reject { |action| action == "GOAL" }.sample if PlayerAction::RESULT_PER_KIND.key?(kind)

  PlayerAction.create!(
    game:     current_game,
    player:   current_game.players.sample,
    time:     time,
    kind:     kind,
    result:   result,
    position: PlayerAction::POSITIONS.sample
  )
end

11.times do
  PlayerAction.create!(
    game:     current_game,
    player:   current_game.team.players.sample,
    time:     "#{rand(0..7)}:#{rand(0..59)}",
    kind:     "SHOT",
    result:   "GOAL",
    position: PlayerAction::POSITIONS.sample
  )
end

9.times do
  PlayerAction.create!(
    game:     current_game,
    player:   current_game.opponent_team.players.sample,
    time:     "#{rand(0..7)}:#{rand(0..59)}",
    kind:     "SHOT",
    result:   "GOAL",
    position: PlayerAction::POSITIONS.sample
  )
end

puts "DB seeded"
