def game_hash
  # * The top level of the hash has two keys: `:home`, for the home team, and `:away`, for the away team.
  # * The values of the `:home` and `:away` keys are hashes. These hashes have the following keys:
  #   * `:team_name`
  #   * `:colors`
  #   * `:players`
  # * The `:team_name` key points to a string of the team name.
  # * The `:colors` key points to an array of strings that are that team's colors.
  # * The `:players` key points to a hash of players whose names (as strings) are the keys to a hash containing their stats.
  #  The values for each player's names and their stats can be found in the table below. The stats keys should be formatted like this:
  #     * `:number`
  #     * `:shoe`
  #     * `:points`
  #     * `:rebounds`
  #     * `:assists`
  #     * `:steals`
  #     * `:blocks`
  #     * `:slam_dunks`
game_hash = {
  :home => {
    :team_name => "",
    :colors => [],
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
    :team_name => "",
    :colors => [],
    :players =>  {
      "Alan Anderson" => {
        :number => ,
        :shoe => ,
        :points => ,
        :rebounds => ,
        :assists => ,
        :steals => ,
        :blocks => ,
        :slam_dunks =>
      },
      "Reggie Evans" => {
        :number => ,
        :shoe => ,
        :points => ,
        :rebounds => ,
        :assists => ,
        :steals => ,
        :blocks => ,
        :slam_dunks =>
      },
      "Brook Lopez" => {
        :number => ,
        :shoe => ,
        :points => ,
        :rebounds => ,
        :assists => ,
        :steals => ,
        :blocks => ,
        :slam_dunks =>
      },
      "Mason Plumlee" => {
        :number => ,
        :shoe => ,
        :points => ,
        :rebounds => ,
        :assists => ,
        :steals => ,
        :blocks => ,
        :slam_dunks =>
      },
      "Jason Terry" => {
        :number => ,
        :shoe => ,
        :points => ,
        :rebounds => ,
        :assists => ,
        :steals => ,
        :blocks => ,
        :slam_dunks =>
      }
    }
  }


}
