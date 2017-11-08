# frozen_string_literal: true

module Upment
  %w[entities repositories validations trailblazer].each do |folder|
    Hanami::Utils.require!('lib/upment/' + folder)
  end

  # lib/trailblazer/loader
  Trailblazer::Loader.new(
    concepts_root: Hanami.root.join('apps', 'api', 'concepts'),
    concept_dirs: %w[schema operation]
  ).files { |file| require file }
end
