require 'yaml'
require 'imasgen/generator_base'
require 'imasgen/cinderella_girls'
require 'imasgen/million_live'
require 'imasgen/sidem'

module Imasgen
  SIDEM = :sidem
  MILLIONLIVE = :millionlive
  CINDERELLA = :cinderella

  class MIXNUTSCls < Imasgen::GeneratorBase
    def initialize(*nuts)
      super()
      nuts.each do |item|
        case item
          when Imasgen::SIDEM
            @namedic += Imasgen::SideMCls.getyaml
          when Imasgen::MILLIONLIVE
            @namedic += Imasgen::MillionLiveCls.getyaml
          when Imasgen::CINDERELLA
            @namedic += Imasgen::CinderellaGirlsCls.getyaml
          else
            raise ArgumentError.new("Invalid Argument #{item}")
        end
      end
      if nuts.none?
        @namedic += Imasgen::SideMCls.getyaml
        @namedic += Imasgen::MillionLiveCls.getyaml
        @namedic += Imasgen::CinderellaGirlsCls.getyaml
      end
      @args = nuts
    end

    def unique
      @unique_i ||= self.class.new(*@args)
    end
  end

  def self.mixnuts(*args)
    nuts = MIXNUTSCls.new(*args)
    nuts.auto_reset = true
    nuts
  end
end