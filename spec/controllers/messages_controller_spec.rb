require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index'do

    before do
      login_user user
    end

    it "renders the :index template" do
      get :index, {group_id: 28}
      expect(response).to render_template :index
    end

  end

end
