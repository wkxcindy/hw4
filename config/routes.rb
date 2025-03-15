Rails.application.routes.draw do
  get("/", { controller: "places", action: "index" })
  
  # Authentication Routes
  get("/signup", { controller: "users", action: "new" })
  post("/users", { controller: "users", action: "create" })
  
  get("/login", { controller: "sessions", action: "new" })
  post("/sessions", { controller: "sessions", action: "create" })
  delete("/logout", { controller: "sessions", action: "destroy" })

  # Other Resources
  resources "entries"
  resources "places"
end

