##
##   rake -  command on its own sets up working directory
##   rake onboard:newApp - creates the directories for a new app
##   rake onboard:newEnv - sets up the directory for a new environment
##
require 'json'

task :default do
	FileUtils.mkdir_p("working-dir")
end


namespace :onboard do
	
	desc "add new app to generate configs for"
	task :newApp, [:appName] do |t, args|
		Dir.chdir "working-dir" do 
			FileUtils.mkdir_p(args.appName)
			Dir.chdir args.appName do 
				FileUtils.mkdir_p("base-config")
				File.open("settings.json", 'w') {|f| f.write("{\n\t\"appName\" : \"" + args.appName + "\",\n \t\"environments\" : \n\t\t[\n\n\t\t\t{\n\n\t\t\t}\n\n\t\t]\n \n}") }
			end
		end
	end	

	
end

desc "add an environment to an app"
	task :newEnv, [:appName, :envName] do |t, args|
		Dir.chdir "working-dir" do
			if Dir[args.appName] != nil
				Dir.chdir args.appName do
					JSON.parse( IO.read("settings.json") )
				end
			else
				puts "no such app onboarded"
			end
		end
	end