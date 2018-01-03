require 'rails_helper'
RSpec.describe 'Restaurant', type: :request do
    before do
        @restaurant1 = Restaurant.create(
          name: 'Nando',
          description: Faker::Lorem.paragraph(2, false, 4),
          address1: '5 Lomdon Close',
          address2: 'Sparclls',
          city: 'Swindon',
          county: 'Wiltshire',
          postcode: 'SN6 5FF'
        )
    end
    describe 'GET /restaurants/:id' do
        context 'with existing restaurant' do
            before { get "/restaurants/#{@restaurant1.id}" }
            it 'handles existing restaurant' do
                expect(response.status).to eq 200
            end
        end
        context 'with non-existing restaurant' do
            before { get '/restaurants/xxxxx' }
            it 'handles non-existing restaurant' do
                expect(response.status).to eq 302
                flash_message = 'The restaurant you are looking for could not be found'
                expect(flash[:warning]).to eq flash_message
            end
        end
    end
end
