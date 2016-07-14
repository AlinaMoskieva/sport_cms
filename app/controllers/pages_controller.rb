class PagesController < ApplicationController
  expose_decorated(:page, attributes: :page_params)
  expose_decorated(:comments) { page.comments.includes(:author).page params[:page] }
  expose_decorated(:categories) { Category.all }
  expose_decorated(:pages)
  expose_decorated(:users)

  def index
    self.pages = Page.includes(:category).includes(:user).order(created_at: :desc).page params[:page]
    self.pages = pages.where(category_id: params[:category_id]) if params[:category_id]
    self.pages = pages.where(user_id: params[:user_id]) if params[:user_id]
  end

  def new
    authorize page
  end

  def show
    page.increment(:visitors)
    page.save
  end

  def create
    authorize page, :create?
    page.user = current_user
    add_hashtags if page.body.include?("#")
    page.save
    respond_with page, location: page
  end

  def update
    authorize page, :update?
    add_hashtags if page.body.include?("#")
    page.save
    respond_with page, location: -> { page }
  end

  def destroy
    authorize page, :destroy?
    page.destroy
    respond_with page, location: root_path
  end

  def page_params
    params.require(:page).permit(:title, :body, :user_id, :category_id, :visitors)
  end

  private

  def add_hashtags
    hashes = page.body.scan(/#\w+/)
    hashes.uniq!

    hashes.each do |hash|
      hash = hash.slice(1..hash.length)
      hashtag = Hashtag.where(hashtag: hash).first

      if hashtag.nil?
        h = Hashtag.new
        h.hashtag = hash
        h.pages = []
        h.pages << page.id
        h.save
      else
        unless hashtag.pages.include?(page.id)
          hashtag.pages << page.id
          hashtag.save
        end
      end
    end
  end
end
