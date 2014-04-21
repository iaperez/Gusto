class Search < ActiveRecord::Base
  belongs_to :category
  belongs_to :feature
  belongs_to :space_type
  belongs_to :location_type
  belongs_to :goods_type
  belongs_to :character_type
  belongs_to :ambience_type

  def stores
    @stores ||= find_stores
  end

  def find_stores
    stores = Store.order(:name)
    stores = stores.joins(:store_categories).where(store_categories: {category_id: category_id}) if category_id.present?
    stores
  end
end
