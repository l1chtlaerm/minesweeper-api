module SweeperHelper
  require 'open-uri'
  require 'json'
  SWEEPER_API = 'https://mine-sweeper-generator.herokuapp.com/solver'.freeze

  def api_retrieval
    JSON.parse(URI.open(SWEEPER_API).read)
  end
end
