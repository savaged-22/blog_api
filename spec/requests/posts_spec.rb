require "rails_helper"
require "byebug"
RSpec.describe "Posts", type: :request do

    describe "GET /posts" do
        before {get '/posts'}

        it "should return OK" do
            payload = JSON.parse(response.body)
            expect(payload).to be_empty
            expect(response).to have_http_status(200)
        end
    end

    describe "Data in the db" do
        let!(:posts) { create_list(:post, 10) } #lineas de factorybot
        before { get '/posts' }
        #byebug
        it "should return published posts" do
            get '/posts'
            payload = JSON.parse(response.body)
            #published_posts = posts.select(&:published)
            expect(payload.size).to eq(posts.size)
            expect(response).to have_http_status(200)
        end
    end 

    describe "GET /posts/{id}" do
        let!(:post) {create(:post)} #lineas de factorybot
        it "should return post" do
            get "/posts/#{post.id}"
            payload = JSON.parse(response.body)
            expect(payload).to_not be_empty
            expect(payload["id"]).to eq(post.id)
            expect(response).to have_http_status(200)
        end
    end
end