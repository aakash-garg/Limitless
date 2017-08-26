
$(window).scroll(function(){
    url = $('.pagination .next_page').attr('href');
    if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50){
        // $.ajax({
        //     url: $(".pagination .next_page").attr("href"),
        //     datatype: "script",
        //     success: function () {
        //         console.log(arguments);
        //         console.log("Content was loaded");
        //     }
        $('.pagination').text('Loading more content ...')
        $.getScript(url);
        }

});
$(window).scroll();