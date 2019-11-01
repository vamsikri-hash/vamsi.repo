module ApplicationHelper
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      language ||= :plaintext
      CodeRay.scan(code, language).div
    end
  end
=begin
 #some problem with dependency error(EPIPE) occuring
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      if language == nil
        language = "ruby"
        Pygments.highlight(code, lexer: language)
      end
    end
  end
=end
  # Setting up markdown
  def markdown(content)
    renderer = CodeRayify.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_block: true,
      strikethrough: true,
      superscript: true,
      underline: true,
      disable_indented_code_blocks: true,
    }

    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end


end
