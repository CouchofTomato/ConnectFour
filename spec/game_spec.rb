require 'spec_helper'

module ConnectFour
  describe Game do
    subject(:game) { Game.new }

    it { expect(game).to be_instance_of Game }
  end
end
