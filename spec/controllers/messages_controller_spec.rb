require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  before do
    @group = user.groups.first
    login_user user
  end
  let(:params) { { message: attributes_for(:message), group_id: @group.id } }

  describe 'GET #index'do

    before do
      get :index, params: params
    end

    it "assigns the requested message to @message" do
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end

  end

  describe 'POST #create' do
    context '
with valid parameters' do
      it "can be saved" do
      expect{
        post :create, params: params
        }.to change{ Message.count }.by(1)
      end
      it 'redirects to group_messages_path' do
        post :create, params: params
        expect(response).to redirect_to group_messages_path(group_id: @group.id)
      end
    end

    context 'with invalid parameters' do
      let(:params) { { message: attributes_for(:message, body: ""), group_id: @group.id } }
      it 'cannnot be saved' do
        expect{
        post :create, params: params
        }.not_to change{ Message.count }
      end
      it 'renders the :index template' do
        post :create, params: params
        expect(response).to render_template :index
      end
    end

  end

end
