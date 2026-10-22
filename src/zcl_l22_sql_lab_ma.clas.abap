CLASS zcl_l22_sql_lab_ma DEFINITION
  PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_l22_sql_lab_ma IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " These are demonstration records in our own table.
    TYPES ty_rows TYPE STANDARD TABLE OF zl22_orders_ma
      WITH EMPTY KEY.

    DATA(rows) = VALUE ty_rows(
      ( order_id = '000001'
        customer = 'ALICE' priority = 'H' amount = '100' )
      ( order_id = '000002'
        customer = 'BOB'   priority = 'N' amount = '50' )
      ( order_id = '000003'
        customer = 'CARLA' priority = 'H' amount = '200' )
      ( order_id = '000004'
        customer = 'DAVID' priority = 'N' amount = '70' )
      ( order_id = '000005'
        customer = 'ELENA' priority = 'H' amount = '125' )
      ( order_id = '000006'
        customer = 'EVA'   priority = ' ' amount = '125' ) ).

    MODIFY zl22_orders_ma FROM TABLE @rows.

    " Example A: reads all columns and all rows in this table.
    SELECT FROM zl22_orders_ma
      FIELDS *
      INTO TABLE @DATA(all_orders).

    " Example B: reads only the two columns and rows we need.
    SELECT FROM zl22_orders_ma
      FIELDS order_id, amount
      WHERE priority = 'H' AND amount > 110
      INTO TABLE @DATA(high_priority_orders).

    out->write( |Rows read by broad query: { lines( all_orders ) }| ).
    out->write( |High-priority rows: { lines( high_priority_orders ) }| ).
    out->write( high_priority_orders ).

  ENDMETHOD.
ENDCLASS.
