defmodule Bio.Kino.MixProject do
  use Mix.Project

  def project do
    [
      app: :bio_ex_kino,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:kino, "~> 0.12.0"},
      {:bio_ex_sequence, "~> 0.1.1"}
    ]
  end
end
