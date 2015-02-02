defmodule HelloPhoenix.PageController do
  use Phoenix.Controller
  import Trans_action
  import ExProf.Macro

  plug :action

  def index(conn, _params) do
  	profile do

	  	#for n <- 1..2500 do #causes more [error] ** Too many db tables ** but left in since 1 process per transaction if comment out compherension in trans_action.ex
	  		pid1 = spawn(Trans_action, :write_read, ["John", "j@example.com", "hiiii1", 2500]) #replace 2500 with n for more overflow warnings
	  		pid2 = spawn(Trans_action, :write_read, ["Bob", "b@example.com", "hiiii2",  2500]) #replace 2500 with n for more overflow warnings
	  		pid3 = spawn(Trans_action, :write_read, ["Carl", "c@example.com", "hiiii3", 2500]) #replace 2500 with n for more overflow warnings
	  		pid4 = spawn(Trans_action, :write_read, ["Dave", "d@example.com", "hiiii4", 2500]) #replace 2500 with n for more overflow warnings
	  	#end
  	end
  	Amnesia.info

    conn 
    |> put_flash(:notice, "dunnno. Need to see what the transaction returns to see if can pass value to flash or do list?")
    |> render "index.html"
  end
end
