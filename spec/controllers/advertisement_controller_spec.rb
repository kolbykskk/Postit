require 'rails_helper'

RSpec.describe AdvertisementController, type: :controller do

  let(:my_ad) {Advertisement.create!(title: RandomData.random_sentance, copy: RandomData.random_paragraph)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns my_ad to @ad" do
      get :index
      expect(assigns(:ads)).to eq([my_ad])
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end

    it "creates an empty advertisement instance" do
      get :new
      expect(assigns(:ad)).not_to be_nil
    end
  end

  describe "GET #create" do
    it "increases the number of ads by 1" do
      expect{ ad :create, params: { ad: { title: RandomData.random_sentance, copy: RandomData.random_paragraph } } }.to change(Advertisement,:count).by(1)
    end

    it "assigns the new ad to @ad" do
      ad :create, params: { ad: { title: RandomData.random_sentance, copy: RandomData.random_paragraph } }
      expect(assigns(:ad)).to eq Advertisement.last
    end

    it "redirects to the last post" do
      ad :create, params: { ad: { title: RandomData.random_sentance, copy: RandomData.random_paragraph } }
      expect(response).to redirect_to Advertisement.last
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: my_ad.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the show view" do
      get :show, params: { id: my_ad.id }
      expect(response).to render_template :show
    end

    it "assigns my_ad to @ad" do
      get :show, params: { id: my_ad.id }
      expect(assigns(:ad)).to eq(my_ad)
    end
  end

end
