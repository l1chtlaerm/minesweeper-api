require 'rails_helper'
require 'open-uri'

RSpec.describe 'Test suite', type: :request do

  # retrieves JSON from API and converts to a valid array
  SWEEPER_API = 'https://mine-sweeper-generator.herokuapp.com/solver'.freeze
  json = JSON.parse(URI.open(SWEEPER_API).read)

  problem = [['+', '-', '-', '-', '-', '-', '+'],
             ['|', '*', '*', '*', '*', '*', '|'],
             ['|', '*', ' ', '*', '*', ' ', '|'],
             ['|', ' ', ' ', ' ', '*', ' ', '|'],
             ['|', '*', ' ', '*', '*', '*', '|'],
             ['|', '*', '*', '*', ' ', ' ', '|'],
             ['+', '-', '-', '-', '-', '-', '+']]
  solution = [['+', '-', '-', '-', '-', '-', '+'],
              ['|', '*', '*', '*', '*', '*', '|'],
              ['|', '*', '5', '*', '*', '4', '|'],
              ['|', '2', '4', '5', '*', '4', '|'],
              ['|', '*', '5', '*', '*', '*', '|'],
              ['|', '*', '*', '*', '4', '2', '|'],
              ['+', '-', '-', '-', '-', '-', '+']]

  it 'retrieves valid minesweeper matrix from API endpoint' do
    expect(json.length).to eql(json[0].length)
  end

  it 'verifies minesweeper does not have invalid chars' do
    expect(json.join('')).not_to match(/[^\s\d\+\-|\\*]/)
  end

  # create a controller method that resolves minesweeper
  it 'resolves minesweeper successfully and sends to API URL' do
  end
  # send solved array and original array converted as JSON to Heroku API
end
