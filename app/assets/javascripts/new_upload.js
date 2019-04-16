$(function() {

  $("#field").on("click", function() {
    $("input[type=file]").click();
  });
  
  var fileChoiceArea = [];

  $(".file").each(function(i){
    $("#product_images_attributes_" + i + "_image").parent().hide();
    if(!$("#product_images_attributes_" + i + "_id").val() == ""){
      return true;
    } else if ($("#product_images_attributes_" + i + "_image").val() == ""){
      fileChoiceArea.push($("#product_images_attributes_" + i + "_image"));
      fileChoiceArea[0].parent().show();
    }
    i++;
  });

  $(".preview").each(function(index){
      var count = $("li").find("img").length;
      var partsWidth = count * 160;
      $(".product-single-container__upload-drop-box").width(620 - partsWidth);
  });

  $(".product-single-container__upload-item").each(function(i){
    $(".delete" + i).on("click", function(){
      $(".delete" + i).parents(".product-single-container__upload-item").remove();
      $("#product_images_attributes_" + i + "_image").val("");
      $("#product_images_attributes_" + i + "_image").parent().show();
      $("#product_images_attributes_" + i + "_image").parent().siblings(".product-single-container__upload-drop-box").hide();
      editImgWidth();
      return false;
    });
  });

  $(".product-single-container__upload-drop-box").each(function(i){
    $(this).addClass("have-item" + (i));
    i++;
  });

  function editImgWidth() {
    $(".preview").each(function(index){
      var count = $("li").find("img").length;
      var partsWidth = count * 131;
      $(".product-single-container__upload-drop-box").width(620 - partsWidth);
    });
  }
  
  function addFloatCss() {
    $(".product-single-container__upload-drop-box").css('float', 'right');
  }

  function countPreviewImages() {
    return $(".product-single-container__upload-item").length;
  }

  $("form").on("change", 'input[type="file"]', function(){
    var fileInput = $(this).attr("id");
    var i = 0;
    $(".file").each(function(){
      if(fileInput == "product_images_attributes_" + i + "_image"){
        var fileProp = $("#product_images_attributes_" + i + "_image").prop("files")[0],
            fileReader = new FileReader(),
            previewBox = $(".preview"),
            fileField = $("#product_product_images_attributes_" + i + "_image").parent(),
            previewList = `<li class="product-single-container__upload-item product-single-container__upload-item${i}"><figure class="product-single-container__upload-item-figure"><img alt="" class="img${i}"></figure><div class="product-single-container__upload-button"><a href="">編集</a><a href="" id="delete" class="delete${i}">削除</a></div></li>`;
            previewBox.append(previewList);
            fileField.hide();

            fileReader.onload = function(){
              previewBox.children(".product-single-container__upload-item").last().find("img").attr("src", fileReader.result);
                previewBox.children(".product-single-container__upload-item").last().find("#delete").on("click", function(){
                  $(this).parents(".product-single-container__upload-item").remove();
                  fileField.show();
                  fileField.find("input[type=file]").val('');
                  fileField.siblings(".product-single-container__upload-drop-box").hide();
                  editImgWidth();
                  return false;
                });
            }

            editImgWidth();
            addFloatCss()
            fileReader.readAsDataURL(fileProp);
      }
    i++;
    });
  });
});
