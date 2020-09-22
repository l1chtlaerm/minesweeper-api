# frozen_string_literal: false

# SweeperHelper module - to keep methods outside of the controller and easier
# testing.
module SweeperHelper
  require 'open-uri'
  require 'json'
  SWEEPER_API = 'https://mine-sweeper-generator.herokuapp.com/solver'.freeze

  def api_retrieval
    json = JSON.parse(URI.open(SWEEPER_API).read)
    return [] if json.nil?

    sweeper_length_valid?(json) && sweeper_content_valid?(json) ? json : []
  end

  def sweeper_length_valid?(sweeper)
    return false if sweeper.map(&:length).uniq.length != 1

    sweeper.length == sweeper[0].length
  end

  def sweeper_content_valid?(sweeper)
    !sweeper.join('').match(/[^\s\d\+\-|\\*]/)
  end

  def solver(array)
    array.map.with_index do |line, superior|
      line.map.with_index do |field, inferior|
        field == ' ' ? counter = mine_counter(superior, inferior, array) : field
        field.match(/[\+\-|\\*]/) ? field : counter.to_s
      end
    end
  end

  # Separated method to reduce solver complexity, to DRY and to be more explicit
  # with variable names (80 character length rubocop limit)
  def mine_counter(superior, inferior, array)
    counter = 0
    [-1, 0, 1].product([-1, 0, 1]).each do |x|
      array[superior + x[0]][inferior + x[1]] == '*' ? counter += 1 : counter
    end
    counter
  end
end
