# Step 1: Integrate Basic Theme to Asset Pipeline

[X] / - And see a stubbed out, non-dynamic, page with the theme.

# Step 2: Allow people to CRUD lists.
[ ] ListsController
  #index
  - see all their lists
  - doubling as my #new action in that it is presenting the person with a form to create a new list
  / - Index all the lists...
- create a list

- show a list

- i need a model
- i need a controller
- i should a generate resource

Does it impact the DB?
Does it impact my URLS? '/lists/1' #

# Step 3: Add Items to a List

  - Make the items in a list real
    - a list has many items and every item belongs a list.

    lists
    2       Shopping List

    items
    id       description    list_id
    1         Milk              2
    1         Cookies           2


  CREATE ACTION for an ITEM in a LIST - What is the URL / HTTP method for that?

  - The form is already present in the list show page.
  - What URL does this form imply?

  POST /lists/:id/items #=> Doesn't describe which list we are adding an item too?

  An item doesn't exist in our application outside of the context of the list it belongs to

  Nested Resource - Items are nested in terms of URLs under their parent list.

  Does it impact the DB? - I probably a items table - associasted with a list.


  Does it impact my URLS? '/lists/1' #

# Step 4: Adding Validations

Validate that lists have name
Validate that items have a description.

# Step 5: I want to add state (complete, incomplete) to Items in a List
  - Marking items as compelte or incomplete.

# REFACTOR 1: Start using partials in lists/show because it's a bit messy.

# Step 6: Deleting Items from a list

# Step 7: User Signup and Login

# Step 8: Users have lists and can only see their lists.*

# Step Whatever: Fix Down Arrow on Make a List Form
