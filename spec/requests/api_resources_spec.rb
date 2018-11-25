require 'rails_helper'

RSpec.describe "ApiResources", type: :request do
  def parsed_body
    JSON.parse(response.body)
  end

  describe "API to relational database works for cities" do

    it "city has name property" do
      city_1 = City.new
      expect(city_1.has_attribute?(:name)).to eq(true)
    end

    it "resource accessible via '/api/cities'" do
      expect(cities_path).to eq("/api/cities")
    end

    it "cities must be backed by a RDBMS using ActiveRecord" do
      city_2 = City.create(:name => 'chicago')
      get city_path(city_2.id)
      expect(response).to have_http_status(:ok)
      expect(parsed_body["name"]).to eq('chicago')
    end
    
    it "resource contains a city called Baltimore" do
      expect(City.where(name: 'Baltimore').first).not_to be_nil
    end
  end
end
