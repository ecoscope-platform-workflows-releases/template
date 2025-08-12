# Ecoscope Workflow Template 

In your work directory, run

```bash
cookiecutter https://github.com/ecoscope-platform-workflows-releases/template
```

Follow the prompt to input your project name and the first workflow name and you can explore the generated repository.

You can then publish your repository to github to start collaboration.

NOTE: If your project/workflow name has more than one word, please use hyphen(`-`) instead of underscore(`_`)

Then go inside the folder with the repo name and initialize a git repository

```bash
cd <repo_name>
git init
git add -A
git commit -m "first commit"
git branch -M main
```

After creating the repo on Github, you can push the change by
```bash
git remote add origin https://github.com/wildlife-dynamics/<repo_name>.git
git push -u origin main
```