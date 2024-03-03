defimpl Kino.Render, for: Bio.Sequence.DnaStrand do
  def to_livebook(s) do
    s |> KinoBioEx.Sequence.new() |> Kino.Render.to_livebook()
  end
end

defimpl Kino.Render, for: Bio.Sequence.DnaDoubleStrand do
  def to_livebook(s) do
    s |> KinoBioEx.Sequence.new() |> Kino.Render.to_livebook()
  end
end

defimpl Kino.Render, for: Bio.Sequence.RnaStrand do
  def to_livebook(s) do
    s |> KinoBioEx.Sequence.new() |> Kino.Render.to_livebook()
  end
end

defimpl Kino.Render, for: Bio.Sequence.RnaDoubleStrand do
  def to_livebook(s) do
    s |> KinoBioEx.Sequence.new() |> Kino.Render.to_livebook()
  end
end

defimpl Kino.Render, for: Bio.Sequence.AminoAcid do
  def to_livebook(s) do
    s |> KinoBioEx.Sequence.new() |> Kino.Render.to_livebook()
  end
end
