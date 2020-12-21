eve = User.create(name: "Eve", email: "eve@aol.com", password: "password")
beth = User.create(name: "Beth", email: "bethharmon@aol.com", password: "password")

Smoothie.create(name: "Tropical Sunrise", recipe: "Apples and Oranges", user_id: eve.id)
Smoothie.create(name: "Monster Machine", recipe: "Peanut Butter and Protein Powder", user_id: beth.id)
