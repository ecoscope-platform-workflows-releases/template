# Workflow Template Repository

This repository contains a template for creating custom workflows. Follow the setup steps below to get started.


## Project Structure

- `src/ecoscope-workflows-ext-template`: Contains custom tasks
- `workflows`: Contains all the workflows that are set up to use custom tasks
- `pixi.toml`: Contains project configuration including dependencies
- `dev`: Contains scripts required for development
- `publish`: Contains scripts required to build and publish the task package

## Task Development
The tasks are defined under `src/ecoscope-workflows-ext-<org>/ecoscope_workflows_ext_<org>/tasks`. Here's an example of a task

```python
@task
def add_one_thousand(
    value: Annotated[float, Field(default=0, description="value to add")] = 0
) -> float:
    return value+1000
```
Annotate your function with `@task` and input parameters with `Annotated[float, Field(default=0, description="value to add")] ` to indicate the type and the description of the input. 

Note: make sure to include your tasks to `__init__.py` to register it as a ecoscope-workflow task.

You can also add other dependecies in `src/ecoscope-workflows-ext-<org>/pyproject.toml` under [tool.pixi.dependencies] section


## Build the Task Package

1. Update the build recipe under `publish/recipes/release` including the required package
2. Add the recipe to `publish/build.sh`
3. Run
```bash
./publish/build.sh
```
4. Update the pixi environment by 
```bash
pixi update
```

Now you can use these tasks in your workflow


## Workflow Development
1. Update your workflow, including
- spec.yaml: a list of tasks and their relationships
- param.yaml: default configuration
- layout.json: update the default dashboard layout if your workflow generates a dashboard

2. Run the following command to compile your workflow:
   ```bash
   ./dev/recompile.sh <workflow-id> --install
   ```
   
   This will generate a folder called `ecoscope-workflows-<your-workflow-id>-workflow` with your compiled workflow.

   Later on if you update the workflow spec you can recompile it using:
   ```bash
   ./dev/recompile <workflow-id> --update
   ```

3. Test your workflow with this command:
   ```bash
   cd workflows/<workflow-id>/ecoscope-workflows-<workflow-id>-workflow
   pixi run python -m ecoscope_workflows_<workflow-id>_workflow.cli run --config-file ../param.yaml --execution-mode sequential --mock-io
   ```
   
## Publish Your Changes

1. Bump the git commit version by

   ```bash
   git tag v0.0.2
   git push origin --tags
   ```

2. Build your task package again
```bash
./publish/build.sh
```

3. Publish your task package again
```bash
./publish/push.sh
```

4. Check if your package exists on prefix.dev

5. Update the version in pixi.toml
   ```toml
   [dependencies.ecoscope-workflows-ext-<org>]
   channel = 'https://repo.prefix.dev/ecoscope-workflows-custom/'
   version = '0.0.2'
   ```

6. Update the version in spec.yaml
   ```toml
  - name: ecoscope-workflows-ext-<org>
    version: '0.0.2'
    channel: https://repo.prefix.dev/ecoscope-workflows-custom/
   ```

## Troubleshoot

1. *Task not Registered*
   Clean up pixi caches by
   ```bash
   pixi clean cache
   rm -rf .pixi
   rm -rf pixi.lock
   pixi update
   ```
   And compile again


## Additional Resources

- [Ecoscope Core Library](https://github.com/wildlife-dynamics/ecoscope)
- [Pixi Documentation](https://pixi.sh/latest/)
