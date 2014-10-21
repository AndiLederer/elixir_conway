# Description
"Conway's Game of Life" is not exactly an usefule project. It's only purpose is to show me how elixir and Erlang is dealing with state.

## Application start
Due to display problems on my windows pc, I set back the application and restart doing the output with an HTML page. For this purpose I put the output string out over http. A html page makes a timed ajax call.
Get dependencies with **mix deps.get** and start with **iex -S mix**.
To see the output start a browser and open the link **http://localhost:4000**

##Elixir Version
This version was build and tested with elixir-lang_v1.0.0.

## Dependencies
Dependencies used:

* Plug
* Cowboy

