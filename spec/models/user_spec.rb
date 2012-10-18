# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  nickname   :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
	before { @user = User.new(first_name: "Example User", last_name: "Example User", nickname: "ExaUse",email: "user@example.com") }
	subject { @user }
	it { should respond_to(:first_name) }
	it { should respond_to(:last_name) }
	it { should respond_to(:nickname) }
	it { should respond_to(:email) }
end