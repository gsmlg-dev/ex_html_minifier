use minify_html::{Cfg, minify as minify_html};
use rustler::{Binary, Env, NifStruct, NifResult, OwnedBinary};


#[derive(NifStruct)]
#[module = "HtmlMinifier"]
pub struct Configuration {
    pub keep_closing_tags: bool,
    pub keep_html_and_head_opening_tags: bool,
    pub keep_spaces_between_attributes: bool,
    pub minify_css: bool,
    pub minify_js: bool,
    pub remove_bangs: bool,
    pub remove_processing_instructions: bool,
    pub do_not_minify_doctype: bool,
    pub ensure_spec_compliant_unquoted_attribute_values: bool,
    pub keep_comments: bool,
    pub keep_input_type_text_attr: bool,
    pub keep_ssi_comments: bool,
    pub preserve_brace_template_syntax: bool,
    pub preserve_chevron_percent_template_syntax: bool,
}

#[rustler::nif]
fn minify<'a>(env: Env<'a>, input: Binary<'a>, config: Configuration) -> NifResult<Binary<'a>>
 {
    let cfg = Cfg {
        do_not_minify_doctype: config.do_not_minify_doctype,
        ensure_spec_compliant_unquoted_attribute_values: config.ensure_spec_compliant_unquoted_attribute_values,
        keep_comments: config.keep_comments,
        keep_input_type_text_attr: config.keep_input_type_text_attr,
        keep_ssi_comments: config.keep_ssi_comments,
        preserve_brace_template_syntax: config.preserve_brace_template_syntax,
        preserve_chevron_percent_template_syntax: config.preserve_chevron_percent_template_syntax,
        keep_closing_tags: config.keep_closing_tags,
        keep_html_and_head_opening_tags: config.keep_html_and_head_opening_tags,
        keep_spaces_between_attributes: config.keep_spaces_between_attributes,
        minify_css: config.minify_css,
        minify_js: config.minify_js,
        remove_bangs: config.remove_bangs,
        remove_processing_instructions: config.remove_processing_instructions,
    };
    
    let output = minify_html(input.as_slice(), &cfg);

    let mut binary = OwnedBinary::new(output.len()).unwrap();
    binary.as_mut_slice().copy_from_slice(&output);

    Ok(Binary::from_owned(binary, env))
}


rustler::init!("Elixir.HtmlMinifier");
