defmodule HttpResponse do
  import Plug.Conn

  def init(options) do
    options
  end 
  
  def call(conn,_opts) do
    [boardAgent|rest] = _opts
    board = BoardAgent.get(boardAgent)
    conn |> put_resp_content_type("text/plain")
    |> send_resp(200,Board.print_board(board))
  end

end