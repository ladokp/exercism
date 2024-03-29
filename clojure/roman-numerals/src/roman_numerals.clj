(ns roman-numerals)

(def ^:private numeral-mapping [[1000  "M"]
                                [ 900 "CM"]
                                [ 500  "D"]
                                [ 400 "CD"]
                                [ 100  "C"]
                                [  90 "XC"]
                                [  50  "L"]
                                [  40 "XL"]
                                [  10  "X"]
                                [  9  "IX"]
                                [  5   "V"]
                                [  4  "IV"]
                                [  1   "I"]])

(defn- largest-factor [number]
  (first (filter (fn [[part letter]] (<= part number)) numeral-mapping)))

(defn numerals [number]
  (if
   (zero? number) ""
   (let [[part letter] (largest-factor number) remainder (- number part)]
     (str letter (numerals remainder)))))