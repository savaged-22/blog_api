require "rails_helper"
#require "byebug"

RSpec.describe "Posts with authetication", type: :request do
    let!(:user) {create(:user)}
    let!(:other_user) {create(:user)}
    let!(:user_post) {create(:post, user_id: user.id)}
    let!(:other_user_post) {create(:post, user_id: other_user.id)}
    let!(:other_user_post_draft) {create(:post, user_id: other_user.id)}
    let!(:auth_headers) {{'Authorization'=> "Bearer #{user.auth_token}"}}
    let!(:other_auth_headers) {{'Authorization'=> "Bearer #{other_user.auth_token}"}}
    #Authorization:Bearer xxxxxxxxxxxxx

    describe "GET /posts/{id}" do
        
        context "with valid auth" do
            context "when requisting other's author post" do
                context "When post is public" do
                    before {get "posts/#{other_user_post.id}", headers: auth_headers}
                    context "payload" do
                        subject {JSON.parse(response.body)}
                        it {is_expected.to include(:id)}
                    end
                    context "response" do
                        subject {response}
                        it {is_expected.to have_http_status(:ok)}
                    end
                end
                context "When post is draft" do
                    before {get "posts/#{other_user_post_draft.id}", headers: auth_headers}
                    context "payload" do
                        subject {JSON.parse(response.body)}
                        it {is_expected.to include(:id)}
                    end
                    context "response" do
                        subject {response}
                        it {is_expected.to have_http_status(:ok)}
                    end
                end
            end
            context "when requisting user's post" do
            end
        end
    end
    describe do
        
    end

    describe "" do
        
    end

        # it "should return OK" do
        #     get '/posts'
        #     payload = JSON.parse(response.body)
        #     expect(payload).to be_empty
        #     expect(response).to have_http_status(200)
        # end

    # end

end