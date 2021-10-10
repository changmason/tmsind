class Company < ApplicationRecord
  validates :name, :main_type, :sub_type, presence: true
end
