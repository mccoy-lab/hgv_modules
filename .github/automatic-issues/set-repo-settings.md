
For more information on these settings see instructions in [Starting a new OTTR course](https://www.ottrproject.org/getting_started.html#starting-a-new-ottr-course).

- [ ] This course repository is set to `public`.
- [ ] [Add the `jhudsl-robot` as a collaborator to your repository.](https://www.ottrproject.org/getting_started.html#5_Add_jhudsl-robot_as_a_collaborator).

- [ ] [Github secret `GH_PAT` has been set](https://www.ottrproject.org/getting_started.html#6_Set_up_your_GitHub_personal_access_token)
  `Name`:  `GH_PAT`
  `value`: A personal access token [following these instructions](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-token).
  Underneath `Select scopes`, check both `repo` and `workflow`.
  Then copy the PAT and save as the value.
  
- [ ] GitHub pages is turned on
  - [ ] Go to `Settings` > `Pages`. Underneath `Source`, choose `main` for the branch and select the `docs` folder. Then click `Save`.  
  - [ ] Check `Enforce HTTPS`.

- [ ] [Set branch protections settings](https://www.ottrproject.org/getting_started.html#8_Set_up_branch_rules)
  - [ ] `main` branch has been set up:
    - [ ] `Require pull request reviews before merging` box is checked.
    - [ ] `Require status checks to pass before merging` box is checked.
      - [ ] Underneath that `Require branches to be up to date before merging` box is checked.
  - [ ] Click `Save` at the bottom of the page!

- [ ] [Customize GitHub actions](https://www.ottrproject.org/customize-robots.html) for what you will need in this course.
