module Previewable
  extend ActiveSupport::Concern

  PARAMS_TO_SCRUB = %w[id created_at updated_at].freeze

  def list_attributes
    @a = attributes.except!( *PARAMS_TO_SCRUB)
    @a.map { |k, v| "#{k}: #{v}" }.join(', ')
  end

  included do
    def self.preview
      s = self
      a_names = s.attribute_names - [*PARAMS_TO_SCRUB]
      puts "#{s.name} | #{a_names.to_s.gsub(/[\[\]\"]/, '')}"
    end
  end

  def preview
    s = self
    puts "#{s.class} #{s.id} | #{s.list_attributes}"
  end
end