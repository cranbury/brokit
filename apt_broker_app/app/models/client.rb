class Client < ActiveRecord::Base
  belongs_to :user
  has_many :client_favorites
  has_many :apartments, through: :client_favorites

end