
namespace :onboard do
	
	desc "add new app to generate configs for"
	task :newApp, [:appName] do |t, args|
		Dir.chdir "working-dir" do 
			FileUtils.mkdir_p(args.appName)
			Dir.chdir args.appName do 
				FileUtils.mkdir_p("base-config")
				File.open("settings.json", 'w') {|f| f.write("{\n\"appName\" : \"" + args.appName + "\"\n}") }
			end
		end
	end	


	
end