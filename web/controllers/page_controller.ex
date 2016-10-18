defmodule AmnesiaPhoenix.PageController do
  use AmnesiaPhoenix.Web, :controller
  import ExProf.Macro

  def index(conn, _params) do
  	profile do
	  	for n <- 1..10000 do
	  		Task.async(Trans_action, :write_read, ["John #{n}", "j#{n}@example.com", "hiiii: ", n])
	  	end
  	end

  	Amnesia.info

    conn 
    |> put_flash(:notice, "dunnno. Wanted to try a flash message")
    |> render("index.html")
  end
end
