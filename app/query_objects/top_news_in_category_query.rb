class TopNewsInCategoryQuery
  DEFAULT_LIMIT = 3

  attr_reader :page, :limit
  private :page, :limit

  def initialize(page, limit: DEFAULT_LIMIT)
    @page = page
    @limit = limit
  end

  def all
    return top_in_category if top_in_category.any?
    top_in_site
  end

  private

  def published_pages
    Page.where.not(id: page.id)
  end

  def top_in_category
    @top_in_category ||=
      published_pages
      .where(category_id: page.category_id)
      .order(created_at: :desc)
      .limit(limit)
  end

  def top_in_site
    @top_in_site ||=
      published_pages
      .order(created_at: :desc)
      .limit(limit)
  end
end
