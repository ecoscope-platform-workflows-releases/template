# Workflow Template Repository

This repository contains a template for creating custom workflows. Follow the setup steps below to get started.

## Setup Steps

1. **Update the project name**
   
   Open the `pixi.toml` file and update the `name` field in the `[project]` section:
   ```toml
   [project]
   name = "template" #TODO: update "template" with your project name

   [tasks.pytest-cli]
   cmd = "./dev/pytest.sh template 'cli'" #TODO: update "template" with your project name

   [tasks.pytest-snapshot-update]
   cmd = "./dev/rmrf-snapshots.sh && ./dev/pytest.sh template 'app' 'sequential' --snapshot-update" #TODO: update "template" with your project name

   ```

2. **Update the workflow ID**
   
   Open the `spec.yaml` file and update the `id` field:
   ```yaml
   id: your-workflow-id
   ```

3. **Install pixi**
   
   If you don't have pixi installed, install it by following the instructions at the [official documentation](https://pixi.sh/latest/).

4. **Compile the workflow**
   
   Run the following command to compile your workflow:
   ```bash
   pixi run compile
   ```
   
   This will generate a folder called `ecoscope-workflows-<your-workflow-id>-workflow` with your compiled workflow.

5. **Generate your workflow result snapshot**
   
   Run the following command to generate your workflow result snapshot:
   ```bash
   pixi run pytest-snapshot-update
   ```

   This will generate a folder called `__results_snapshots__` with an example output.

6. **Test your workflow**
   
   Run the following command to test your workflow:
   ```bash
   pixi run pytest-cli
   ```

## Project Structure

- `pixi.toml`: Contains project configuration including dependencies
- `spec.yaml`: Contains workflow specifications
- `test-cases.yaml`: Contains test cases for your workflow
- `layout.json`: Contains the dashboard layout settings
- `dev`: Contains scripts required for development

## Additional Resources

- [Ecoscope Core Library](https://github.com/wildlife-dynamics/ecoscope)
- [Pixi Documentation](https://pixi.sh/latest/)
