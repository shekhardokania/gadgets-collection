require 'rails_helper'

RSpec.describe HomeController, :type => :controller do
  describe 'default route' do
    it ' defaults to home#index' do
      expect(get: '/').to route_to(controller: 'home', action: 'index')
    end
  end

  describe 'GET index' do
    before { get :index }

    it 'http success' do
      expect(response).to be_success
    end
    it 'renders index template' do
      expect(response).to render_template('index')
    end
  end

end
