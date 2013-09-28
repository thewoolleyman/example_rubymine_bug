Reproducing [http://devnet.jetbrains.com/message/5492206](http://devnet.jetbrains.com/message/5492206)

To Reproduce:

* Run bundle install
* Run sample_spec from within Rubymine
* Double Click on the "should return 1" result line in Rubymine spec runner

Expected:

* Should highlight 'it "should return 1" do' line in sample_spec.rb

Actual:

* Highlights 'example_without_hook(description, options, backtrace, &implementation)' line in spec_helper.rb