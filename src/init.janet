(import ./utils)

(defn action [args settings]
  (let [result (utils/parse-args args settings)
        usage (get result :usage)
        options (get result :options)]
    (print (string/join ["\e[4mUsage:\e[0m " usage]))
    (print "")
    (print (string/join ["\e[4mOptions:\e[0m"]))
    (print (utils/options-help-message options))))
