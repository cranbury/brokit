require 'spec_helper'

describe Apartment do
  
  it { should validate_presence_of(:address) }
end