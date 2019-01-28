require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "#index" do
    it "should render index" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#show" do
    it "should render show" do
      params = { type: "image-post", id: "ruby-on-rails-rspec-cuales-son-los-tengo-que-testear" }
      get :show, params: params
      expect(response.status).to eq(200)
    end

    context "when id is invalid or empty" do
      it "should respond with a 404" do
        params = { type: "image-post", id: "not exist" }
        # expect(response.status).to eq(404)
        expect { get :show, params: params }.to raise_error(ActionController::RoutingError)
      end
    end
  end
end
