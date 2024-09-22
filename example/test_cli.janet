(def arg-settings
  {:options {:help {:short true
                    :long true
                    :help-message "This is help message"}
             :version {:long true
                       :help-message
                       "This is a message for version option"}}
   :usage "This is a test usage message"})

(defn parse-args [args settings]
  (prompt :result
    (let [options (get settings :options)
          usage (get settings :usage)])
    (return :result {:options {:help {:help-message "This is help message"
                                      :is-used true}
                               :version {:help-message "This is a message for version option"
                                         :is-used false}}
                     :usage "This is a test usage message"})))

(defn action [args settings]
  (let [result (parse-args args settings)]))

(defn main [& args]
  (action args arg-settings))
