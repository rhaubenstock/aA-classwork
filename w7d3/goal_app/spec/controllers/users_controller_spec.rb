require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "GET #new" do
        it 'renders new users template successfully' do
            get :new
            expect(response).to be_success
            expect(response).to render_template(:new)
        end
    end

    describe "POST #create" do
        context 'with valid params' do
            let(:user_params) do {
                user: { username: 'Brad', password: 'BradIsRad' }}
            end

            it 'logs in the user' do
                post :create, params: user_params
                user = User.find_by(username: 'Brad')
                expect(session[:session_token]).to eq(user.session_token)
            end

            it "redirects to user's show page" do
                post :create, params: user_params
                user = User.find_by(username: 'Brad')
                expect(response).to redirect_to(user_url(user))
            end
        end

        context 'with invalid params' do
            it 'validates the presence of password and renders the template with errors' do
                post :create, params: { user: { username: 'Brad', password: '' }} 
                expect(response).to render_template(:new)
                expect(flash[:errors]).to be_present
            end

        end
    end

    describe "GET #show" do 
        context "when logged in" do 
        
        end

        context "when logged out" do
        
        end
    end
end
