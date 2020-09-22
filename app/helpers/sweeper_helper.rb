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
    sweeper.length == sweeper[0].length
  end

  def sweeper_content_valid?(sweeper)
    !sweeper.join('').match(/[^\s\d\+\-|\\*]/)
  end

  # def solver(array)
  #   return [] if array.nil?

  #   response = array.map.with_index do |line, index_superior|
  #     line.map.with_index do |field, index_inferior|
  #       if field == ' '
  #         counter = 0
  #         array[index_superior - 1][index_inferior - 1] == '*' ? counter += 1 : counter
  #         array[index_superior - 1][index_inferior] == '*' ? counter += 1 : counter
  #         array[index_superior - 1][index_inferior + 1] == '*' ? counter += 1 : counter
  #         array[index_superior][index_inferior - 1] == '*' ? counter += 1 : counter
  #         array[index_superior][index_inferior + 1] == '*' ? counter += 1 : counter
  #         array[index_superior + 1][index_inferior - 1] == '*' ? counter += 1 : counter
  #         array[index_superior + 1][index_inferior] == '*' ? counter += 1 : counter
  #         array[index_superior + 1][index_inferior + 1] == '*' ? counter += 1 : counter
  #         field = counter.to_s
  #       end
  #       field
  #     end
  #   end
  #   response
  # end

  def solver(array)
    return [] if array.nil?

    array.map.with_index do |line, s|
      line.map.with_index do |field, i|
        if field == ' '
          c = 0
          [-1, 0, 1].product([-1, 0, 1]).each do |coordinate|
            array[s + coordinate[0]][i + coordinate[1]] == '*' ? c += 1 : c
          end
          field = c.to_s
        end
        field
      end
    end
  end
end
