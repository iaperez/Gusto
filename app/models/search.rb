class Search < ActiveRecord::Base
  belongs_to :category
  belongs_to :personality

  def stores
    @stores ||= find_stores
  end

  def find_stores
    stores = Store.order(:name)
    stores = stores.joins(:store_categories).where(store_categories: {category_id: category_id}) if category_id.present?
    stores = stores.joins(:store_personalities).where(store_personalities: {personality_id: personality_id}) if personality_id.present?
    stores
  end
end
