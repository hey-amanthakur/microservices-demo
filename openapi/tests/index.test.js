const fetch = require("node-fetch");
const host = "http://localhost:8080";

describe("GET /", () => {
  it("/cart", async () => {
    const response = await fetch(host + "/cart");

    expect(response.status).toBe(200);
  });
});

describe("GET /customers/dZXnr0YQAt-Qg8pi4_LHxOhYN2Bmm3f9", () => {
  it("/customers", async () => {
    const response = await fetch(
      host + "/customers/dZXnr0YQAt-Qg8pi4_LHxOhYN2Bmm3f9"
    );

    expect(response.status).toBe(200);
  });
});

describe("GET /catalogue", () => {
  it("Check for catalog size of 6 and status code", async () => {
    const response = await fetch(host + "/catalogue?size=6");
    const result = await response.json();

    expect(response.status).toBe(200);
    expect(result.length).toBe(6);
  });

  it("Check for catalog size and status code", async () => {
    const response = await fetch(host + "/catalogue");
    const result = await response.json();

    expect(response.status).toBe(200);
    expect(result.length).toBe(9);
  });
});
