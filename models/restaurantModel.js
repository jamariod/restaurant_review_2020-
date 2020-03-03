const db = require("./conn");

class RestaurantModel {
  constructor(
    id,
    name,
    distance,
    stars,
    category,
    favorite_dish,
    takeout,
    ate_list
  ) {
    this.id = id;
    this.name = name;
    this.distance = distance;
    this.stars = stars;
    this.category = category;
    this.favorite_dish = favorite_dish;
    this.takeout = takeout;
    this.ate_list = ate_list;
  }

  static async getAllRestaurants() {
    try {
      const response = await db.any(`SELECT * FROM restaurant;`);
      return response;
    } catch (error) {
      console.log.error("ERROR: ", error);
      return error;
    }
  }
}

module.exports = RestaurantModel;
