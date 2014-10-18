defmodule Conway do
  use Application

  def start(_type,_args) do
    {:ok, supervisor} = ConwaySupervisor.start_link
    Plug.Adapters.Cowboy.http HttpResponse, []
  end  
end
