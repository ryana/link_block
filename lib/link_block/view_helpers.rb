module LinkBlock
  module ViewHelpers

    class LinkBlockBuilder

      def initialize(controller, options)
        @controller = controller
        @url_options = options[:url_options]
        @html_options = options[:html_options]
      end

      def link_to(*args, &block)
        if block_given?
          url_options = get_url_options(args.first)
          html_options = args.second.merge(@html_options)
          link_to(capture(&block), url_options, html_options)
        else
          link_text = args.first
          url_options = get_url_options(args.second)
          html_options = (args.third || {}).merge(@html_options)
        end

        if LinkBlock::Config.current_class_enabled and @controller.current_page?(url_options)
          html_options[:class] ||= ""
          html_options[:class] += " #{LinkBlock::Config.current_class_name}"
        end

        @controller.link_to(link_text, url_options, html_options) 
      end

      private
      def get_url_options(url)
        raise 'url params mismatch' unless url.class == @url_options.class

        @url_options.class == Hash ? url.merge(@url_options) : @url_options + url
      end

    end

    def link_block(*args, &block)
      url_options = args.first
      html_options = args.second || {}

      if html_options and html_options.class != Hash
        raise 'link_block requires html_options to be a Hash'
      end

      if url_options.class != Hash and url_options.class != String
        raise 'link_block requires url_options to be Hash or String -- and for your sake it really should be a Hash :-)'
      end

      yield LinkBlockBuilder.new(self, :url_options => url_options, :html_options => html_options)
    end

  end
end
