import React from "react";

function generateIconWithLabel({ iconTitle, iconLocation, iconLink }) {
  const generatedLabel = (
    <div style={{ textAlign: "center" }}>
      <a href={iconLink ? iconLink : undefined}>
        <img src={iconLocation} height="48" width="48" />
        <br />
        {iconTitle}
      </a>
    </div>
  );
  return generatedLabel;
}

function generateIcon({ iconLocation, iconLink }) {
  const generatedLabel = (
    <div style={{ textAlign: "center" }}>
      <a href={iconLink ? iconLink : undefined}>
        <img src={iconLocation} height="48" width="48" />
      </a>
    </div>
  );

  return generatedLabel;
}

export { generateIconWithLabel, generateIcon };
