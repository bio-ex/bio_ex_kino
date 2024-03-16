defmodule Bio.Kino.MixProject do
  use Mix.Project

  def project do
    [
      app: :kino_bio_ex,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
    |> with_coverage()
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:kino, "~> 0.12.0"},
      {:bio_ex_sequence, "~> 0.1.1"},
      {:bio_ex_restriction, "~> 0.1.1"},
      {:excoveralls, "~> 0.18", only: :test}
    ]
  end

  defp with_coverage(list) do
    Keyword.merge(list,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.cobertura": :test
      ]
    )
  end
end
