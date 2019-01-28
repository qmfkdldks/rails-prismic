# Here we should test integration specs. We should evaluate whether the third party api is responding well.

require 'rails_helper'

RSpec.describe Prismic::API, type: :request do
  let(:service) { Prismic::API.new }
end
