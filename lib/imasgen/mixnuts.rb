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
    end
  end

  def self.mixnuts(*args)
    MIXNUTSCls.new(*args)
  end
end