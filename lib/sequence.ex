defmodule KinoBio.Sequence do
  @moduledoc """
  So this could be the basic impl, and then we have the data type specific
  implementations maybe?

  Not sure how this should be shaped just yet.
  """
  use Kino.JS, assets_path: "lib/assets/dna/build"

  alias Bio.Sequence.Alphabets.AminoAcid

  alias Bio.Sequence.{
    DnaStrand,
    DnaDoubleStrand,
    RnaStrand,
    RnaDoubleStrand,
    AminoAcid
  }

  @type sequence ::
          %DnaStrand{} | %DnaDoubleStrand{} | %RnaStrand{} | %RnaDoubleStrand{} | %AminoAcid{}

  @spec new(sequence()) :: any()
  def new(%DnaStrand{} = sequence) do
    data =
      Map.from_struct(sequence)
      |> Map.put(:type, "dna")

    Kino.JS.new(__MODULE__, data)
  end

  def new(%DnaDoubleStrand{} = sequence) do
    top = sequence.top_strand
    bottom = sequence.bottom_strand
    data =
      Map.from_struct(sequence)
      |> Map.put(:sequence, top.sequence)
      |> Map.replace(:top_strand, Map.from_struct(top))
      |> Map.replace(:bottom_strand, Map.from_struct(bottom))
      |> Map.put(:type, "dna")

    Kino.JS.new(__MODULE__, data)
  end

  def new(%RnaStrand{} = sequence) do
    data =
      Map.from_struct(sequence)
      |> Map.put(:type, "rna")

    Kino.JS.new(__MODULE__, data)
  end

  def new(%RnaDoubleStrand{} = sequence) do
    top = sequence.top_strand
    bottom = sequence.bottom_strand
    data =
      Map.from_struct(sequence)
      |> Map.put(:sequence, top.sequence)
      |> Map.replace(:top_strand, Map.from_struct(top))
      |> Map.replace(:bottom_strand, Map.from_struct(bottom))
      |> Map.put(:type, "rna")

    Kino.JS.new(__MODULE__, data)
  end

  def new(%AminoAcid{} = sequence) do
    data =
      Map.from_struct(sequence)
      |> Map.put(:type, "aa")

    Kino.JS.new(__MODULE__, data)
  end
end
