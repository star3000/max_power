require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe 'GET index' do
    let!(:companies) { create_list :company, 5 }

    it 'return status 200' do
      get :index
      expect(response).to have_http_status :ok
    end

    it 'return document types' do
      get :index
      expect(json.size).to eq 5
    end
  end

  describe 'POST create' do
    context "with valid attributes" do
      it 'creates a new company' do
        expect {
          post :create, params: { company: { name: "Google" } }
        }.to change(Company, :count).by(1)
        company = Company.last
        expect(company.name).to eq("Google")
      end
    end
  end

  describe 'PUT update' do
  end

  describe 'DELETE destroy' do
  end
end
