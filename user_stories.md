Iteration 1
CRUD
[ ] done

## Iteration 1

##### CRUD

```
[✓] done

User Story 1, trainer Index

For each trainer table
As a visitor
When I visit '/trainers'
Then I see the name of each trainer record in the system
```

```
[✓] done

User Story 2, trainer Show

As a visitor
When I visit '/trainers/:id'
Then I see the trainer with that id including the trainer's attributes
(data from each column that is on the trainer table)
```

```
[✓] done

User Story 3, pokemon Index

As a visitor
When I visit '/pokemons'
Then I see each pokemon in the system including the pokemon's attributes
(data from each column that is on the pokemon table)
```

```
[✓] done

User Story 4, pokemon Show

As a visitor
When I visit '/pokemons/:id'
Then I see the pokemon with that id including the pokemon's attributes
(data from each column that is on the pokemon table)
```

```
[✓] done

User Story 5, trainer pokemon Index

As a visitor
When I visit '/trainers/:trainer_id/pokemons'
Then I see each pokemon that is associated with that trainer with each pokemon's attributes
(data from each column that is on the pokemon table)
```

##### ActiveRecord

```
[✓] done

User Story 6, trainer Index sorted by Most Recently Created

As a visitor
When I visit the trainer index,
I see that records are ordered by most recently created first
And next to each of the records I see when it was created
```

```
[✓] done

User Story 7, trainer pokemon Count

As a visitor
When I visit a trainer's show page
I see a count of the number of pokemon associated with this trainer
```

##### Usability

```
[✓] done

User Story 8, pokemon Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the pokemon Index
```

```
[✓] done

User Story 9, trainer Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the trainer Index
```

```
[✓] done

User Story 10, trainer pokemon Index Link

As a visitor
When I visit a trainer show page ('/trainers/:id')
Then I see a link to take me to that trainer's `pokemon` page ('/trainers/:id/pokemons')
```

---

## Iteration 2

##### CRUD

```
[✓] done

User Story 11, trainer Creation

As a visitor
When I visit the trainer Index page
Then I see a link to create a new trainer record, "New trainer"
When I click this link
Then I am taken to '/trainers/new' where I  see a form for a new trainer record
When I fill out the form with a new trainer's attributes:
And I click the button "Create trainer" to submit the form
Then a `POST` request is sent to the '/trainers' route,
a new trainer record is created,
and I am redirected to the trainer Index page where I see the new trainer displayed.
```

```
[✓] done

User Story 12, trainer Update

As a visitor
When I visit a trainer show page
Then I see a link to update the trainer "Update trainer"
When I click the link "Update trainer"
Then I am taken to '/trainers/:id/edit' where I  see a form to edit the trainer's attributes:
When I fill out the form with updated information
And I click the button to submit the form
Then a `PATCH` request is sent to '/trainers/:id',
the trainer's info is updated,
and I am redirected to the trainer's Show page where I see the trainer's updated info
```

```
[ ] done

User Story 13, trainer pokemon Creation

As a visitor
When I visit a trainer pokemonren Index page
Then I see a link to add a new adoptable pokemon for that trainer "Create pokemon"
When I click the link
I am taken to '/trainers/:trainer_id/pokemons/new' where I see a form to add a new adoptable pokemon
When I fill in the form with the pokemon's attributes:
And I click the button "Create pokemon"
Then a `POST` request is sent to '/trainers/:trainer_id/pokemons',
a new pokemon object/row is created for that trainer,
and I am redirected to the trainer pokemons Index page where I can see the new pokemon listed
```

```
[ ] done

User Story 14, pokemon Update

As a visitor
When I visit a pokemon Show page
Then I see a link to update that pokemon "Update pokemon"
When I click the link
I am taken to '/pokemons/:id/edit' where I see a form to edit the pokemon's attributes:
When I click the button to submit the form "Update pokemon"
Then a `PATCH` request is sent to '/pokemons/:id',
the pokemon's data is updated,
and I am redirected to the pokemon Show page where I see the pokemon's updated information
```

##### ActiveRecord

```
[ ] done

User Story 15, pokemon Index only shows `true` Records

As a visitor
When I visit the pokemon index
Then I only see records where the boolean column is `true`
```

```
[ ] done

User Story 16, Sort trainer's pokemonren in Alphabetical Order by name

As a visitor
When I visit the trainer's pokemonren Index Page
Then I see a link to sort pokemonren in alphabetical order
When I click on the link
I'm taken back to the trainer's pokemonren Index Page where I see all of the trainer's pokemonren in alphabetical order
```

##### Usability

```
[ ] done

User Story 17, trainer Update From trainer Index Page

As a visitor
When I visit the trainer index page
Next to every trainer, I see a link to edit that trainer's info
When I click the link
I should be taken to that trainer's edit page where I can update its information just like in User Story 12
```

```
[ ] done

User Story 18, pokemon Update From pokemons Index Page

As a visitor
When I visit the `pokemon` index page or a trainer `pokemon` index page
Next to every pokemon, I see a link to edit that pokemon's info
When I click the link
I should be taken to that `pokemon` edit page where I can update its information just like in User Story 14
```

