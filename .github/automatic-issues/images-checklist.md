
Use this checklist to make sure your slides and images are set up correctly!

See [Setting Up Images and Graphics](https://www.ottrproject.org/writing_content.html#set-up-images) for more info!

- [ ] Create your course's main Google Slides.

- [ ] The slides use the appropriate template.

- [ ] Each slide is described in the notes of the slide so learners relying on a screen reader can access the content. See https://lastcallmedia.com/blog/accessible-comics for more guidance on this.

- [ ] The color palette choices of the slide are contrasted in a way that is friendly to those with color vision deficiencies.
You can check this using [Color Oracle](https://colororacle.org/).

- [ ] Every image is inserted into the text using one of these options: `ottrpal::include_slide()`, `knitr::include_image()`, or this format: `<img src="blah.png" alt="SOMETHING">`.

- [ ] Every image has alternative text added to it.

- [ ] The beginning of each Rmd contains this chunk so the images are saved in the correct spot:

`````
```{r, include = FALSE}
ottrpal::set_knitr_image_path()
```
`````
