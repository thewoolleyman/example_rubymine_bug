require 'spec'

module Spec::Example::ExampleGroupMethods
  def self.alias_method_chain(target, feature)
    # Strip out punctuation on predicates or bang methods since
    # e.g. target?_without_feature is not a valid method name.
    aliased_target, punctuation = target.to_s.sub(/([?!=])$/, ''), $1
    yield(aliased_target, punctuation) if block_given?

    with_method, without_method = "#{aliased_target}_with_#{feature}#{punctuation}", "#{aliased_target}_without_#{feature}#{punctuation}"

    alias_method without_method, target
    alias_method target, with_method

    case
      when public_method_defined?(without_method)
        public target
      when protected_method_defined?(without_method)
        protected target
      when private_method_defined?(without_method)
        private target
    end
  end

  unless method_defined?(:example_without_hook)
    def example_with_hook(description=nil, options={}, backtrace=nil, &implementation)
      if options.has_key? :example_for
        puts "----- in hook, description = #{description}, options = #{options.inspect}"
      end

      example_without_hook(description, options, backtrace, &implementation)
    end

    alias_method_chain :example, :hook
    alias_method :it, :example_with_hook
  end
end
