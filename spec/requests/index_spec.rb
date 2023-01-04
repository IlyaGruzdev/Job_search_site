require 'rails_helper'

RSpec.describe 'index', type: :request do
  # Тестируем корневой маршрут
  describe 'GET /' do
	before { get root_path } # перед каждым тестом делать запрос

	it 'returns http success' do
	  expect(response).to have_http_status(:success)
	end

	it 'renders input template' do
	  expect(response).to render_template(:main)
	end
end

end