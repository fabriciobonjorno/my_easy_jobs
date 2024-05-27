# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:birthdate) }
  it { is_expected.to validate_presence_of(:password) }
end
