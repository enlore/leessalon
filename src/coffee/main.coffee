$ ->
    $(window).on 'scroll', ->
        console.log $(window).scrollTop()

    s = skrollr.init({forceHeight: false})
