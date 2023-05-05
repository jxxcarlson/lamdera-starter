module View.Main exposing (view)

import Element as E exposing (Element)
import Element.Background as Background
import Element.Font as Font
import Html exposing (Html)
import Message
import Types exposing (..)
import View.Color
import View.Footer
import View.Geometry
import View.Header
import View.Style
import View.Utility


type alias Model =
    FrontendModel


view : Model -> Html FrontendMsg
view model =
    E.layoutWith { options = [ E.focusStyle View.Utility.noFocus ] }
        [ View.Style.bgGray 0.2, E.clipX, E.clipY, E.height (E.px (View.Geometry.appHeight model)) ]
        (mainColumn model)


mainColumn : Model -> Element FrontendMsg
mainColumn model =
    E.column (mainColumnStyle model)
        [ View.Header.view model
        , case model.currentUser of
            Nothing ->
                E.column [ E.height (E.px (View.Geometry.mainColumnHeight model - 200)), E.centerX, E.centerY, E.spacing 18 ]
                    [ E.image [ E.height (E.px (View.Geometry.mainColumnHeight model - 300)), E.centerX, E.centerY ]
                        { src = "https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/30f08d58-dbce-42a0-97a6-512735707700/public"
                        , description = "bird"
                        }
                    , E.paragraph
                        [ View.Style.fgGray 0.6
                        , Font.size 14
                        , E.paddingEach { top = 19, bottom = 0, left = 0, right = 0 }
                        , E.centerX
                        , E.width (E.px (View.Geometry.appWidth model - 370))
                        ]
                        [ E.text "This is a starter app "
                        ]

                    ]

            Just _ ->
                E.text "HO HO HO!"
        , View.Footer.view model
        ]


mainColumnStyle model =
    [ E.centerX
    , E.centerY
    , View.Style.bgGray 0.02
    , E.spacing 18
    , E.paddingEach { top = View.Geometry.hPadding, bottom = 0, left = 0, right = 0 }
    , E.width (E.px <| View.Geometry.appWidth model)
    , E.height (E.px (View.Geometry.appHeight model))
    ]


title : String -> Element msg
title str =
    E.row [ E.centerX, View.Style.bgGray 0.9 ] [ E.text str ]
