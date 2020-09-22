# frozen_string_literal: false

require 'rails_helper'

RSpec.describe 'Request suite', type: :request do
  include SweeperHelper

  # retrieves JSON from API and converts to a valid array
  it 'Retrieves valid minesweeper matrix size from API endpoint' do
    expect(sweeper_length_valid?(api_retrieval)).to eql(true)
  end
  it 'Verifies minesweeper does not have invalid chars' do
    expect(sweeper_content_valid?(api_retrieval)).to eql(true)
  end

  # Posts API to rails server
  it 'Sends unsolved minesweeper to API URL' do
    get('/api/v1/sweepers')
    local_json = JSON.parse(response.body)
    expect(sweeper_length_valid?(local_json['problem'])).to eql(true)
  end

  # Send solved array and original array converted as JSON to Heroku API and
  it 'Send minesweepers to Heroku root URL and checks that they are correct' do
    get('/')
    local_json = JSON.parse(response.body)
    expect(solver(local_json['problem'])).to eql(local_json['solution'])
  end
end

RSpec.describe 'Helper suite' do
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
  invalid = [['+', '-', '+'], ['a']]

  it 'Solver returns a valid minesweeper' do
    expect(sweeper_length_valid?(solver(problem))).to eql(true)
    expect(sweeper_content_valid?(solver(problem))).to eql(true)
  end
  it 'Solver rejects an invalid sweeper size' do
    expect(sweeper_length_valid?(solver(invalid))).to eql(false)
  end
  it 'Solver resolves the minesweeper' do
    expect(solver(problem)).to eql(solution)
  end
end
