require 'yaml'
require 'imasgen/generator_base'

module Imasgen
  class MillionLiveCls < Imasgen::GeneratorBase
    def initialize
      super
      yaml = YAML.load_file(__dir__ + '/dic/million_live.yml')
      @namedic = yaml[:million_live]
    end

    def self.getyaml
      YAML.load_file(__dir__ + '/dic/million_live.yml')[:million_live]
    end
  end

  def self.millionlive
    @imas_ml ||= MillionLiveCls.new
    @imas_ml.auto_reset = true
    @imas_ml
  end
end
