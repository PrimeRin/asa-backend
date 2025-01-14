# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :permissions, dependent: :destroy
  has_many :users, dependent: :nullify

  validates :name, presence: true
end
