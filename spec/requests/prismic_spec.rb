# Here we should test integration specs. We should evaluate whether the third party api is responding well.

require 'rails_helper'

RSpec.describe PrismicService, type: :request do
  let(:service) { PrismicService.new }

  describe "#all" do
    it "should return all documents"  do
      documents = service.all
      expect(documents.size).to be > 0
    end
  end

  describe "#query" do
    it "should return response obj" do
      # params: function, path, value
      response = service.query(:at, "my.image-post.uid", "software-pruebas-prueba-matematica-prueba-cientifica")
      expect(response.results.size).to be > 0
    end
  end

end
