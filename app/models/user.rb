# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  auth_token :string
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :posts
    validates :name, :email, :auth_token, presence: true
end
