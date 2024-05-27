# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:company_name) }
  it { is_expected.to validate_presence_of(:password) }
end
