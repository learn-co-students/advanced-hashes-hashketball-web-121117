require 'pry'

def game_hash
{
 :home =>
   {:team_name => "Brooklyn Nets",
     :colors => ["Black", "White"],
     :players =>{
     "Alan Anderson" =>
       {:number => 0,
         :shoe => 16,
         :points => 22,
         :rebounds => 12,
         :assists => 12,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 1 },
     "Reggie Evans" =>
       {:number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
       :slam_dunks => 7 },
   "Brook Lopez" =>
     {:number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
     :slam_dunks => 15 },
   "Mason Plumlee" =>
     {:number => 1,
     :shoe => 19,
     :points => 26,
     :rebounds => 12,
     :assists => 6,
     :steals => 3,
     :blocks => 8,
     :slam_dunks => 5 },
 "Jason Terry" =>
   {:number => 31,
   :shoe => 15,
   :points => 19,
   :rebounds => 2,
   :assists => 2,
   :steals => 4,
   :blocks => 11,
   :slam_dunks => 1}
 } # closeshome players
 }, #closes home team
  :away =>
  {:team_name => "Charlotte Hornets",
   :colors => ["Turquoise", "Purple"],
   :players => {
   "Jeff Adrien" =>
       {:number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
       :slam_dunks => 2 },
   "Bismak Biyombo" =>
      {:number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10 },
    "DeSagna Diop" =>
       {:number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
       :slam_dunks => 5 },
    "Ben Gordon" =>
       {:number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
       :slam_dunks => 0 },
    "Brendan Haywood" =>
       {:number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12}
   }# players hash
  }# team name info
}#closes whole hash
end

# def find_player(player_name)
# players = game_hash[:home][:players] + game_hash[:away][:players]
# players.find { |player| player[:player_name] == player_name }
# end

def num_points_scored(player_name)
  results = nil
    game_hash.each do | k, v |
      if v[:players].has_key?(player_name)
      results = v[:players][player_name][:points]
      end
    end
    return results
end

def shoe_size(player_name)
results = nil
  game_hash.each do | k, v |
    if v[:players].has_key?(player_name)
    results = v[:players][player_name][:shoe]
    end
  end
  return results
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
  end
 end
end

def team_names
a = []
game_hash.each do |location, team_data|
  a << team_data[:team_name]
end
a
end

def player_numbers(team_name)
results = []
game_hash.each do |location, team_data|
  team_data[:players].each do |name, stats|
    if team_data[:team_name] == team_name
  results << team_data[:players][name][:number]
end
end
end
results
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
  stats = team_data[:players][player_name]
  if stats
    return stats
end
  end
end

def big_shoe_rebounds
big_shoe_size = 0
big_shoe_rebounds = nil
game_hash.each do |location, team_data|
  team_data[:players].each do |name, stats|
    if shoe_size(name) > big_shoe_size
    big_shoe_rebounds = stats[:rebounds]
    end
  end
end
big_shoe_rebounds
end

# 1. Write a method that returns true if the player with the longest name had the most steals. Call the method `long_name_steals_a_ton?`.

def most_points_scored
best_player = ""
points = 0
game_hash.each do |location, team_data|
  team_data[:players].each do |name, stats|
    if stats[:points] > points
      points = stats[:points]
      best_player= name
    end
  end
end
best_player
end

def winning_team
home_score = 0
away_score = 0
game_hash[:home][:players].each do |k, v|
    home_score += v[:points]
end
game_hash[:away][:players].each do |k, v|
    away_score += v[:points]
end
if home_score > away_score
  game_hash[:home][:team_name]
else
    game_hash[:away][:team_name]
end
end

def player_with_longest_name
longest_name = ""
game_hash.each do |location, team_data|
  team_data[:players].each do |name, stats|
      if name.length > longest_name.length
        longest_name = name
      end
  end
end
longest_name
end

def long_name_steals_a_ton?
longest_name = ""
most_steal = 0
game_hash.each do |location, team_data|
  team_data[:players].each do |name, stats|
      if name.length > longest_name.length
        longest_name = name
        most_steal= stats[:steals]
      end
      if stats[:steals] > most_steal
        return false
      else
        return true
      end
  end
end
end
