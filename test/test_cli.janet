(import ../src :prefix "janet-clap/")

(def arg-settings
  {:options {:help {:short true
                    :long true
                    :help-message "This is help message"}
             :version {:long true
                       :help-message
                       "This is a message for version option"}}
   :usage "This is a test usage message"})

(def args @["test-bin-name" "--help"])
(janet-clap/action args arg-settings)
