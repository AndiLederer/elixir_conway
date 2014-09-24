defmodule Server.Server do

  def accept(port) do
    {:ok,socket} = :gen_tcp.listen(port,
    		 [:binary, packet: :line, active: false])
    IO.puts "Accepting connections on port #{port}"
    loop_acceptor(socket)
  end

  defp loop_acceptor(socket) do
    {:ok,client} = :gen_tcp.accept(socket)
    Task.async(fn -> 
      board = Board.create_board(100,100)
      serve(client,board) end)
    loop_acceptor(socket)
  end

  defp serve(socket,board) do
    write_line(socket,Board.print_board(board))
    board = Board.cycle(board)
    :timer.sleep 1000
    serve(socket,board)
  end

  defp write_line(socket,printable_board) do
    :gen_tcp.send(socket,printable_board)
  end

end