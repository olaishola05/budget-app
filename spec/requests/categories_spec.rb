require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories' do
    context 'Category index' do
      before(:example) { get categories_path }
    end

    # it 'Category success' do
    #     expect(response).to have_http_status(200)
    # end
  end
end
