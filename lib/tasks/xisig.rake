# boris koester http://www.x-itec.net x-itec@freenet.de GPL 


namespace :xisec do
 desc "Creates priv/pub key for signing the code"
 task :genappkey do
  output=`openssl ecparam -out ec_key.pem -name sect571r1 -genkey;openssl ec -in ec_key.pem -pubout -out ec_public.pem` ; 
  result=$?.success? 
  puts result
end #task

 desc "creates checksums from app/ and a signature for the list"
 task :signcode do
	o=`pwd`
	puts o
	o=`find . -name "*.rb" -exec sha1sum \'\{\}\' \\; >sha1-all.txt` ;
	o=`find app/ -name "*.rb" -exec sha1sum \'\{\}\' \\; >sha1-app.txt` ;

	#`openssl dgst -sha256 < sha1-all.txt >sha1-all.sha256`
	#`openssl dgst -sha256 < sha1-app.txt >sha1-app.sha256`

	`cat sha1-all.txt | openssl dgst -ecdsa-with-SHA1 -sign ec_key.pem -out sha1-all.sig`
	`cat sha1-app.txt | openssl dgst -ecdsa-with-SHA1 -sign ec_key.pem -out sha1-app.sig`
	
end #task

 desc "checks all files and signature for modifications - only useful for initial first test because you may change your config files"
 task :verifycode_all do
	v0=`sha1sum -c sha1-all.txt`
	puts "CODE-VERIFICATION-ERROR" if v0.include?("FAILED")
	v1=`openssl dgst -sha1 -verify ec_public.pem -signature sha1-all.sig sha1-all.txt`
	puts "CODE-SIGNATURE-ERROR " if v1.include?("Failure")
end #task

desc "checks app/ files and signature for modifications"
 task :verifycode_app do
	v0=`sha1sum -c sha1-app.txt`
        puts "CODE-VERIFICATION-ERROR" if v0.include?("FAILED")
        v1=`openssl dgst -sha1 -verify ec_public.pem -signature sha1-app.sig sha1-app.txt`
	puts "CODE-SIGNATURE-ERROR " if v1.include?("Failure")
end #task

end# xisec
