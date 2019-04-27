$(function() {
  var reg_not_nil = new RegExp('\\S');
  var reg_mail_address = new RegExp("^[a-zA-Z0-9.!#$%&'*+\/=?^_'{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
  var reg_alphanumeric_6characters = new RegExp('[a-zA-Z0-9]{6,128}');
  var reg_only_kana = new RegExp("[ ァ-ヺ ]");
  var reg_integer_11_phone_number = new RegExp('0[589]0-?[0-9]{4}-?[0-9]{4}');
  var reg_zip_code = new RegExp('^[0-9]{3}\-[0-9]{4}$');
  var reg_integer_14or16_card_main_number = new RegExp('[0-9]{14,16}');
  var reg_integer_3or4_card_back_number = new RegExp('[0-9]{3,4}');
  var validation = function( test , error ){
    if( test ){
      error.removeClass('active');
    }else{
      error.addClass('active');
    }
  };
  var $window = $(window);

  $('.custom__main').on('click', function() {

    var nickname = $('#user_nickname').val();
    var email = $('#user_email').val();
    var password = $('#user_password').val();
    var password_confirmation = $('#user_confirmation_password').val();
    var family_name = $('#user_profile_attributes_family_name').val();
    var first_name = $('#user_profile_attributes_first_name').val();
    var family_name_kana = $('#user_profile_attributes_family_name_kana').val();
    var first_name_kana = $('#user_profile_attributes_first_name_kana').val();
    var birth_year = $('#user_profile_attributes_birth_year').val();
    var birth_month = $('#user_profile_attributes_birth_month').val();
    var birth_day = $('#user_profile_attributes_birth_day').val();

    var test_nil_nickname = reg_not_nil.test(nickname);
    var test_nil_email = reg_not_nil.test(email);
    var test_fomart_email = reg_mail_address.test(email);
    var test_nil_password = reg_not_nil.test(password);
    var test_fomart_password = reg_alphanumeric_6characters.test(password);
    var test_nil_password_confirmation = reg_not_nil.test(password_confirmation);
    var test_match_password_confirmation = ( password == password_confirmation );
    var test_nil_family_name = reg_not_nil.test(family_name);
    var test_nil_first_name = reg_not_nil.test(first_name);
    var test_nil_family_name_kana = reg_not_nil.test(family_name_kana);
    var test_kana_family_name_kana = reg_only_kana.test(family_name_kana);
    var test_nil_first_name_kana = reg_not_nil.test(first_name_kana);
    var test_kana_first_name_kana = reg_only_kana.test(first_name_kana);
    var test_nil_birth_year = reg_not_nil.test(birth_year);
    var test_nil_birth_month = reg_not_nil.test(birth_month);
    var test_nil_birth_day = reg_not_nil.test(birth_day);

    var test_all_member_information = ( test_nil_nickname && test_nil_email && test_fomart_email && test_nil_password && test_fomart_password && test_nil_password_confirmation && test_match_password_confirmation && test_nil_family_name && test_nil_first_name && test_nil_family_name_kana && test_kana_family_name_kana && test_nil_first_name_kana && test_kana_first_name_kana && test_nil_birth_year && test_nil_birth_month && test_nil_birth_day);

    validation( test_nil_nickname , $('.self-form__nickname__nil'));
    validation( test_nil_email , $('.self-form__email__nil'));
    validation( test_fomart_email , $('.self-form__email__format'));
    validation( test_nil_password_confirmation , $('.self-form__confirmation-password__nil'));
    validation( test_match_password_confirmation , $('.self-form__confirmation-password__match'));
    validation( test_nil_password , $('.self-form__password__nil'));
    validation( test_fomart_password , $('.self-form__password__format'));
    validation( test_nil_family_name , $('.self-form__family-name__nil'));
    validation( test_nil_first_name , $('.self-form__first-name__nil'));
    validation( test_nil_family_name_kana , $('.self-form__family-name-kana__nil'));
    validation( test_kana_family_name_kana , $('.self-form__family-name-kana__kana'));
    validation( test_nil_first_name_kana , $('.self-form__first-name-kana__nil'));
    validation( test_kana_first_name_kana , $('.self-form__first-name-kana__kana'));
    validation( test_nil_birth_year , $('.self-form__birthday__nil'));
    validation( test_nil_birth_month , $('.self-form__birthday__nil'));
    validation( test_nil_birth_day , $('.self-form__birthday__nil'));

    if( test_all_member_information ){
      $('.single-main-container__head__main').removeClass('active');
      $('.right-container__inner__main').removeClass('active');
      $('.single-main-container__head__phone').addClass('active');
      $('.right-container__inner__phone').addClass('active');
      $window.scrollTop(0);
    }
    else {
      $window.scrollTop(0);

    }
  });



  $('.custom__phone').on('click', function() {

    var mobile_phone = $('#user_profile_attributes_mobile_phone').val();

    var test_nil_phone = reg_not_nil.test(mobile_phone);
    var test_format_phone = reg_integer_11_phone_number.test(mobile_phone);
    var test_all_phone_information = ( test_nil_phone && test_format_phone );

    validation( test_nil_phone , $('.self-form__phone__nil'));
    validation( test_format_phone , $('.self-form__phone__format'));

    if( test_all_phone_information ){
      $('.single-main-container__head__phone').removeClass('active');
      $('.right-container__inner__phone').removeClass('active');
      $('.single-main-container__head__address').addClass('active');
      $('.right-container__inner__address').addClass('active');
      $window.scrollTop(0);
    }
    else {
      $window.scrollTop(0);

    }
  });


  $('.custom__address').on('click', function() {

    var relative_family_name = $('#user_address_attributes_relative_family_name').val();
    var relative_first_name = $('#user_address_attributes_relative_first_name').val();
    var relative_family_name_kana = $('#user_address_attributes_relative_family_name_kana').val();
    var relative_first_name_kana = $('#user_address_attributes_relative_first_name_kana').val();
    var zip_code = $('#user_address_attributes_zip_code').val();
    var prefecture_id = $('#user_address_attributes_prefecture_id').val();
    var city = $('#user_address_attributes_city').val();
    var block = $('#user_address_attributes_block').val();
    var building = $('#user_address_attributes_building').val();
    var home_phone = $('#user_address_attributes_home_phone').val();

    var test_nil_relative_family_name = reg_not_nil.test(relative_family_name);
    var test_nil_relative_first_name = reg_not_nil.test(relative_first_name);
    var test_nil_relative_family_name_kana = reg_not_nil.test(relative_family_name_kana);
    var test_kana_relative_family_name_kana = reg_only_kana.test(relative_family_name_kana);
    var test_nil_relative_first_name_kana = reg_not_nil.test(relative_first_name_kana);
    var test_kana_relative_first_name_kana = reg_only_kana.test(relative_first_name_kana);
    var test_nil_zip_code = reg_not_nil.test(zip_code);
    var test_format_zip_code = reg_zip_code.test(zip_code);
    var test_nil_prefecture_id = reg_not_nil.test(prefecture_id);
    var test_nil_city = reg_not_nil.test(city);
    var test_nil_block = reg_not_nil.test(block);

    var test_all_address_information = (test_nil_relative_family_name && test_nil_relative_first_name && test_nil_relative_family_name_kana && test_kana_relative_family_name_kana && test_nil_relative_first_name_kana && test_kana_relative_first_name_kana && test_nil_zip_code && test_format_zip_code && test_nil_prefecture_id && test_nil_city && test_nil_block);

    validation( test_nil_relative_family_name , $('.self-form__relative__family_name__nil'));
    validation( test_nil_relative_first_name , $('.self-form__relative__first_name__nil'));
    validation( test_nil_relative_family_name_kana , $('.self-form__relative__family_name_kana__nil'));
    validation( test_kana_relative_family_name_kana , $('.self-form__relative__family_name_kana__format'));
    validation( test_nil_relative_first_name_kana , $('.self-form__relative__first_name_kana__nil'));
    validation( test_kana_relative_first_name_kana , $('.self-form__relative__first_name_kana__format'));
    validation( test_nil_zip_code , $('.self-form__zip_code__nil'));
    validation( test_format_zip_code , $('.self-form__zip_code__format'));
    validation( test_nil_prefecture_id , $('.self-form__prefecture__nil'));
    validation( test_nil_city , $('.self-form__city__nil'));
    validation( test_nil_block , $('.self-form__block__nil'));

    if( test_all_address_information ){
      $('.single-main-container__head__address').removeClass('active');
      $('.right-container__inner__address').removeClass('active');
      $('.single-main-container__head__pay').addClass('active');
      $('.right-container__inner__pay').addClass('active');
      $window.scrollTop(0);
    }
    else {
      $window.scrollTop(0);
    }
  });
});
