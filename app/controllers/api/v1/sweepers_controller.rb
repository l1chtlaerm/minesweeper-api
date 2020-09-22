# frozen_string_literal: false

# SweepersController class - for Sweeper API. Used a nested API/V1 folder
# format in case future deployments would be needed under new V numbers.
class Api::V1::SweepersController < Api::V1::BaseController
  include SweeperHelper
  def index
    @problem = api_retrieval
  end
end
