module Stationed
  module Generators
    class TemplatesGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../templates', __FILE__)

      def self.banner
        <<-BANNER.chomp
rails generate stationed:templates

Copies all generator templates from the Stationed gem into your project
directory for easy customisation.
        BANNER
      end

      def copy_files
        root = Pathname(self.class.source_root)
        Pathname.glob(root.join('**', '*.{haml,rb}')).each do |path|
          relpath = path.relative_path_from(root)
          copy_file relpath, Pathname('lib/templates').join(relpath)
        end
      end
    end
  end
end
