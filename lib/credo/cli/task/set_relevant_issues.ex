defmodule Credo.CLI.Task.SetRelevantIssues do
  use Credo.Execution.Task

  alias Credo.CLI.Filter

  def call(exec, _opts \\ []) do
    issues =
      exec
      |> get_issues()
      |> Filter.important(exec)
      |> Filter.valid_issues(exec)

    set_issues(exec, issues)
  end
end
