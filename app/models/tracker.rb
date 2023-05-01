# == Schema Information
#
# Table name: trackers
#
#  id            :integer          not null, primary key
#  delivery_date :string
#  description   :string
#  detail        :string
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
class Tracker < ApplicationRecord


end
