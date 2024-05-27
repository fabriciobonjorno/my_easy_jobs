# frozen_string_literal: true

class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable,
         :timeoutable

  validates :company_name, presence: true
end
