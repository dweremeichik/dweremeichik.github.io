defmodule Mix.Tasks.Static.Build do
  use Mix.Task

  @shortdoc "Generate the static site to the 'docs/' folder"
  def run(_) do
    StaticBuilder.build()
  end
end
