require 'rails_helper'

RSpec.describe 'SplashsScreen', type: :request do
  describe 'GET /' do
    before(:example) { get splash_screen_index_path }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'should respond with body text' do
      expect(response.body).to include('E.tracker')
    end

    it 'Should return response body text' do
      expect(response.body).to include('Login')
      expect(response.body).to include('Sign up')
    end
  end
end