---

## Iteration 3

##### CRUD

```
[ ] done

User Story 19, trainer Delete

As a visitor
When I visit a trainer show page
Then I see a link to delete the trainer
When I click the link "Delete trainer"
Then a 'DELETE' request is sent to '/trainers/:id',
the trainer is deleted, and all pokemon records are deleted
and I am redirected to the trainer index page where I no longer see this trainer
```

```
[ ] done

User Story 20, pokemon Delete

As a visitor
When I visit a pokemon show page
Then I see a link to delete the pokemon "Delete pokemon"
When I click the link
Then a 'DELETE' request is sent to '/pokemons/:id',
the pokemon is deleted,
and I am redirected to the pokemon index page where I no longer see this pokemon
```

##### ActiveRecord

```
[ ] done

User Story 21, Display Records Over a Given Threshold

As a visitor
When I visit the trainer's pokemonren Index Page
I see a form that allows me to input a number value
When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
Then I am brought back to the current index page with only the records that meet that threshold shown.
```

##### Usability

```
[ ] done

User Story 22, trainer Delete From trainer Index Page

As a visitor
When I visit the trainer index page
Next to every trainer, I see a link to delete that trainer
When I click the link
I am returned to the trainer Index Page where I no longer see that trainer
```

```
[ ] done

User Story 23, pokemon Delete From pokemons Index Page

As a visitor
When I visit the `pokemon` index page or a trainer `pokemon` index page
Next to every pokemon, I see a link to delete that pokemon
When I click the link
I should be taken to the `pokemon` index page where I no longer see that pokemon
```

---

## Extensions

```
[ ] done

Extension 1: Sort trainers by Number of pokemonren

As a visitor
When I visit the trainers Index Page
Then I see a link to sort trainers by the number of `pokemon` they have
When I click on the link
I'm taken back to the trainer Index Page where I see all of the trainers in order of their count of `pokemon` (highest to lowest) And, I see the number of pokemonren next to each trainer name
```

```
[ ] done

Extension 2: Search by name (exact match)

As a visitor
When I visit an index page ('/trainers') or ('/pokemons')
Then I see a text box to filter results by keyword
When I type in a keyword that is an exact match of one or more of my records and press the Search button
Then I only see records that are an exact match returned on the page
```

