const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("GET request to the homepage");
});

const port = process.env.PORT;
if (!port) {
  throw Error("You must set a Port for the App to Run");
}

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
