namespace :create do

	desc "add new app to generate configs for"
	task :newApp do => :environment |task, args|
		Dir.chdir "working-dir" do 
			FileUtils.mkdir_p(args[0])
		end
	end	

	
end