defmodule STracker.Store do
  alias :mnesia, as: Mnesia

  def count(path) do
    key = {path, :erlang.system_time(:millisecond)}
    Mnesia.dirty_update_counter(PVCounter, key, 1)
  end

  def view_hour(_hour) do

  end
end
