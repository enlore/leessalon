$(document).ready ->
    $(window).on 'scroll', ->
        console.log $(window).scrollTop()

    if $(window).width() >= 992
        s = skrollr.init({forceHeight: false})

    $(window).resize (e) ->
        windowWidth = $(window).width()

        if windowWidth >= 992
            if typeof s is "undefined" or s is null
                s = skrollr.init({forceHeight: false})

        else if windowWidth < 992
            if s
                s.destroy()
                s = null
