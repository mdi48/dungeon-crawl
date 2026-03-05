defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers

  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: [], trigger: nil

  def all, do: [
    %Room{
      description: "You can see the light of day. You found the exit!",
      actions: [forward()],
      trigger: Triggers.Exit
    },
    %Room{
      description: "You can see an enemy blocking your path.",
      actions: [forward()],
      trigger: Triggers.Enemy
    },
    %Room{
      description: "The room looks peaceful, but there might be hidden danger.",
      actions: [forward(), rest()],
      trigger: Triggers.EnemyHidden
    },
    %Room{
      description: "You notice strange marks on the floor and walls.",
      actions: [forward(), search()],
      trigger: Triggers.Trap
    },
    %Room{
      description: "A dusty chamber with old chests and broken furniture.",
      actions: [forward(), search()],
      trigger: Triggers.Treasure
    }
  ]
end
