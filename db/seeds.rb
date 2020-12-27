eve = User.create(name: "Eve", email: "eve@aol.com", password: "password")
beth = User.create(name: "Beth", email: "bethharmon@aol.com", password: "password")

SmoothieEntry.create(content: "Apples and Oranges", user_id: eve.id)
SmoothieEntry.create(content: "Peanut Butter and Protein Powder", user_id: beth.id)
