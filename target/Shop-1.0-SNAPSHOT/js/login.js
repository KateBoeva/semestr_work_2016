/**
 * Created by katemrrr on 22.10.16.
 */
var input = $('.input');

input.focusout(function () {
    var text = $(this).val();
    if(text == '') {
        $(this).closest('.data').find('.label').fadeIn();
    }
    else {
        $(this).closest('.data').find('.label').fadeOut();
    }
});