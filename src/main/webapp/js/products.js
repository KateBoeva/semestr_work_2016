/**
 * Created by katemrrr on 22.10.16.
 */
$(".add").bind("click", function (event, ui) {
    var isRemove = confirm("Удалить данный товар?");
    if(isRemove)
        $.ajax({
            url: "http://localhost:8080/addToBucket/" + $(this).attr('id'),
            type: "POST",
            success: function(){
                alert("Товар добавлен в корзину");
            }
        });
});

$(".delete").bind("click", function (event, ui) {
    $.ajax({
        url: "http://localhost:8080/deleteProduct/" + $(this).attr('id'),
        type: "POST",
        success: function(){
            location.reload();
        }
    });
});