require 'rubygems'
require 'spec/runner/formatter/progress_bar_formatter'
require 'appscript'

gem 'rb-appscript', '>= 0.5.1'

module Spec
  module Runner
    module Formatter
      class ItermColorProgressFormatter < ProgressBarFormatter
        @@anything_failed_ever = false
        @@anything_pended_ever = false
        
        PASS_COLOR = [0, 16385, 0]
        FAIL_COLOR = [16385, 0, 0]
        PEND_COLOR = [32768, 32768, 0]
        
        def initialize(a,b)
          super
          iterm = Appscript::app('iTerm')
          @@term = iterm.current_terminal.sessions.get.find {|sess| sess.get == iterm.current_terminal.current_session.get }
          @@original_color = @@term.background_color.get
        end
        
        def set_iterm_bg(color)
          @@term.background_color.set color
        end
        
        def start_dump
          # uncomment this if you don't want the final color left on the screen
          # @@current_terminal.background_color.set @@original_color
          super
        end
        
        def example_passed(example)
          unless @@anything_pended_ever || @@anything_failed_ever
            set_iterm_bg(PASS_COLOR)
          end
          super
        end
        
        def example_failed(example, counter, failure)
          unless @@anything_failed_ever
            @@anything_failed_ever = true
            set_iterm_bg(FAIL_COLOR)
          end
          super
        end
        
        def example_pending(example, message, pending_caller)
          unless @@anything_pended_ever || @@anything_failed_ever
            @@anything_pended_ever = true
            set_iterm_bg(PEND_COLOR)
          end
          super
        end
      end
    end
  end
end
