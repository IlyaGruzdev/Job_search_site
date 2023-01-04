require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  describe 'GET /show' do
    before { get tasks_show_path }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders input template' do
      expect(response).to render_template(:show)
    end

    it 'responds with html' do
      expect(response.content_type).to match(%r{text/html})
    end
  end
    context 'when params are valid' do
      let(:val1) { Faker::String.random }
      before { post tasks_show_path, params: {value: val1} }     
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
      it 'renders tasks templates' do
        expect(response).to render_template(:_title)
        expect(response).to render_template(:_registration_form)
        expect(response).to render_template(:_login_form)
        expect(response).to render_template(:show)
        
      end
    end
      context 'when params are invalid' do
        let(:val2) { nil }
        before { post tasks_show_path, params: {value: val2} }     
        it 'returns http success' do
          expect(response).to have_http_status(:success)
        end
        it 'renders tasks templates' do
          expect(response).to render_template(:_title)
          expect(response).to render_template(:_registration_form)
          expect(response).to render_template(:_login_form)
          expect(response).to render_template(:show)
          
        end
  end
end