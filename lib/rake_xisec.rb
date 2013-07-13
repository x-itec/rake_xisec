require "rake_xisec/version"

module RakeXisec
#damit der Rake-Task geladen wird
require 'rake_xisec/railtie' if defined?(Rails)

end
