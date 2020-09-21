require 'rails_helper'
require 'open-uri'

RSpec.describe 'Test suite', type: :request do
  # retrieves JSON from API and converts to array
  SWEEPER_API = 'https://mine-sweeper-generator.herokuapp.com/solver'.freeze

  it 'retrieves valid JSON from API endpoint' do
    json = JSON.parse(URI.open(SWEEPER_API).read)
    expect(json.length).to eql(json[0].length)
  end
  # array is correct and valid
  # create a method that resolves minesweeper
  # send resolved array and original array converted as JSON to Heroku API
end
