module ConnectFour
  class Player
    attr_reader :name, :piece

    def initialize(**args)
      @name = args[:name] || 'Kevin'
      @piece = args[:piece] || :R
    end
  end
end
