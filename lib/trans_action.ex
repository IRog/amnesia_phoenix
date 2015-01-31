use DB

defmodule Trans_action do
	def write_read(name, email, message, id) do
#find out how to list all the items in the database
		for n <- 1..id do
			Amnesia.transaction! do
				#put in a loop and use counter to modify name and email and msg
				person = %User{name: name <> Integer.to_string(n), email: email <> Integer.to_string(n)} |> User.write
				# Now let's add some messages.
				#IO.puts person.email
				#IO.puts person.id
				person |> User.add_message(message <> Integer.to_string(n))

				person = User.read(person.id)

				# # Now let's read his messages and print them all.
				#person |> User.messages |> Enum.each &IO.puts(&1.content)
		  	end
		end
		  	# IO.puts name
		  	# IO.puts email
		  	# IO.puts message
		  	# IO.puts id
		  	#IO.puts "woot"
	  	#IO.puts "woot after trans"
	end
end