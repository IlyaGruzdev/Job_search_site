require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/}' do
	before { post users_path } 

	it 'returns http success' do
	  expect(response).to have_http_status(:success)
	end

	it 'renders input template' do
	  expect(response).to render_template(:main)
	end
  it 'responds with html' do
    expect(response.content_type).to match(%r{text/html})
  end
	end

end