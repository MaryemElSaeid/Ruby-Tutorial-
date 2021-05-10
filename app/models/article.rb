class Article < ApplicationRecord
  include Visible
  include ActiveModel::SerializerSupport

  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :text, presence: true, length: { minimum: 10 }
end
