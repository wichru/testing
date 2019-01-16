require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  describe "POST #create" do
    let(:user) { FactoryBot.create(:user) }
    let(:movie) { FactoryBot.create(:movie) }
    context "when user is sign in" do
      before { sign_in(user) }

      it "creates like and redirect" do
        expect do
          post :create, params: { user_id: user.id, movie_id: movie.id }
        end.to change(Like, :count).by(1)
        expect(response).to have_http_status(:redirect)
      end

      describe "DELETE #destroy" do
        let(:like) { Like.create!(user_id: user.id, movie: movie) }
        before { like }

        it "deletes like" do
          expect do
            delete :destroy, params: { id: like.id, movie_id: movie.id }
          end.to change(Like, :count).by(-1)
        end
      end
    end

    context "when user is not sign in" do
      it "doesn't create like" do
        expect do
          post :create, params: { user_id: user.id, movie_id: movie.id }
        end.to_not change(Like, :count)
      end
    end
  end

end
