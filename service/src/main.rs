#[macro_use] extern crate rocket;

use rocket::serde::{Deserialize, json::Json, json::json};

#[derive(Deserialize)]
struct Rumor {
    rumor: String
}

#[get("/")]
fn index() -> &'static str {
    "Hello, world!\n"
}

#[post("/rumor", format = "json", data="<rumor>")]
fn store(rumor : Json<Rumor>) -> rocket::serde::json::Value {
  json!({"status": "success", "message": "please come again"})
} 

#[launch]
fn rocket() -> _ {
    rocket::build()
      .mount("/", routes![index, store])
}
