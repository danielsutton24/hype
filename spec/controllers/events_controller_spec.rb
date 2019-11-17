require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "events#index" do
    it "should list the events in the database" do
      event1 = FactoryBot.create(:event)
      event2 = FactoryBot.create(:event)
      get :index
      expect(response).to have_http_status :success
      response_value = ActiveSupport::JSON.decode(@response.body)
      expect(response_value.count).to eq(2)
    end
  end

end