```
[ ] done

Extension 3: Search by name (partial match)

As a visitor
When I visit an index page ('/trainers') or ('/pokemons')
Then I see a text box to filter results by keyword
When I type in a keyword that is an partial match of one or more of my records and press the Search button
Then I only see records that are an partial match returned on the page

This functionality should be separate from your exact match functionality.
User Story 1, trainer Index

For each trainer table
As a visitor
When I visit '/trainers'
Then I see the name of each trainer record in the system
[ ] done

User Story 2, trainer Show

As a visitor
When I visit '/trainers/:id'
Then I see the trainer with that id including the trainer's attributes
(data from each column that is on the trainer table)
[ ] done

User Story 3, pokemon Index

As a visitor
When I visit '/pokemons'
Then I see each pokemon in the system including the pokemon's attributes
(data from each column that is on the pokemon table)
[ ] done

User Story 4, pokemon Show

As a visitor
When I visit '/pokemons/:id'
Then I see the pokemon with that id including the pokemon's attributes
(data from each column that is on the pokemon table)
[ ] done

User Story 5, trainer pokemonren Index

As a visitor
When I visit '/trainers/:trainer_id/pokemons'
Then I see each pokemon that is associated with that trainer with each pokemon's attributes
(data from each column that is on the pokemon table)
ActiveRecord
[ ] done

User Story 6, trainer Index sorted by Most Recently Created

As a visitor
When I visit the trainer index,
I see that records are ordered by most recently created first
And next to each of the records I see when it was created
[ ] done

User Story 7, trainer pokemon Count

As a visitor
When I visit a trainer's show page
I see a count of the number of pokemonren associated with this trainer
Usability
[ ] done

User Story 8, pokemon Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the pokemon Index
[ ] done

User Story 9, trainer Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the trainer Index
[ ] done

User Story 10, trainer pokemon Index Link

As a visitor
When I visit a trainer show page ('/trainers/:id')
Then I see a link to take me to that trainer's `pokemon` page ('/trainers/:id/pokemons')
Iteration 2
CRUD
[ ] done

User Story 11, trainer Creation

As a visitor
When I visit the trainer Index page
Then I see a link to create a new trainer record, "New trainer"
When I click this link
Then I am taken to '/trainers/new' where I  see a form for a new trainer record
When I fill out the form with a new trainer's attributes:
And I click the button "Create trainer" to submit the form
Then a `POST` request is sent to the '/trainers' route,
a new trainer record is created,
and I am redirected to the trainer Index page where I see the new trainer displayed.
[ ] done

User Story 12, trainer Update

As a visitor
When I visit a trainer show page
Then I see a link to update the trainer "Update trainer"
When I click the link "Update trainer"
Then I am taken to '/trainers/:id/edit' where I  see a form to edit the trainer's attributes:
When I fill out the form with updated information
And I click the button to submit the form
Then a `PATCH` request is sent to '/trainers/:id',
the trainer's info is updated,
and I am redirected to the trainer's Show page where I see the trainer's updated info
[ ] done

User Story 13, trainer pokemon Creation

As a visitor
When I visit a trainer pokemonren Index page
Then I see a link to add a new adoptable pokemon for that trainer "Create pokemon"
When I click the link
I am taken to '/trainers/:trainer_id/pokemons/new' where I see a form to add a new adoptable pokemon
When I fill in the form with the pokemon's attributes:
And I click the button "Create pokemon"
Then a `POST` request is sent to '/trainers/:trainer_id/pokemons',
a new pokemon object/row is created for that trainer,
and I am redirected to the trainer pokemons Index page where I can see the new pokemon listed
[ ] done

User Story 14, pokemon Update

As a visitor
When I visit a pokemon Show page
Then I see a link to update that pokemon "Update pokemon"
When I click the link
I am taken to '/pokemons/:id/edit' where I see a form to edit the pokemon's attributes:
When I click the button to submit the form "Update pokemon"
Then a `PATCH` request is sent to '/pokemons/:id',
the pokemon's data is updated,
and I am redirected to the pokemon Show page where I see the pokemon's updated information
ActiveRecord
[ ] done

User Story 15, pokemon Index only shows `true` Records

As a visitor
When I visit the pokemon index
Then I only see records where the boolean column is `true`
[ ] done

User Story 16, Sort trainer's pokemonren in Alphabetical Order by name

As a visitor
When I visit the trainer's pokemonren Index Page
Then I see a link to sort pokemonren in alphabetical order
When I click on the link
I'm taken back to the trainer's pokemonren Index Page where I see all of the trainer's pokemonren in alphabetical order
Usability
[ ] done

User Story 17, trainer Update From trainer Index Page

As a visitor
When I visit the trainer index page
Next to every trainer, I see a link to edit that trainer's info
When I click the link
I should be taken to that trainer's edit page where I can update its information just like in User Story 12
[ ] done

User Story 18, pokemon Update From pokemons Index Page

As a visitor
When I visit the `pokemon` index page or a trainer `pokemon` index page
Next to every pokemon, I see a link to edit that pokemon's info
When I click the link
I should be taken to that `pokemon` edit page where I can update its information just like in User Story 14
Iteration 3
CRUD
[ ] done

User Story 19, trainer Delete

As a visitor
When I visit a trainer show page
Then I see a link to delete the trainer
When I click the link "Delete trainer"
Then a 'DELETE' request is sent to '/trainers/:id',
the trainer is deleted, and all pokemon records are deleted
and I am redirected to the trainer index page where I no longer see this trainer
[ ] done

User Story 20, pokemon Delete

As a visitor
When I visit a pokemon show page
Then I see a link to delete the pokemon "Delete pokemon"
When I click the link
Then a 'DELETE' request is sent to '/pokemons/:id',
the pokemon is deleted,
and I am redirected to the pokemon index page where I no longer see this pokemon
ActiveRecord
[ ] done

User Story 21, Display Records Over a Given Threshold

As a visitor
When I visit the trainer's pokemonren Index Page
I see a form that allows me to input a number value
When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
Then I am brought back to the current index page with only the records that meet that threshold shown.
Usability
[ ] done

User Story 22, trainer Delete From trainer Index Page

As a visitor
When I visit the trainer index page
Next to every trainer, I see a link to delete that trainer
When I click the link
I am returned to the trainer Index Page where I no longer see that trainer
[ ] done

User Story 23, pokemon Delete From pokemons Index Page

As a visitor
When I visit the `pokemon` index page or a trainer `pokemon` index page
Next to every pokemon, I see a link to delete that pokemon
When I click the link
I should be taken to the `pokemon` index page where I no longer see that pokemon
Extensions
[ ] done

Extension 1: Sort trainers by Number of pokemonren

As a visitor
When I visit the trainers Index Page
Then I see a link to sort trainers by the number of `pokemon` they have
When I click on the link
I'm taken back to the trainer Index Page where I see all of the trainers in order of their count of `pokemon` (highest to lowest) And, I see the number of pokemonren next to each trainer name
[ ] done

Extension 2: Search by name (exact match)

As a visitor
When I visit an index page ('/trainers') or ('/pokemons')
Then I see a text box to filter results by keyword
When I type in a keyword that is an exact match of one or more of my records and press the Search button
Then I only see records that are an exact match returned on the page
[ ] done

Extension 3: Search by name (partial match)

As a visitor
When I visit an index page ('/trainers') or ('/pokemons')
Then I see a text box to filter results by keyword
When I type in a keyword that is an partial match of one or more of my records and press the Search button
Then I only see records that are an partial match returned on the page

This functionality should be separate from your exact match functionality.
```
