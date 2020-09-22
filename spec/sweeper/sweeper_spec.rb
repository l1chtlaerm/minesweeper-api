require 'rails_helper'
require 'open-uri'

RSpec.describe 'Test suite', type: :request do
  include SweeperHelper

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

  # retrieves JSON from API and converts to a valid array
  it 'retrieves valid minesweeper matrix size from API endpoint' do
    expect(sweeper_length_valid?(api_retrieval)).to eql(true)
  end
  it 'verifies minesweeper does not have invalid chars' do
    expect(sweeper_content_valid?(api_retrieval)).to eql(true)
  end

  # posts API to rails server
  it 'sends unsolved minesweeper to API URL' do
    get('/api/v1/sweepers')
    local_json = JSON.parse(response.body)
    expect(sweeper_length_valid?(local_json['problem'])).to eql(true)
  end

  # create a controller method that resolves minesweeper
  it 'solves a valid minesweeper' do
    expect(solver(problem)).to eql(solution)
  end

  # send solved array and original array converted as JSON to Heroku API
end
