# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :string
#  published  :boolean
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Post, type: :model do
  

  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:content)}
    it { should allow_value(true,false).for(:published)}
    it {should belong_to(:user)}
  end

end
