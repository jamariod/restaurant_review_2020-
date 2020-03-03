const pgp = require("pg-promise")({
  query: function(e) {
    console.log("QUERY: ", e.query);
  }
});

const options = {
  host: "localhost",
  database: "restaurant_review_2020"
};

const db = pgp(options);

module.exports = db;
