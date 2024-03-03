defmodule KinoBio.Sequence do
  @moduledoc """
  So this could be the basic impl, and then we have the data type specific
  implementations maybe?

  Not sure how this should be shaped just yet.
  """
  use Kino.JS, assets_path: "lib/assets/dna/build"

  alias Bio.Sequence.{
    DnaStrand,
    DnaDoubleStrand
  }

  @spec new(%DnaStrand{} | %DnaDoubleStrand{}) :: any()
  def new(%DnaStrand{} = sequence) do
    data = Map.from_struct(sequence)
    Kino.JS.new(__MODULE__, data)
  end

  def new(%DnaDoubleStrand{} = sequence) do
    data = Map.from_struct(sequence)
    Kino.JS.new(__MODULE__, data)
  end
end
