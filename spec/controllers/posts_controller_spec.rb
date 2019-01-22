require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "#index" do
    it "should respond" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "#show" do
    it "should render show and respond with a 200" do
      params = { id: "ruby-on-rails-rspec-cuales-son-los-tengo-que-testear" }
      get :show, params: params
      expect(response).to render_template("show")
      expect(response.status).to eq(200)
    end

    context "when id is invalid or empty" do
      it "should respond with a 404"
    end
  end
end
