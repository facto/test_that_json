defmodule TestThatJson.Helpers do
  alias TestThatJson.Generation
  alias TestThatJson.Json
  alias TestThatJson.Loading
  alias TestThatJson.Normalization
  alias TestThatJson.Parsing

  def has_json_keys(subject, value) do
    handle_result!(Json.has_keys?(subject, value))
  end

  def has_only_json_keys(subject, value) do
    handle_result!(Json.has_only_keys?(subject, value))
  end

  def has_json_values(subject, value) do
    handle_result!(Json.has_values?(subject, value))
  end

  def has_only_json_values(subject, value) do
    handle_result!(Json.has_only_values?(subject, value))
  end

  def has_json_properties(subject, value) do
    handle_result!(Json.has_properties?(subject, value))
  end

  def has_only_json_properties(subject, value) do
    handle_result!(Json.has_only_properties?(subject, value))
  end

  def has_json_path(subject, value) do
    handle_result!(Json.has_path?(subject, value))
  end

  def has_json_size(subject, size) do
    handle_result!(Json.has_size?(subject, size))
  end

  def has_json_type(subject, type) do
    handle_result!(Json.has_type?(subject, type))
  end

  def is_json_equal(subject, value) do
    handle_result!(Json.equals?(subject, value))
  end

  def load_json(path) do
    Loading.load(path)
  end

  def load_json!(path) do
    Loading.load!(path)
  end

  def parse_json(json) do
    Parsing.parse(json)
  end

  def parse_json!(json) do
    Parsing.parse!(json)
  end

  def prettify_json(json) do
    Normalization.prettify(json)
  end

  def prettify_json!(json) do
    Normalization.prettify!(json)
  end

  def to_json(value) do
    Generation.generate(value)
  end

  def to_json!(value) do
    Generation.generate!(value)
  end

  def to_prettified_json(value) do
    Generation.generate_prettified(value)
  end

  def to_prettified_json!(value) do
    Generation.generate_prettified!(value)
  end



  # PRIVATE ##################################################

  defp handle_result!(expr) do
    case expr do
      {:error, {module, _values, message}} -> raise module, message: message
      {:error, {module, values}}           -> raise module, value: List.first(values)
      result                               -> result
    end
  end
end
