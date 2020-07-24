require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    subject { get(users_path) }
    before do
      create_list(:user, 3)
    end

    it "ユーザーの一覧が取得できる" do
      subject

      res = JSON.parse(response.body)
      expect(res.length).to eq 3
      expect(res[0].keys).to eq ["account", "name", "email"]
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /users/:id" do
    subject { get(user_path(user_id)) }

    context "指定したidのユーザーが存在する場合" do
      let(:user) { create(:user) }
      let(:user_id) { user.id }

      it "ユーザーの値が取得できる" do
        subject
        res = JSON.parse(response.body)
        expect(response).to have_http_status(200)

        expect(res["account"]).to eq user.account
        expect(res["name"]).to eq user.name
        expect(res["email"]).to eq user.email
      end
    end

    context "指定したitのユーザーが存在しない場合"
      let(:user_id){ 1000 }

      it "ユーザーが見つからない" do
        expect {subject}.to raise_error ActiveRecord::RecordNotFound
      end
  end

  describe "POST /users" do
    subject { post(users_path, params: params) }
    let(:params){ {user: attributes_for(:user) }}

    it "ユーザーのレコードが作成できる" do
      expect{ subject }.to change{ User.count }.by(1)
      expect(response).to have_http_status(204)
    end
  end

  describe "PATCH /users/:id" do
    it "ユーザーのレコードを更新できる" do

    end
  end

  describe "DELETE /users/:id" do
    it "任意のユーザーのレコードを取得できる" do

    end
  end
end
