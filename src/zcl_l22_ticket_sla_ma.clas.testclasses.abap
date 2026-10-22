CLASS ltc_ticket_sla DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS high_standard FOR TESTING.
    METHODS normal_standard FOR TESTING.
    METHODS high_vip FOR TESTING.
    METHODS normal_vip FOR TESTING.
    METHODS invalid_standard FOR TESTING.
    METHODS invalid_vip FOR TESTING.
    METHODS lowercase_standart FOR TESTING.
    METHODS lowercase_vip FOR TESTING.

ENDCLASS.

CLASS ltc_ticket_sla IMPLEMENTATION.

  METHOD high_standard.
    DATA(actual) = zcl_l22_ticket_sla_ma=>response_hours(
      iv_priority = 'H'
      iv_is_vip   = abap_false ).

    cl_abap_unit_assert=>assert_equals(
      exp = 2
      act = actual
      msg = 'High-priority response time must be 2 hours' ).
  ENDMETHOD.

  METHOD normal_standard.
    DATA(actual) = zcl_l22_ticket_sla_ma=>response_hours(
      iv_priority = 'N'
      iv_is_vip   = abap_false ).

    cl_abap_unit_assert=>assert_equals(
      exp = 8
      act = actual
      msg = 'Normal-priority response time must be 8 hours' ).
  ENDMETHOD.

  METHOD high_vip.
    DATA(actual) = zcl_l22_ticket_sla_ma=>response_hours(
    iv_priority = 'H'
    iv_is_vip = abap_true ).

    cl_abap_unit_assert=>assert_equals(
      exp = 1
      act = actual
      msg = 'High-priority response time must be 1 hours' ).


  ENDMETHOD.

  METHOD normal_vip.
    DATA(actual) = zcl_l22_ticket_sla_ma=>response_hours(
    iv_priority = 'N'
    iv_is_vip = abap_true ).

    cl_abap_unit_assert=>assert_equals(
      exp = 7
      act = actual
      msg = 'Normal-priority response time must be 7 hours' ).
  ENDMETHOD.

  METHOD invalid_standard.
    DATA(actual) = zcl_l22_ticket_sla_ma=>response_hours(
    iv_priority = 'X'
    iv_is_vip = abap_false ).

    cl_abap_unit_assert=>assert_equals(
      exp = 0
      act = actual
      msg = 'Invalid-priority response time must be 0 hours' ).
  ENDMETHOD.

  METHOD invalid_vip.
   DATA(actual) = zcl_l22_ticket_sla_ma=>response_hours(
    iv_priority = 'X'
    iv_is_vip = abap_true ).

    cl_abap_unit_assert=>assert_equals(
      exp = 0
      act = actual
      msg = 'Invalid-priority response time must be 0 hours' ).
  ENDMETHOD.

  METHOD lowercase_standart.
     DATA(actual) = zcl_l22_ticket_sla_ma=>response_hours(
    iv_priority = 'n'
    iv_is_vip = abap_false ).

    cl_abap_unit_assert=>assert_equals(
      exp = 0
      act = actual
      msg = 'Lowercase-priority response time must be 0 hours' ).

  ENDMETHOD.

  METHOD lowercase_vip.
     DATA(actual) = zcl_l22_ticket_sla_ma=>response_hours(
    iv_priority = 'n'
    iv_is_vip = abap_true ).

    cl_abap_unit_assert=>assert_equals(
      exp = 0
      act = actual
      msg = 'Lowercase-priority response time must be 0 hours' ).

  ENDMETHOD.

ENDCLASS.

