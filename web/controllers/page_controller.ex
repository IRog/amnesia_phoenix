defmodule HelloPhoenix.PageController do
  use Phoenix.Controller
  #use Amnesia
  use DB

  plug :action

  def index(conn, _params) do
  	Amnesia.transaction! do
		john = %User{name: "John", email: "john@example.com"} |> User.write
		# Now let's add some messages.

		john |> User.add_message "john's message"

  	end

  	IO.puts "woot"
  	
  	Amnesia.transaction! do
	   	john = User.read(1)

		# # Now let's read his messages and print them all.
		john |> User.messages |> Enum.each &IO.puts(&1.content)

  		IO.puts "in transaction"
  	end

  	IO.puts "woot after trans"

  	#IO.puts trans_block

    conn 
    |> put_flash(:notice, "dunnno. Need to see what the transaction returns to see if can pass value to flash or do list?")
    |> render "index.html"
  end
end
