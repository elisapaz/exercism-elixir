defmodule LogParser do
  @valid_prefix_regex ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/
  @line_splits_regex ~r/<[~\*=\-]*>/
  @artifacts_regex ~r/end-of-line\d+/i
  @user_name_tag_regex ~r/User\s+(\S+)/u

  def valid_line?(line) do
    Regex.match?(@valid_prefix_regex, line)
  end

  def split_line(line) do
    Regex.split(@line_splits_regex, line)
  end

  def remove_artifacts(line) do
    Regex.replace(@artifacts_regex, line, "")
  end

  def tag_with_user_name(line) do
    matches = Regex.run(@user_name_tag_regex, line)
    case matches do
      [_full, name] -> "[USER] #{name} " <> line
      _ -> line
    end
  end
end
