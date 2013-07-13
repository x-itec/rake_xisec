# Rake-Task for X-ITEC Security-Signatures (internal component)

This rake-tasks are creating high-secure digital signatures of all *.rb files and/or all app/*.rb files. The main reason for this is to verify every distribution or app/ directory to ensure the code has not been modified and is a high-quality, unmodified original X-ITEC product. 



## Installation

Add this line to your application's Gemfile:

    gem 'rake_xisec' (currently not available)

    gem 'rake_xisec', git: 'git://github.com/x-itec/rake_xisec.git' # github

And then execute:

    $ bundle install

## Usage

This command creates a keypair specific for your application.

Do not distribute the ec_key.pem file to the public. 

### first start
You need to execute this only once per project. If you execute this again, new keys are generated.

    $ rake xisec:genappkey

### during development before publishing

Now, lets say you want to ensure that all files coming from your company are verified and trusted - and not modified.

Before your git add/commit do this:

    $ rake xisec:signcode

### you and your customer can verify the code is valid

Now, if you want to verify your code against any kind of modifications, do this: (valid only for all *.rb files signed before)

Verify the code in the app/ directory

    $ rake xisec:verifycode_app

Verify ALL *.rb files (may fail if your customer changes the config/ thats why you can check app/ separately)

    $ rake xisec:verifycode_all

### just try it

After signing, modify any *.rb file and figure out the result of the verify-call.

### How this works

First we create a keypair, so your customer can verify your publication. The key is done per project for more security, you can sign the public-key with gpg if you want, it's up to you.

All or app/ files are scanned and calculated with sha1sum into lists. these lists get signed with elliptic curve cipher (!!! ultra secure !!!!),  if anyone modifies the list or any bit of any *.rb file the verification fails. Thats exactly what we want.

### Why?

We like to share our work, but we don't like the case if someone modifies our work with backdoors, so everything thats coming from X-ITEC gets signed and can be verified by everyone to ensure that our product is still the high-quality product we made. Of course, all verification-keys get published on our website, too. So if someone generates new keys, they may not be the same as our keys. To get more security, you can sign your generated keys and checksums with gpg or whatever you want.

We dont say this is the ultimate solution, its just one of many steps that you can mix together to increase your security.

Boris Köster
http://www.x-itec.net

 
