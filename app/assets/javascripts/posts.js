
$(window).scroll(function(){
    url = $('.posts-scroll .next_page').attr('href');
    if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50){
        // $.ajax({
        //     url: $(".pagination .next_page").attr("href"),
        //     datatype: "script",
        //     success: function () {
        //         console.log(arguments);
        //         console.log("Content was loaded");
        //     }
        $('.posts-scroll').text('Loading more content ...')
        $.getScript(url);
        }

});
$(window).scroll();