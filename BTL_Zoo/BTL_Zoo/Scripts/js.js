$(function () {
            var showChar = 10, showtxt = "Detail", hidetxt = "Readless";
            //  $('.more').each(function () {
            var content = $('.more').text();
            if (content.length > showChar) {
                var con = content.substr(0, showChar);
                var hcon = content.substr(showChar, content.length - showChar);
                var txt = con + '<span class="dots">...</span><span class="morecontent"><span>' + hcon + '</span>&nbsp;&nbsp;<a href="" class="moretxt">' + showtxt + '</a></span>';
                $('.more').html(txt);
            }
            //  });
            $(".moretxt").click(function () {
                if ($(this).hasClass("sample")) {
                    $(this).removeClass("sample");
                    $(this).text(showtxt);
                } else {
                    $(this).addClass("sample");
                    $(this).text(hidetxt);
                }
                $(this).parent().prev().toggle();
                $(this).prev().toggle();
                return false;
            });
        });