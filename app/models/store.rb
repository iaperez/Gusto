class Store < ActiveRecord::Base
  has_many :store_categories
  has_many :store_styles
  has_many :store_personalities
  has_many :store_scents
  has_many :store_music_styles

  has_many :categories, through: :store_categories
  has_many :styles, through: :store_styles
  has_many :personalities, through: :store_personalities
  has_many :scents, through: :store_scents
  has_many :music_styles, through: :store_music_styles


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

  def styles_names_degrees
    self.styles.pluck(:name,:degree)
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
    self.personalities.pluck(:name,:degree)
  end


  def personalities_list=(names)
    self.personalities = names.split(",").map do |n|
      Personality.where(name: n.strip).first_or_create!
    end
  end

  def music_styles_list
    self.music_styles.map(&:name).join(", ")
  end

  def music_styles_names_degrees
    self.music_styles.pluck(:name,:degree)
  end

  def music_styles_list=(names)
    self.music_styles = names.split(",").map do |n|
      MusicStyle.where(name: n.strip).first_or_create!
    end
  end

  def scents_list
    self.scents.map(&:name).join(", ")
  end

  def scents_names_degrees
    self.scents.pluck(:name,:degree)
  end

  def scents_list=(names)
    self.scents = names.split(",").map do |n|
      Scent.where(name: n.strip).first_or_create!
    end
  end

end
