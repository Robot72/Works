var handlerReady = function () {
        $('#side-menu a').removeClass('active');
        $('#side-menu a').each(function (i, o) {
            if( $(o).attr('href') == location.pathname ) {
                $(o).addClass('active');
            }
        });
    };

    $(document).ready(handlerReady);
