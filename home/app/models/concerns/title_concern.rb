require 'active_support/concern'
module TitleConcern
  extend ActiveSupport::Concern

  included do
    after_validation do
      corection_title
    end

    def corection_title
      unless title.nil?
        title.strip!
        arr = title.split
        self.title = arr.join(' ')
      end
    end
  end
end
