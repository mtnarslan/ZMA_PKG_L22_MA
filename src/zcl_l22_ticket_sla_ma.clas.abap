CLASS zcl_l22_ticket_sla_ma DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES ty_priority TYPE c  LENGTH 1.

    CLASS-METHODS response_hours
      IMPORTING
        iv_priority TYPE ty_priority
        iv_is_vip   TYPE abap_bool
      RETURNING VALUE(rv_hours) TYPE i.
ENDCLASS.

CLASS zcl_l22_ticket_sla_ma IMPLEMENTATION.

  METHOD response_hours.

    CASE iv_priority.

        WHEN 'N'.
          IF iv_is_vip = abap_true.
            rv_hours = 7.
          ELSE.
            rv_hours = 8.
          ENDIF.

        WHEN 'H'.
          IF iv_is_vip = abap_true.
            rv_hours = 1.
          ELSE.
            rv_hours = 2.
          ENDIF.

        WHEN 'X'.
          IF iv_is_vip = abap_true.
            rv_hours = 0.
          ELSE.
            rv_hours = 0.
          ENDIF.

        WHEN OTHERS.
            rv_hours = 2.

    ENDCASE.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

    DATA(hours) = response_hours(
      iv_priority = 'h'
      iv_is_vip   = abap_false ).


    out->write( |High-priority result: { hours } hour(s)| ).
    out->write( 'Expected: 2 hour(s)' ).

  ENDMETHOD.

ENDCLASS.
