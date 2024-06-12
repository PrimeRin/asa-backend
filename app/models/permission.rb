# frozen_string_literal: true

class Permission < ApplicationRecord
  belongs_to :role

  validates :resource, presence: true
  validates :actions, presence: true
end
