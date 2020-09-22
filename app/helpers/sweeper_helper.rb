module SweeperHelper
  require 'open-uri'
  require 'json'
  SWEEPER_API = 'https://mine-sweeper-generator.herokuapp.com/solver'.freeze

  def api_retrieval
    json = JSON.parse(URI.open(SWEEPER_API).read)
    sweeper_length_valid?(json) && sweeper_content_valid?(json) ? json : []
  end

  def sweeper_length_valid?(sweeper)
    sweeper.length == sweeper[0].length
  end

  def sweeper_content_valid?(sweeper)
    !sweeper.join('').match(/[^\s\d\+\-|\\*]/)
  end
end
