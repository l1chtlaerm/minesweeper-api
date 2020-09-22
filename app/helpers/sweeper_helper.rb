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

    response = array.map.with_index do |line, index_superior|
      line.map.with_index do |field, index_inferior|
        if field == ' '
          counter = 0
          coordinate_array = [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [1, -1], [-1, 1], [-1, -1]]
          coordinate_array.each do |coordinate|
            array[index_superior + coordinate[0]][index_inferior + coordinate[1]] == '*' ? counter += 1 : counter
          end
          field = counter.to_s
        end
        field
      end
    end
    response
  end
end
