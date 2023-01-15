; extends

((class_definition
  (block
    (function_definition
      name: (identifier) @method.dunder)))
  (#match? @method.dunder "__[a-z]+__"))

((identifier) @variable.builtin
  (#eq? @variable.builtin "kwargs"))

(keyword_argument
  name: (identifier) @parameter.keyword)
