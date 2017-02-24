class Picture < ActiveRecord::Base
  attr_accessor :name
  belongs_to :user
  validates :content, :image, presence: true, if: :both_ok?
  mount_uploader :image, ImageUploader

  def both_ok?
   content.blank? && image.blank?
  end

end
