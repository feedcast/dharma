require "spec_helper"

RSpec.describe "Dharma API" do
  include Rack::Test::Methods

  let(:app) { Dharma::API }

  before do
    # Ensure the redis instance is clean
    Split.redis.flushall
  end

  describe "GET /api/experiments" do
    context "when the params are valid" do
      let(:colors) { ["yellow", "purple", "blue", "red"] }
      let(:alternative) { JSON.parse(last_response.body)["alternative"]  }

      before do
        get "/experiments", experiment: "foo", control: colors.first, alternatives: colors, identifier: "a23"
      end

      it "has application/json as a content type" do
        expect(last_response.header["Content-Type"]).to eq("application/json")
      end

      it "returns 200" do
        expect(last_response).to be_ok
      end

      it "returns one of the alternatives " do
        expect(colors).to include(alternative)
      end
    end
  end

  describe "PUT /api/experiments" do
    context "when the params are valid" do
      before do
        put "/experiments", experiment: "foo", identifier: "a23"
      end

      it "returns with status no content" do
        expect(last_response.status).to eq(204)
      end

      it "returns with an empty body" do
        expect(last_response.body).to be_empty
      end
    end
  end
end
