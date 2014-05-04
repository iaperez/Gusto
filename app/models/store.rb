# == Schema Information
#
# Table name: stores
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  prices           :integer
#  busyness         :integer
#  noise            :integer
#  adventure        :decimal(, )
#  convenience      :decimal(, )
#  bargain          :decimal(, )
#  website          :string(255)
#  description      :text
#  created_at       :datetime
#  updated_at       :datetime
#  img_url          :string(255)
#  variety          :integer
#  discounts        :integer
#  size             :integer
#  organization     :integer
#  parking          :integer
#  public_transit   :integer
#  stores_nearby    :string(255)
#  accessible       :string(255)
#  sales            :integer
#  image            :string(255)
#  thumbnail1       :string(255)
#  thumbnail2       :string(255)
#  thumbnail3       :string(255)
#  customer_service :integer
#

class Store < ActiveRecord::Base
  has_many :store_categories
  has_many :store_styles
  has_many :store_personalities
  has_many :store_scents
  has_many :store_music_styles
  has_many :store_air_types

  has_one :store_location
  accepts_nested_attributes_for :store_location

  has_many :categories, through: :store_categories
  has_many :styles, through: :store_styles
  has_many :personalities, through: :store_personalities
  has_many :scents, through: :store_scents
  has_many :music_styles, through: :store_music_styles
  has_many :air_types, through: :store_air_types

  has_one :store_owner


  mount_uploader :image, ImageUploader
  mount_uploader :thumbnail1, ImageUploader
  mount_uploader :thumbnail2, ImageUploader
  mount_uploader :thumbnail3, ImageUploader

  validates_presence_of :name

  def categories_list
    categories.pluck(:name).join(", ")
  end

  def categories_names
    categories.pluck(:name)
  end

  def categories_list=(names)
    self.categories = names.split(",").map do |n|
      Category.where(name: n.strip).first_or_create!
    end
  end

  def styles_list
    self.styles.map(&:name).join(", ")
  end

  def styles_names
    self.styles.pluck(:name)
  end

  def styles_names_degrees
    self.styles.pluck(:name, :degree)
  end

  def styles_list=(names)
    self.styles = names.split(",").map do |n|
      Style.where(name: n.strip).first_or_create!
    end
  end

  def personalities_list
    self.personalities.map(&:name).join(", ")
  end

  def personalities_names_degrees
    self.personalities.pluck(:name, :degree)
  end


  def personalities_list=(names)
    self.personalities = names.split(",").map do |n|
      Personality.where(name: n.strip).first_or_create!
    end
  end

  def music_styles_list
    self.music_styles.map(&:name).join(", ")
  end

  def music_styles_names
    self.music_styles.pluck(:name)
  end

  def music_styles_names_degrees
    self.music_styles.pluck(:name, :degree)
  end

  def music_styles_list=(names)
    self.music_styles = names.split(",").map do |n|
      MusicStyle.where(name: n.strip).first_or_create!
    end
  end

  def scents_list
    self.scents.map(&:name).join(", ")
  end

  def scents_names
    self.scents.pluck(:name)
  end

  def scents_names_degrees
    self.scents.pluck(:name, :degree)
  end

  def scents_list=(names)
    self.scents = names.split(",").map do |n|
      Scent.where(name: n.strip).first_or_create!
    end
  end

  def air_types_list
    self.air_types.map(&:name).join(", ")
  end

  def air_types_names
    self.air_types.pluck(:name)
  end

  def air_types_names_degrees
    self.air_types.pluck(:name,:degree)
  end

  def air_types_list=(names)
    self.air_types = names.split(",").map do |n|
      AirType.where(name: n.strip).first_or_create!
    end
  end

  def update_owners
    Store.all.each do |st|
      if StoreOwner.where(store_id: st.id).count == 0
        puts 'New Store Owner'+st.id.to_s
        if User.where(email: 'test@owner'+st.id.to_s+'.com').count == 0
          tt= User.new
          tt.password = '$2a$10$kE5u2O.Wzs9NPwF3j1zMuO/U9D60B38AEObMLqR.Q1DO8Qj2T2dMy'
          tt.email = 'test@owner'+st.id.to_s+'.com'
          tt.save
        else
          tt =  User.where(email: 'test@owner'+st.id.to_s+'.com').first
        end


        ownership = StoreOwner.new
        ownership.store_id = st.id
        ownership.user_id = tt.id
        ownership.save
        ans = Answer.all.first
        resp = Response.new
        resp.answer_id = ans.id
        resp.user_id = tt.id
        resp.save

      else
        puts 'Updating owner '+ st.id.to_s
        tt = User.find(StoreOwner.where(store_id: st.id).first.user_id)
        tt.email = 'test@owner'+st.id.to_s+'.com'
        tt.save
        ans = Answer.all.first
        resp = Response.new
        resp.answer_id = ans.id
        resp.user_id = tt.id
        resp.save
      end
    end
  end

end
