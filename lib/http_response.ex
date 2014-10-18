defmodule HttpResponse do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  get "/board" do
    board = BoardAgent.get()
    conn |> send_resp(200,board)
  end

  get "/" do
    {:ok,text} = File.read("E:/LEDERER/dokumente/GitHub/elixier_conway/index.html")
    conn |> send_resp(200,text)
  end

end