
[Follow the instructions here in ottrproject.org](https://www.ottrproject.org/writing_content.html) for details on how to start editing your OTTR course

The following files need to be edited to get this new course started!

### Files that need edited upon creating a new course.

- [ ] `README.md` - Fill in all the `{ }`.
- [ ] `index.Rmd` - `title:` should be updated.
- [ ] `01-intro.Rmd` - replace the information there with information pertinent to this new course.
- [ ] `02-chapter_of_course.Rmd` - This Rmd has examples of how to set things up, if you don't need it as a reference, it can be deleted.

### Files that need to be edited upon adding each new chapter (including upon creating a new course):

- [ ] `_bookdown.yml` - The list of Rmd files that need to be rendered needs to be updated. See [instructions](https://www.ottrproject.org/examples.html#publishing-with-bookdown).
- [ ] `book.bib` - any citations need to be added. See [instructions](https://www.ottrproject.org/more_features.html#citing-sources).

### Picking a style

See more [about customizing style on this page in the guide](https://www.ottrproject.org/customize-style.html).
By default this course template will use the jhudsl data science lab style. However, you can customize and switch this to another style set.

#### Using a style set

[Read more about the style sets here](https://www.ottrproject.org/customize-style.html#Using_a_style_set).

- [ ] On a new branch, copy the `style-sets/<set-name>/index.Rmd` and `style-sets/<set-name>/_output.yml` to the top of the repository to overwrite the default `index.Rmd` and `_output.yml`.
- [ ] Copy over all the files in the `style-sets/<set-name>/copy-to-assets` to the `assets` folder in the top of the repository.
- [ ] [Create a pull request](https://www.ottrproject.org/writing_content.html#Open_a_pull_request) with these changes, and double check the rendered preview to make sure that the style is what you are looking for.

### Files that need to be edited upon adding new packages that the book's code uses:

- `docker/Dockerfile` needs to have the new package added so it will be installed. See [instructions](https://www.ottrproject.org/customize-docker.html).
- The code chunk in `index.Rmd` should be edited to add the new package.
