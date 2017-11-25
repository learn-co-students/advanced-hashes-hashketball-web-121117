require 'pry'

def game_hash

game_hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players =>  {
      "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks =>1
      }
    }
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players =>  {
      "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
      }
    }
  }
}
end

def num_points_scored(name)

  game_hash.each do |location, team_information|
    # location = home, information = team name, colors, players hash
    team_information.each do |data, stats|
      if data == :players
        # data = players field, stats = player names
        stats.each do |player_name, player_info|
          # player_name = actual player name, player_info = contained fields for
            if player_name == name
              player_info.each do |p_info_field, points|
                if p_info_field == :points
                  return points
                end
              end
            end
          end
        end
      end
    end
end
def shoe_size(name)

  game_hash.each do |location, team_information|
    # location = home, information = team name, colors, players hash
    team_information.each do |data, stats|
      if data == :players
        # data = players field, stats = player names
        stats.each do |player_name, player_info|
          # player_name = actual player name, player_info = contained fields for
            if player_name == name
              player_info.each do |p_info_field, points|
                if p_info_field == :shoe
                  return points
                end
              end
            end
          end
        end
      end
    end
end

def team_colors(team_name)
  if team_name == "Brooklyn Nets"
    return game_hash[:home][:colors]
  else
    return game_hash[:away][:colors]
  end

end

def team_names
  team_name_array = []
  game_hash.each do |home_away, team_info|
    team_name_array.push(game_hash[home_away][:team_name])
  end
  return team_name_array
end


def player_numbers(team)
  player_number_array = []
  game_hash.each do |home_away, team_info|
    # game_hash[home_away][team_info][:team_name]
    if team_info[:team_name] == team
    # puts team_info[:team_name]
    # puts team
    # player_number_array<< team_info[:players]
    team_info[:players].each do |player_name, player_stats|
      player_number_array<< player_stats[:number]
      # player_number_array.push(game_hash[home_away][team_info][player_name][:number])
    end
  end
end
    return player_number_array

end

# def player_stats(player)
#   player_stats_array = []
#   game_hash.each do |home_away, team_info|
#     team_info[:players].each do |player_name, player_stats|
#       if player_stats == player
#         player_stats_array<< player_stats
#       end
#     end
#   end
# end

def player_stats(player)
  player_stats_array = []
  game_hash.each do |home_away, team_info|
    team_info[:players].each do |player_name, player_stats|
      # puts player_stats
      if player_name == player
        player_stats_array<< player_stats
      end
    end
  end
  return player_stats_array[0]
end

# def big_shoe_rebounds
#   shoe_size_array = []
#   max_shoe = game_hash.each do |home_away, team_info|
#     team_info[:players].each do |player_name, player_stats|
#       shoe_size_array<< player_stats[:shoe]
#       end
#     end
#       return shoe_size_array
# end
def big_shoe_rebounds
  shoe_size_array = []
  max_shoe = game_hash.each do |home_away, team_info|
    team_info[:players].each do |player_name, player_stats|
      shoe_size_array<< player_stats[:shoe]
      end
    end
      # return shoe_size_array
      max_shoe_size = shoe_size_array.sort[-1]
  game_hash.each do |home_away, team_info|
    team_info[:players].each do |player_name, player_stats|
      if player_stats[:shoe] == max_shoe_size
        return player_stats[:rebounds]
      end
    end
  end
      # return max_shoe_size
end
