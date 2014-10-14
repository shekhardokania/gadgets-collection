require 'rails_helper'

RSpec.describe GadgetsController, :type => :controller do
  before do
    @user = User.create(:email => "test@test.com",:name => "test")
    sign_in :user, @user
  end

  describe 'GET index' do
    context 'without serach' do
      before do
        @gadget = Gadget.create(name: "test_g",description: "test d",user: @user)
        get :index
      end

      it 'returns http success' do
        expect(response).to be_success
      end
      it 'renders the index template' do
        expect(response).to render_template('index')
      end
      it 'assigns gadgets to the view' do
        expect(assigns(:gadgets)).to eq([@gadget])
      end
    end

    context 'with serach' do
      before do
        @gadget = Gadget.create(name: "test_2",description: "test 2",user: @user)
        Gadget.create(name: "test_3",description: "test 3",user: @user)

        get :index, search: 'test'
      end
    end
  end
end
