# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_many :advances, dependent: :destroy
  has_one_attached :profile_pic
  belongs_to :grade
  belongs_to :role
  attr_writer :login

  validates :email, :name, :mobile_number, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_.]*$/, multiline: true
  validate :validate_username
  def validate_username
    return unless User.where(username: username).exists?

    errors.add(:username, :invalid)
  end

  def login
    @login || username || email
  end

  def self.find_for_authentication(username)
    where(['lower(username) = :value', { value: username.downcase }]).first
  end

  def self.authenticate(conditions, password)
    user = find_for_authentication(conditions)
    user if user&.valid_password?(password)
  end
end
