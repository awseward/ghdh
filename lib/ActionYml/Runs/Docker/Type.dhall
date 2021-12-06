-- https://web.archive.org/web/20211128221846/https://docs.github.com/en/actions/creating-actions/metadata-syntax-for-github-actions#runs-for-docker-actions
{ `using` : Text
, image : Text
, env :
    -- TODO
    {}
, pre-entrypoint : Optional Text
, entrypoint : Optional Text
, post-entrypoint : Optional Text
, args : List Text
}
