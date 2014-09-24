defmodule Server.Supervisor do
  use Supervisor

  def start_link do 
      Supervisor.start_link(__MODULE__, :ok)
  end

  @tcp_server Server.Server

  def init(:ok) do
    #children = [
    #  worker(gen_tcp, [[name: @tcp_server]])
    #]

  end

end