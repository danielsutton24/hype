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




  describe "events#update" do
    it "should allow events to be marked as done" do
      event = FactoryBot.create(:event, done: false)
      put :update, params: {id: event.id, event: { done: true }}
      expect(response).to have_http_status(:success)
      event.reload
      expect(event.done).to eq(true)
    end
  end


end
