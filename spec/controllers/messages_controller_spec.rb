require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }

    before do
      login_user user
    end

  describe 'GET #index'do

    before do
      get :index, params: { group_id: 28 }
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end

  end

end
