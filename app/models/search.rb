# == Schema Information
#
# Table name: searches
#
#  id                :integer          not null, primary key
#  category_id       :integer
#  features_id       :integer
#  created_at        :datetime
#  updated_at        :datetime
#  space_type_id     :integer
#  location_type_id  :integer
#  goods_type_id     :integer
#  ambience_type_id  :integer
#  character_type_id :integer
#  access_type_id    :integer
#

class Search < ActiveRecord::Base
  belongs_to :category
  belongs_to :feature
  belongs_to :space_type
  belongs_to :location_type
  belongs_to :goods_type
  belongs_to :character_type
  belongs_to :ambience_type
  belongs_to :access_type

  def stores(user_id)
    @stores ||= find_stores

    if User.exists?(id: user_id)
      searching_user = User.find(user_id)
      user_vector = searching_user.get_response_vector
       stores_vector = {}
      store_vector = []
      for store in @stores
        owner = User.find(store.store_owner.user_id)
        store_vector = owner.get_response_vector
      end
    end


    @stores
    #filter based on search input

    # get the user id
    # get the owner id for each store
    # generate the vector for each owner
    # get user vector
    # assing a cosine similarity to each store
    #order the results according the cosine similarity
  end

  def find_stores
    stores = Store.order(:name)
    stores = stores.joins(:store_categories).where(store_categories: {category_id: category_id}) if category_id.present?
    stores
  end

end
