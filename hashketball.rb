# Write your code here!
def game_hash
  hash = {
    home:{
      team_name:"Brooklyn Nets",
      colors:["Black", "White"],
      players:{
        "Alan Anderson" => {
          number:0,
          shoe:16,
          points:22,
          rebounds:12,
          assists:12,
          steals:3,
          blocks:1,
          slam_dunks:1
        },
        "Reggie Evans" => {
          number:30,
          shoe:14,
          points:12,
          rebounds:12,
          assists:12,
          steals:12,
          blocks:12,
          slam_dunks:7
        },
        "Brook Lopez" => {
          number:11,
          shoe:17,
          points:17,
          rebounds:19,
          assists:10,
          steals:3,
          blocks:1,
          slam_dunks:15
        },
        "Mason Plumlee" => {
          number:1,
          shoe:19,
          points:26,
          rebounds:12,
          assists:6,
          steals:3,
          blocks:8,
          slam_dunks:5
        },
        "Jason Terry" => {
          number:31,
          shoe:15,
          points:19,
          rebounds:2,
          assists:2,
          steals:4,
          blocks:11,
          slam_dunks:1
        }
      }
    },
    away:{
      team_name:"Charlotte Hornets",
      colors:["Turquoise","Purple"],
      players:{
        "Jeff Adrien" => {
          number:4,
          shoe:18,
          points:10,
          rebounds:1,
          assists:1,
          steals:2,
          blocks:7,
          slam_dunks:2
        },
        "Bismak Biyombo" => {
          number:0,
          shoe:16,
          points:12,
          rebounds:4,
          assists:7,
          steals:7,
          blocks:15,
          slam_dunks:10
        },
        "DeSagna Diop" => {
          number:2,
          shoe:14,
          points:24,
          rebounds:12,
          assists:12,
          steals:4,
          blocks:5,
          slam_dunks:5
        },
        "Ben Gordon" => {
          number:8,
          shoe:15,
          points:33,
          rebounds:3,
          assists:2,
          steals:1,
          blocks:1,
          slam_dunks:0
        },
        "Brendan Haywood" => {
          number:33,
          shoe:15,
          points:6,
          rebounds:12,
          assists:12,
          steals:22,
          blocks:5,
          slam_dunks:12
        }
      }
    }
  }
end

def num_points_scored(player)
  game_hash.each do |location, info|
    return info[:players][player][:points] if info[:players].has_key?(player)
  end
end

def shoe_size(player)
  game_hash.each do |location, info|
    return info[:players][player][:shoe] if info[:players].has_key?(player)
  end
end

def team_colors(team_name)
  game_hash.each do |location, info|
    return info[:colors] if info[:team_name] == team_name
  end
end

def team_names
  game_hash.collect {|location, info| info[:team_name]}
end

def player_numbers(team_name)
  num_array = []
  game_hash.each do |location, info|
    if info[:team_name] == team_name
      info[:players].each {|name, stat| num_array.push(info[:players][name][:number])}
    end
  end
  num_array
end

def player_stats(player_name)
  game_hash.each do |location, info|
    return info[:players][player_name] if info[:players].has_key?(player_name)
  end
end

def big_shoe_rebounds
  shoe = 0
  game_hash.each do |location, info|
    info[:players].each {|name, stat| shoe = stat[:shoe] if shoe < stat[:shoe]}
  end
  game_hash.each do |location, info|
    info[:players].each {|name, stat| return stat[:rebounds] if shoe == stat[:shoe]}
  end
end

def most_points_scored
  points = 0
  game_hash.each do |location, info|
    info[:players].each {|name, stat| points = stat[:points] if points < stat[:points]}
  end
  game_hash.each do |location, info|
    info[:players].each {|name, stat| return name if points == stat[:points]}
  end
end

def winning_team
  home = 0
  away = 0
  game_hash[:home][:players].each {|name, stat| home += stat[:points]}
  game_hash[:away][:players].each {|name, stat| away += stat[:points]}
  if home > away
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  name_length = 0
  game_hash.each do |location, info|
    info[:players].each_key {|name| name_length = name.length if name_length < name.length}
  end
  game_hash.each do |location, info|
    info[:players].each_key {|name| return name if name.length == name_length}
  end
end

def long_name_steals_a_ton?
  steals = 0
  game_hash.each do |location, info|
    info[:players].each {|name, stat| steals = stat[:steals] if steals < stat[:steals]}
  end
  game_hash.each do |location, info|
    if info[:players].has_key?(player_with_longest_name)
      if info[:players][player_with_longest_name][:steals] == steals
        return true
      else
        return false
      end
    end
  end
end
