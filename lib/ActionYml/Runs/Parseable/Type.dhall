{ `using` : Text
, __compositeFields__ :
    -- ============================================= Composite fields start here
    Optional <>
, steps : List ../Composite/Step/Type.dhall
, __dockerFields__ :
    -- ================================================ Docker fields start here
    Optional <>
, image : Optional Text
, env :
    -- TODO: Implement env
    Optional {}
, pre-entrypoint : Optional Text
, entrypoint : Optional Text
, post-entrypoint : Optional Text
, args : List Text
, __javascriptFields__ :
    -- ============================================ Javascript fields start here
    Optional <>
, main : Optional Text
, pre : Optional Text
, pre-if : Optional Text
, post : Optional Text
, post-if : Optional Text
}
