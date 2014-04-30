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
  include SearchesHelper

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
      stores_vectorized = @stores.map { |i| [i, find_store_vector(i)] }
      stores_similarities = stores_vectorized.map {
        |store, store_vector|
        [store, cosine_similarity(store_vector, user_vector)]
      }
      sorted_stores = stores_similarities.sort_by { |a| -a[1] }
      @stores = sorted_stores.map{|store,similarity| store }
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

    if features_id.present?
      feature_name = Feature.where(id: features_id).pluck(:name)
      stores = stores.where(:adventure > 5.0) if feature_name == 'Adventure'
      stores = stores.where(:convenience > 5.0) if feature_name == 'Convenience'
      stores = stores.where(:bargain > 5.0) if feature_name == 'Bargains'
    end

    if space_type.present?
      stores = stores.where(:size => 1..2) if space_type.name == 'Cozy'
      stores = stores.where(:size => 2..3) if space_type.name == 'Large'
    end
    if access_type.present?
      stores = stores.where(['public_transit in (?) OR parking in (?)', 2..3, 1..2]) if access_type.name == 'Transit'
      stores = stores.where(['public_transit in (?) OR parking in (?)', 1..2, 2..3]) if access_type.name == 'Parking'
    end
    if goods_type.present?
      stores = stores.where(:prices => 1..2) if goods_type.name == 'Affordable'
      stores = stores.where(:prices => 2..3) if goods_type.name == 'High-End'
    end

    if ambience_type.present?
      stores = stores.where(['busyness in (?) OR noise in (?)', 1..2, 1..2]) if ambience_type.name == 'Mellow'
      stores = stores.where(['busyness in (?) OR noise in (?)', 2..3, 2..3]) if ambience_type.name == 'Bustling'
    end

    if character_type.present?
      stores = stores.where(:customer_service => 2..3) if character_type.name == 'Friendly'
      stores = stores.where(:customer_service => 1..2) if character_type.name == 'Hands-Off'
    end
    stores
  end

  private
  def find_store_vector(store)
    #TODO check if the store has an owner.
    owner = User.find(store.store_owner.user_id)
    store_vector = owner.get_response_vector
  end
end
