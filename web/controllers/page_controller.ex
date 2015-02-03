defmodule HelloPhoenix.PageController do
  use Phoenix.Controller
  import ExProf.Macro

  plug :action

  def index(conn, _params) do
  	profile do
	  	for n <- 1..10000 do
	  		Task.async(Trans_action, :write_read, ["John #{n}", "j#{n}@example.com", "hiiii: ", n])
	  	end
  	end

  	Amnesia.info

    conn 
    |> put_flash(:notice, "dunnno. Wanted to try a flash message")
    |> render "index.html"
  end
end
