require_dependency 'password'

class ArticlesController < ApplicationController
  
  def index
    redirect_to root_path
  end

  def check_privacy
     @article = Article.find(params[:id])
     
     if able_to_see_private_content(@article, params)
        render 'show'
     else
        render 'private'
     end 
  end
  
  def show
    @article = Article.find(params[:id])
    
    if able_to_see_private_content(@article, params)
      respond_to do |format|
        format.html
      end
    else
      render 'private'
    end
  end

  def new
    @article = Article.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @article = Article.find(params[:id])
    if params[:article].nil? || Password::check(params[:article][:password], @article.password)
      @article.errors.add(:password, I18n.t("validation.wrong_password"))
      render :action => "show"
    else
      render :article => @article, :action => :edit
    end
  end

  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
    end
  end
  
  
  
  private
  
  def able_to_see_private_content(article, params)
      if article.isPrivate && (params[:article].nil? || Password::check(params[:article][:password], article.password))
        if !params[:article].nil? 
          article.errors.add(:password, I18n.t("validation.wrong_password"))
        end
        return false
      else
        return true
      end
  end
  

end
