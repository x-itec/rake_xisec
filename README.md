# Rake-Task for X-ITEC Security-Signatures (internal component)

This rake-tasks are creating high-secure digital signatures of all *.rb files and/or all app/*.rb files. The main reason for this is to verify every distribution or app/ directory to ensure the code has not been modified and is a high-quality, unmodified original X-ITEC product. 

## Installation

Add this line to your application's Gemfile:

    gem 'rake_xisec' (currently not available)

    gem 'xitec_core_gems', git: 'git://github.com/x-itec/rake_xisec.git' # github

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rake_xisec

## Usage

Create public/private keys per project, create checksums of all and/or app/ Files and verify them.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
