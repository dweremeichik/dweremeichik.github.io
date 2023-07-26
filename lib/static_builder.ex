defmodule StaticBuilder do
  def build do
    clean()
    setup()

    File.ls!("src/")
    |> build_file()

    copy_link_content()
    IO.puts("...................")
    IO.puts("Site sucessfully built to 'docs/' 🥳")
    IO.puts("Grab yourself some Elixir 🥃")
  end

  def build_file([head | tail]) do
    IO.puts("Building file #{head} 🧪")
    content =
      ("src/" <> head)
      |> EEx.eval_file()

    last_modified = File.stat!("src/" <> head).mtime
    # IO.inspect(last_modified)

    root =
      "root.html.eex"
      |> EEx.eval_file(name: "dw", domain: "test", content: content, last_modified: last_modified)

    ("docs/" <> String.replace_suffix(head, ".eex", ""))
    |> File.open!([:write, :utf8])
    |> IO.write(root)

    build_file(tail)
  end

  def build_file([]) do
    :ok
  end

  def write_to_file(file_name) do
    ("docs/" <> file_name)
    |> File.open!([:write])
    |> IO.write(EEx.eval_file("src/" <> file_name))
  end

  def clean do
    IO.puts("Cleaning up 🧹")
    File.rm_rf!("docs/*")
  end

  def setup do
    IO.puts("Getting set up ⚗️")
    File.mkdir_p!("docs/")
  end

  def copy_link_content do
    IO.puts("Linking files 🔮")
    File.cp_r!("links/", "docs/")
  end
end
