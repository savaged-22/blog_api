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
require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:auth_token) }
    it { should have_many(:posts)}
  end
  
end
