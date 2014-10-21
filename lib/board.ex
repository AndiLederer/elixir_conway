defmodule Board do
  @doc """
  Erstellt eine Liste von Tuples {1,[]}
  """
  def create_board(length, height) do
    :random.seed(:erlang.now)
    create_row(length,height-1)
  end

  def print_board(board) do
    mapped_rows = Enum.map(board, fn {row_num,row} -> 
        Enum.join(row, "")
      end) 
    Enum.join(mapped_rows,"<br>")
  end

  def cycle(board) do
    Enum.map(board,fn {row_num,row}->
        new_row = cycle_row(board,row,{0,row_num})
        Enum.count(new_row)
        {row_num,new_row}
    end)
  end

  def cycle_row(board,[],position) do
    []
  end

  def cycle_row(board,[head|tail],position) do
    {x,y} = position
    # IO.puts "befor validation_task"
    validation_task = Task.async( Board,:validate_position, [board,position,head])
    #IO.puts "befor cycling_task"
    cycling_task = Task.async(Board, :cycle_row,[board,tail,{x+1,y} ])
    
    [Task.await(validation_task)| Task.await(cycling_task)]
    
  end
  
  def validate_position(board,position,cell) do
    surrounding = Surrounding.get_surrounding(board,position)
    Life.validate(cell,surrounding) 
  end

  defp create_row(length,height) do
    create_row(length,height-1,[{height,create_column(length-1,[])}])
  end

  defp create_row(length,0,list) do
    [{0,create_column(length-1,[])}|list]
  end

  defp create_row(length,height,list) do
    new_list = [{height,create_column(length-1,[])}|list]
    create_row(length,height-1,new_list)
  end

  defp create_column(0,list) do
    [Life.create|list]
  end

  
  defp create_column(length,list) do
    create_column(length-1,[Life.create|list])
  end
end