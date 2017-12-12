require 'pry'

def game_hash
  {home: {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {
      "Alan Anderson" => {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },
      "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      },
      "Brook Lopez" => {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },
      "Mason Plumlee" => {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      },
      "Jason Terry" => {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
      },
    }
  },
  away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: {
      "Jeff Adrien" => {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      },
      "Bismak Biyombo" => {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10
      },
      "DeSagna Diop" => {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      },
      "Ben Gordon" => {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      },
      "Brendan Haywood" => {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 22,
        blocks: 5,
        slam_dunks: 12
      },
    }
  },
}
end

#intentionally used basic mathods

def players #helper method
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def num_points_scored(player)
  players.each do |name, stats| #players.fetch(player)[:points] is more efficient
    return stats[:points] if name == player
  end
end


def shoe_size(player)
  players.each do |name, stats| #players.fetch(player)[:shoe] is more efficient
    return stats[:shoe] if name == player
  end
end



def team_colors(team)
  game_hash.each do |side, categories|
    return categories[:colors] if categories[:team_name] == team
  end
end

def team_names
  game_hash.map do |side, categories|
    categories[:team_name]
  end
end

def player_numbers(tname)
  jersey = []
  game_hash.map do |team, categories|
    categories[:players].map do |name, stats|
      if categories[:team_name] == tname
        jersey << stats[:number]
      end
    end
  end
  jersey
end

def player_stats(player)
  players.each do |name, stats| #players.fetch(player) is more efficient
    return stats if name == player
  end
end

def big_shoe_rebounds
  players.map{|name, stats| stats}.sort_by{|hash| hash[:shoe]}.last[:rebounds]
end

def most_points_scored
  players.sort_by{|player, value| value[:points]}.last[0]
end

def winning_team
  home_pts = game_hash[:home][:players].map {|name, stats| stats[:points]}.inject(:+)
  away_pts = game_hash[:away][:players].map {|name, stats| stats[:points]}.inject(:+)
  if home_pts >= away_pts
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  players.keys.sort_by{|name| name.length}.last
end

def long_name_steals_a_ton?
  most_steals = players.sort_by{|names, stats| stats[:steals]}.last[0]
  true if player_with_longest_name == most_steals
end
