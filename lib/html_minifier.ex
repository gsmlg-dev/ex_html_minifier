defmodule HtmlMinifier do
  @moduledoc """
  HtmlMinifier, bind crate `minify-html` to Elixir.

  ## Examples

      iex> HtmlMinifier.minify("<div>      A       </div>", %HtmlMinfier{})
      "<div> A </div>"

  ## Config Options

  * do_not_minify_doctype: bool
  Do not minify DOCTYPEs. Minified DOCTYPEs may not be spec compliant.

  * ensure_spec_compliant_unquoted_attribute_values: bool
  Ensure all unquoted attribute values in the output do not contain any characters prohibited by the WHATWG specification.

  * keep_closing_tags: bool
  Do not omit closing tags when possible.

  * keep_html_and_head_opening_tags: bool
  Do not omit <html> and <head> opening tags when they don’t have attributes.

  * keep_spaces_between_attributes: bool
  Keep spaces between attributes when possible to conform to HTML standards.

  * keep_comments: bool
  Keep all comments.

  * keep_input_type_text_attr: bool
  Keep type=text attribute name and value on <input> elements.

  * keep_ssi_comments: bool
  Keep SSI comments.

  * preserve_brace_template_syntax: bool
  When {{, {#, or {% are seen in content, all source code until the subsequent matching closing }}, #}, or %} respectively gets piped through untouched.

  * preserve_chevron_percent_template_syntax: bool
  When <% is seen in content, all source code until the subsequent matching closing %> gets piped through untouched.

  * minify_css: bool
  Minify CSS in <style> tags and style attributes using https://github.com/parcel-bundler/lightningcss.

  * minify_js: bool
  Minify JavaScript in <script> tags using minify-js.

  Only <script> tags with a valid or no MIME type is considered to contain JavaScript, as per the specification.

  * remove_bangs: bool
  Remove all bangs.

  * remove_processing_instructions: bool
  """
  use Rustler, otp_app: :html_minifier, crate: "html_minifier_native"

  defstruct keep_closing_tags: false,
            keep_html_and_head_opening_tags: false,
            keep_spaces_between_attributes: false,
            minify_css: false,
            minify_js: false,
            remove_bangs: false,
            remove_processing_instructions: false,
            do_not_minify_doctype: false,
            ensure_spec_compliant_unquoted_attribute_values: false,
            keep_comments: false,
            keep_input_type_text_attr: false,
            keep_ssi_comments: false,
            preserve_brace_template_syntax: false,
            preserve_chevron_percent_template_syntax: false

  @type t() :: %__MODULE__{
          keep_closing_tags: boolean(),
          keep_html_and_head_opening_tags: boolean(),
          keep_spaces_between_attributes: boolean(),
          minify_css: boolean(),
          minify_js: boolean(),
          remove_bangs: boolean(),
          remove_processing_instructions: boolean(),
          do_not_minify_doctype: boolean(),
          ensure_spec_compliant_unquoted_attribute_values: boolean(),
          keep_comments: boolean(),
          keep_input_type_text_attr: boolean(),
          keep_ssi_comments: boolean(),
          preserve_brace_template_syntax: boolean(),
          preserve_chevron_percent_template_syntax: boolean()
        }

  @spec minify(binary(), t()) :: binary()
  def minify(_html, _config), do: :erlang.nif_error(:nif_not_loaded)
end
