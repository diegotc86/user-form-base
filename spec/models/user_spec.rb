# == Schema Information
#
# Table name: users
#
#  id                    :bigint(8)        not null, primary key
#  first_name            :string
#  last_name             :string
#  username              :string
#  email                 :string
#  email_confirmation    :string
#  password              :string
#  password_confirmation :string
#  password_hint         :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
