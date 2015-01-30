use DB

defmodule Trans_action do
	#import ExProf.Macro

	def write_read(name, email, message, id) do
		#profile do
		Amnesia.transaction! do
			person = %User{name: name, email: email} |> User.write
			# Now let's add some messages.

			person |> User.add_message message

	  	end
	  	# IO.puts name
	  	# IO.puts email
	  	# IO.puts message
	  	# IO.puts id
	  	IO.puts "woot"
	  	
	  	Amnesia.transaction! do
		   	person = User.read(id)

			# # Now let's read his messages and print them all.
			person |> User.messages |> Enum.each &IO.puts(&1.content)

	  		IO.puts "in transaction"
	  	end

	  	IO.puts "woot after trans"
	  	#end
	end
end