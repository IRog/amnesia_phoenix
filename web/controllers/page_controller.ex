defmodule HelloPhoenix.PageController do
  use Phoenix.Controller
  #use Amnesia
  #use DB
  import Trans_action

  plug :action

  def index(conn, _params) do
  	pid1 = spawn(Trans_action, :write_read, ["John", "j@example.com", "hiiii1", 1])
  	pid2 = spawn(Trans_action, :write_read, ["Bob", "b@example.com", "hiiii2", 2])
  	pid3 = spawn(Trans_action, :write_read, ["Carl", "c@example.com", "hiiii3", 3])

  	#IO.puts trans_block

    conn 
    |> put_flash(:notice, "dunnno. Need to see what the transaction returns to see if can pass value to flash or do list?")
    |> render "index.html"
  end
end
