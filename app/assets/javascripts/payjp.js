$(function() {
  $(".right-container__inner__pay").on("click", "input[type=submit]", function(e){
    if (document.getElementById("token_submit") != null) {
        Payjp.setPublicKey("pk_test_4a87d7d582285b7cb18ce2f8");
        e.preventDefault();
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        };
        Payjp.createToken(card, (status, response) => {
          if (status === 200) {
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name");
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            );
            document.inputForm.submit();
          }
      });
    }
  });
});