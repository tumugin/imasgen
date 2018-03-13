require 'yaml'
require 'imasgen/generator_base'

module Imasgen
  class CinderellaGirlsCls < Imasgen::GeneratorBase
    def initialize
      super
      yaml = YAML.load_file(__dir__ + '/dic/cinderella_girls.yml')
      @namedic = yaml[:cinderella_girls]
    end

    def self.cinderella
      @imas_cg ||= Imasgen::CinderellaGirlsCls.new
      @imas_cg
    end
  end
end
