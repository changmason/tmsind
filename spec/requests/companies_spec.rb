 require 'rails_helper'

RSpec.describe "/companies", type: :request do

  # Company. As you add validations to Company, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryBot.attributes_for(:company)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:company, name: "", email: "abc@def")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Company.create! valid_attributes
      get companies_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      company = Company.create! valid_attributes
      get company_url(company)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_company_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      company = Company.create! valid_attributes
      get edit_company_url(company)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Company" do
        expect {
          post companies_url, params: { company: valid_attributes }
        }.to change(Company, :count).by(1)
      end

      it "redirects to the created company" do
        post companies_url, params: { company: valid_attributes }
        expect(response).to redirect_to(company_url(Company.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Company" do
        expect {
          post companies_url, params: { company: invalid_attributes }
        }.to change(Company, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post companies_url, params: { company: invalid_attributes }
        expect(response).to be_unprocessable
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        FactoryBot.attributes_for(:company)
      }

      it "updates the requested company" do
        company = Company.create! valid_attributes
        patch company_url(company), params: { company: new_attributes }
        company.reload
        expect(company.name).to_not eq(valid_attributes[:name])
        expect(company.email).to_not eq(valid_attributes[:email])
        expect(company.name).to eq(new_attributes[:name])
        expect(company.email).to eq(new_attributes[:email])
      end

      it "redirects to the company" do
        company = Company.create! valid_attributes
        patch company_url(company), params: { company: new_attributes }
        company.reload
        expect(response).to redirect_to(company_url(company))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        company = Company.create! valid_attributes
        patch company_url(company), params: { company: invalid_attributes }

        expect(response).to be_unprocessable
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested company" do
      company = Company.create! valid_attributes
      expect {
        delete company_url(company)
      }.to change(Company, :count).by(-1)
    end

    it "redirects to the companies list" do
      company = Company.create! valid_attributes
      delete company_url(company)
      expect(response).to redirect_to(companies_url)
    end
  end
end
