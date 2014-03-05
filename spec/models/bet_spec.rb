require 'spec_helper'

describe Bet do
    it { should belong_to(:user) }
    it { should belong_to(:lot) }
    it { should validate_presence_of(:time) }
end

