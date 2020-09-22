require 'rails_helper'
require 'open-uri'

RSpec.describe 'Test suite', type: :request do
  include SweeperHelper
  # retrieves JSON from API and converts to a valid array
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
    json = api_retrieval
    expect(json.length).to eql(json[0].length)
  end

  it 'verifies minesweeper does not have invalid chars' do
    json = api_retrieval
    expect(json.join('')).not_to match(/[^\s\d\+\-|\\*]/)
  end

  # posts API to rails server
  it 'sends unsolved minesweeper to API URL' do
    get('/api/v1/sweepers')
    local_json = JSON.parse(response.body)
    expect(local_json['problem'].length).to eql(local_json['problem'][0].length)
  end
  # create a controller method that resolves minesweeper
  # send solved array and original array converted as JSON to Heroku API
end
