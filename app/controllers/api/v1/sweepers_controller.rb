class Api::V1::SweepersController < Api::V1::BaseController
  require 'open-uri'
  require 'json'
  SWEEPER_API = 'https://mine-sweeper-generator.herokuapp.com/solver'.freeze

  def index
    @problem = JSON.parse(URI.open(SWEEPER_API).read)
  end
end
