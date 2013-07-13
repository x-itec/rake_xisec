
require 'rake_xisec'
require 'rails'
module RakeXisec
  class Railtie < Rails::Railtie
    railtie_name :rake_xisec

    rake_tasks do
      load "tasks/xisig.rake"
    end
  end
end

