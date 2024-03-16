import React from "react";
import { createRoot } from "react-dom/client";
import { _ } from "lodash";
import { SeqViz } from "seqviz";
import "./main.css"

export function init(ctx, data) {
  ctx.importCSS(
    "https://fonts.googleapis.com/css2?family=Inter:wght@400;500&display=swap",
  );
  ctx.importCSS(
    "https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;600&display=swap",
  );
  ctx.importCSS("main.css");

  const root = createRoot(ctx.root);
  root.render(<App ctx={ctx} data={data} />);
}

function App({ _ctx, data }) {
  const type = data.type;
  const label = data.label || "None";
  const length = data.length || "None";
  const isValid = `${data["valid?"]}`;
  const alpha = data.alphabet || "None";
  const sequence = data.sequence || "None";

  return (
    <div>
      <div className="headers">
        <h3>Length: {length}</h3>
        <h3>Valid?: {isValid}</h3>
        <h3>Alphabet: {alpha}</h3>
      </div>
      <SeqViz
        style={{ height: "50em", width: "100vw" }}
        seqType={type}
        viewer="both"
        name={label}
        seq={sequence}
      />
    </div>
  );
}