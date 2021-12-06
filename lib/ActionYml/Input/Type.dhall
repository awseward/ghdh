let YmlPrimitive = ../../YmlPrimitive/Type.dhall

in  { default : Optional YmlPrimitive
    , deprecationMessage : Optional Text
    , description : Text
    , required : Bool
    }
