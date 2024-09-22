(defn parse-args [args settings]
  (prompt :result
    (let [options (get settings :options)
          usage (get settings :usage)])
    (return :result {:options {:help {:help-message "This is help message"
                                      :is-used true}
                               :version {:help-message "This is a message for version option"
                                         :is-used false}}
                     :usage "This is a test usage message"})))

(defn append-name-attr [option] # example: option = {:help {:short true :help-message "foofoo"}}
  (let [name (map string (keys option))]
    (if-not (= (length name) 1)
      (error "The struct which passed to append-name-attr must be only one attribute name, such as: {:help {:short true :long true :help-message \"This is help message\"}}")
      {:name (string/join name)})))

(defn options-help-message [options]
  (let [params ()]
    (print (string/join ["  " "\e[1m"  "\e[0m"]))))

(defn action [args settings]
  (let [result (parse-args args settings)
        usage (get result :usage)
        options (get result :options)]
    (print (string/join ["\e[4mUsage:\e[0m " usage]))
    (print "")
    (print (string/join ["\e[4mOptions:\e[0m"]))
    (print (options-help-message options))))
