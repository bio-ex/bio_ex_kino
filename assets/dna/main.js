import React from "react";
import { createRoot } from "react-dom/client";
import { _ } from "lodash";

export function init(ctx, data) {
  ctx.importCSS(
    "https://fonts.googleapis.com/css2?family=Inter:wght@400;500&display=swap",
  );
  ctx.importCSS(
    "https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;600&display=swap",
  );

  const root = createRoot(ctx.root);
  root.render(<App ctx={ctx} data={data} />);
}

function App({ _ctx, data }) {
  const label = data.label || "None";
  const length = data.length || "None";
  const isValid = `${data["valid?"]}`;
  const alpha = data.alphabet || "None";
  const sequence = data.sequence || "None";
  // This may not be required with the charlist impl for sequences...
  let chunkNucleotides = _.flow([splitEmpty, makeNucleotides, chunkToFit]);

  return (
    <div className="flex">
      <h4>label: {label}</h4>
      <h4>len: {length}</h4>
      <h4>valid?: {isValid}</h4>
      <h4>alphabet: {alpha}</h4>
      {chunkNucleotides(sequence).map((chunk, idx) => {
        return (
          <p>
            <code key={`seq-chunk-${idx}`}>{chunk}</code>
          </p>
        );
      })}
    </div>
  );
}

function makeNucleotides(list) {
  console.log(list);
  return list.map((nt, idx) => <Nucleotide key={idx} value={nt} />);
}

function splitEmpty(s) {
  console.log(s);
  return _.split(s, "");
}

function chunkToFit(list) {
  console.log(list);
  return _.chunk(list, 100);
}

function Nucleotide({ value }) {
  return <span title="a nucleotide">{value}</span>;
}
