(function_declaration
  body: (statement_block) @function.inner)

(if_statement
  consequence: (statement_block) @conditional.inner)

(if_statement
  alternative: (else_clause
    (statement_block) @conditional.inner))
