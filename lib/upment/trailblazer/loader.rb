# frozen_string_literal: true

class Trailblazer::Loader
  def initialize(concepts_root:, concept_dirs:)
    @concepts_root = concepts_root
    @concept_dirs = concept_dirs
  end

  # def dirs
  #   Dir.entries(@concepts_root).select{ |f| !File.directory?(f) }.each do |dir|
  #     @concept_dirs.each do |subdir|
  #       File.join(@concepts_root, dir, subdir)
  #     end
  #   end.flatten
  # end

  def files(&block)
    # Policy
    files = Dir[File.join(@concepts_root, '**', 'policy.rb')]

    # Folders
    files += @concept_dirs.map do |dir|
      Dir[File.join(@concepts_root, '**', dir, '*.rb')]
    end.flatten

    # Other
    files += Dir[File.join(@concepts_root, '**', '*.rb')]

    load_files(files, &block)
  end

  private

  def load_files(files)
    files.each { |file| yield file }
  end
end
