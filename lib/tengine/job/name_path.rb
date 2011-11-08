require 'tengine/job'

module Tengine::Job::NamePath

  SEPARATOR = '/'.freeze

  def name_path
    name = respond_to?(:name) ? self.name : self.class.name.split('::').last.underscore
    parent ? "#{parent.name_path}#{SEPARATOR}#{name}" :
      "#{SEPARATOR}#{name}"
  end

  def name_path_until_expansion
    name = respond_to?(:name) ? self.name : self.class.name.split('::').last.underscore
    if self.respond_to?(:was_expansion) && self.was_expansion
      "#{SEPARATOR}#{name}"
    else
      parent ? "#{parent.name_path_until_expansion}#{SEPARATOR}#{name}" :
        "#{SEPARATOR}#{name}"
    end
  end


end
