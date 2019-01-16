require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:user) { FactoryBot.create(:user).save }
  let(:movie) { FactoryBot.create(:movie) }
  let(:likes) { movie.likes.find_by(user: user.id)}

  describe "POST #create" do
    context "when user is sign in" do
      before { sign_in(user) }

      it "creates like" do
        expect do
          post :create, movie.likes
        end.to change(Like, :count).by(1)
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when user already creates link" do
      let(:like) { Likes.create!(user: user, movie_id: movie.id) }

      it "doesn't allow to create another one" do
        expect do
          post :create, params: { user_id: user.id, movie_id: movie.id }
        end.to_not change(Like, :count)
      end
    end
    context "when user is not sign in" do
      it "doesn't create like" do
        expect do
          post :create, params: { user_id: user }, movie: movie.id
        end.to_not change(Like, :count)
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes comment" do
      expect do
        delete :destroy, params: { id: user.id }, movie_id: movie.id
      end.to change(Like, :count).by(-1)
      expect(response).to have_http_status(:redirect)
    end
  end
end
