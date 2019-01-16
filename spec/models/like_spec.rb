require 'rails_helper'

RSpec.describe Like, type: :model do
  it { belong_to(:user) }
  it { belong_to(:movie) }
end
