/**
 * Created by katemrrr on 22.10.16.
 */
$("#buy").bind("click", function (event, ui) {
    alert("Вы купили товары на сумму " + $("#general_price").val() + " руб.");
});