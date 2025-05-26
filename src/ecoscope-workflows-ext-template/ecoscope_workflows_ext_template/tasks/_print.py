from typing import Annotated

from ecoscope_workflows_core.decorators import task
from pydantic import Field


@task
def print_template_result(
    value: Annotated[int, Field(default=0, description="value to print")] = 0
) -> str:
    result = f"Template result: {value}"
    print(result)
    return result