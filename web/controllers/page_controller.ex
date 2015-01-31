defmodule HelloPhoenix.PageController do
  use Phoenix.Controller
  #use Amnesia
  #use DB
  import Trans_action
  import ExProf.Macro

  plug :action

#defmodule Trans_action has a decent amount of prints and the below can overflow a bit (too many db tables)
#uses list comprehension for loop also will do with recursion eventually...
  def index(conn, _params) do
  	profile do

	  	#below causes an overflow of too many DB tables but left in since interesting
	  	#for n <- 1..3333 do
	  		pid1 = spawn(Trans_action, :write_read, ["John", "j@example.com", "hiiii1", 3333]) #replace 3333 with n for overflow
	  		pid2 = spawn(Trans_action, :write_read, ["Bob", "b@example.com", "hiiii2", 3333])  #replace 3333 with n for overflow
	  		pid3 = spawn(Trans_action, :write_read, ["Carl", "c@example.com", "hiiii3", 3333]) #replace 3333 with n for overflow
	  	#end
  	end
  	#IO.puts trans_block

    conn 
    |> put_flash(:notice, "dunnno. Need to see what the transaction returns to see if can pass value to flash or do list?")
    |> render "index.html"
  end
end
