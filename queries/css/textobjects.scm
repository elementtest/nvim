;; extends

(declaration
  (integer_value) @value.inner) @value.outer

(declaration
  (float_value) @value.inner) @value.outer

(declaration
  (color_value) @value.inner) @value.outer

(declaration
  (plain_value) @value.inner) @value.outer

(declaration
  (call_expression) @value.inner) @value.outer

(declaration
  (property_name) @property.inner
                  @property.outer)
