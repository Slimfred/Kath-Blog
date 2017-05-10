require 'rails_helper'

describe ArticlesController, :type => :controller do

  before do
    @article = FactoryGirl.create(:article)
    @admin = FactoryGirl.create(:admin)
    @user = FactoryGirl.create(:user)
  end

  describe "GET #index" do
    it "shows all articles" do
      get :index
      # expect(response).to have_http_status(200)
      expect(assigns(:articles)).to eq Article.all
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      get :show, params:{id: @article.id}
      expect(response).to render_template :show
    end

    it "shows correct article" do
      get :show, params:{id: @article.id}
      expect(response).to have_http_status(200)
      expect(assigns(:article)).to eq @article
    end
  end

  describe "GET #new" do

    context "User not admin logged in" do
      before do
        sign_in @user
      end
      it "redirects to root_path" do
        get :new, params: {id: @user.id}
        expect(response).to redirect_to(root_path)
      end
    end

    context "Admin logged in" do
      before do
        sign_in @admin
      end
      it "renders the new template" do
        get :new, params:{id: @admin.id}
        expect(response).to have_http_status(200)
        expect(response).to render_template :new
      end
    end

  end

  describe "GET #edit" do

    context "Admin logged in" do
      before do
        sign_in @admin
      end

      it "renders the edit template" do
        get :edit, params:{id: @article.id}
        expect(response).to have_http_status(200)
        expect(response).to render_template :edit
      end
    end

  end

  describe "Article #create" do
    before do
      sign_in @admin
    end

    context "create valid article then redirect to article page"

      subject {post :create, article: FactoryGirl.attributes_for(:article)}

        it 'creates a new article' do
          expect{subject}.to change(Article, :count).by(1)
        end

        it "redirects to article page" do
          post :create, article: FactoryGirl.attributes_for(:article)
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(article_path(Article.last))
        end

  end

  describe "PUT #update" do
    before do
      sign_in @admin
    end

    context "finds correct article, changes it & redirects back to article" do

      it "located the requested @article" do
        put :update, id: @article, article: FactoryGirl.attributes_for(:article)
        expect(assigns(:article)).to eq(@article)
      end

      it "changes attributes of @article" do
        put :update, id: @article, article:\
        FactoryGirl.attributes_for(:article, title: "updated_title", subject:"updated_subject")
        @article.reload
        expect(@article.title).to eq("updated_title")
      end

      it "redirects to updated article" do
        put :update, id: @article, article:\
        FactoryGirl.attributes_for(:article, title: "updated_title", subject:"updated_subject")

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(Article.last)
      end
    end
  end

  describe "DELETE #destroy" do

    it "deletes article" do
      delete :destroy, params: {id: @article.id}
      expect{@article.destroy}.to change(Article, :count).by(-1)

    end
  end

end
