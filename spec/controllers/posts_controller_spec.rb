require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "#index" do
    it "should respond" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "#show" do
    it "should render show" do
      params = { :id => "ruby-on-rails-rspec-cuales-son-los-tengo-que-testear" }
      get :show, params
      expect(response).to render_template("show")
    end
  end
end
