use DB

defmodule Trans_action do
	def write_read(name, email, message, id) do
		for n <- 1..id do #comment out and replace n with id for [error] ** Too many db tables ** if do 10k processes in controller
			Amnesia.transaction! do
				person = %User{name: name <> Integer.to_string(n), email: email <> Integer.to_string(n)} |> User.write
				#IO.puts person.email
				#IO.puts person.id
				person |> User.add_message(message <> Integer.to_string(n))

				person = User.read(person.id)

				# Now let's read his messages and print them all.
				#person |> User.messages |> Enum.each &IO.puts(&1.content)
		  	end
		end
		  	# IO.puts name
		  	# IO.puts email
		  	# IO.puts message
		  	# IO.puts id
	end
end