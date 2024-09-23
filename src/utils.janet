(defn parse-args [args settings]
  ```
  # example value
  args: @["test-bin-name" "--help"]
  settings: {:options {:help {:short true :long true :help-message "This is help message"} :version {:long true :help-message "This is a message for version option"} :usage "This is a test usage message"}
  return-value: {:options {:help {:help-message "This is help message" :is-used true} :version {:help-message "This is a message for version option" :is-used false}} :usage "This is a test usage message"}
  ```
  (prompt :result
    (let [options (get settings :options)
          usage (get settings :usage)]
      (return :result {:options {:help {:help-message "This is help message"
                                        :is-used true}
                                 :version {:help-message "This is a message for version option"
                                           :is-used false}}
                       :usage usage}))))

(defn get-short-value [option]
  (let [result (get (get option (get (keys option) 0)) :short)]
    (if-not result
      false
      result)))

(defn get-long-value [option]
  (let [result (get (get option (get (keys option) 0)) :long)]
    (if-not result
      false
      result)))

(defn get-help-message-value [option]
  (let [result (get (get option (get (keys option) 0)) :help-message)]
    (if-not result
      ""
      result)))

(defn append-name-attr [option]
  ```
  example: option = {:help {:short true :help-message "foofoo"} :version {:short true :help-message "Display version"}}
  return-value: [{:name "help" :short true :long false :help-message "foofoo"} {:name "version" :short true :long false :help-message "Display version"}]
  ```
  (let [name (map string (keys option))
        short (get-short-value option)
        long (get-long-value option)
        help-message (get-help-message-value option)]
    (if-not (= (length name) 1)
      (error "The struct which passed to append-name-attr must be only one attribute name, such as: {:help {:short true :long true :help-message \"This is help message\"}}")
      {:name (string/join name) :short short :long long :help-message help-message})))

(defn options-help-message [options] # options -> {:help {:short true :long true :help-message "This is help message"} :version {:short true :long true}}
  (let [params (append-name-attr options)]
    (print (string/join ["  " "\e[1m" "\e[0m"]))))

