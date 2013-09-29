require 'spec'

module Spec::Example::ExampleGroupMethods
  def it(description=nil, options={}, backtrace=nil, &implementation)
    if options.has_key? :example_for
      puts "----- in hook, description = #{description}, options = #{options.inspect}"
    end

    example_proxy = Spec::Example::ExampleProxy.new(description, options, backtrace || caller(0)[1])
    example_proxies << example_proxy
    example_implementations[example_proxy] = implementation || pending_implementation
    example_proxy
  end
end
