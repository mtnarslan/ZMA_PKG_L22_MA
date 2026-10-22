CLASS zcl_l22_ticket_sla_ma DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES ty_priority TYPE c LENGTH 1.

    CLASS-METHODS response_hours
      IMPORTING
        iv_priority TYPE ty_priority
        iv_is_vip   TYPE abap_bool
      RETURNING VALUE(rv_hours) TYPE i.
ENDCLASS.

CLASS zcl_l22_ticket_sla_ma IMPLEMENTATION.

  METHOD response_hours.

    IF iv_priority = 'H'.
      rv_hours = 4.
    ELSE.
      rv_hours = 8.
    ENDIF.

    IF iv_is_vip = abap_true.
      rv_hours = rv_hours + 1.
    ENDIF.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

    DATA(hours) = response_hours(
      iv_priority = 'H'
      iv_is_vip   = abap_false ).

    out->write( |High-priority result: { hours } hour(s)| ).
    out->write( 'Expected: 2 hour(s)' ).

  ENDMETHOD.

ENDCLASS.
