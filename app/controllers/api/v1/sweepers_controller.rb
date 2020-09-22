class Api::V1::SweepersController < Api::V1::BaseController
  include SweeperHelper
  def index
    @problem = api_retrieval
  end
end
