REPORT ZTVENDAS.

DATA: s_mat  TYPE ztmaterial,
      lv_cod TYPE ztmaterial-codigo.

PARAMETERS:
  p_codigo TYPE ztmaterial-codigo OBLIGATORY,
  p_desc   TYPE ztmaterial-descricao,
  p_unven  TYPE ztmaterial-un_venda,
  p_peso   TYPE ztmaterial-peso,
  p_unpeso TYPE ztmaterial-un_peso.

PARAMETERS: c_cod TYPE abap_bool AS CHECKBOX.

AT SELECTION-SCREEN.

  SELECT SINGLE codigo
    FROM ztmaterial
    INTO @lv_cod
    WHERE codigo = @p_codigo.

  IF sy-subrc = 0 AND c_cod = abap_false.

    MESSAGE 'Codigo Existente' TYPE 'E'.
    RETURN.

  ENDIF.

START-OF-SELECTION.

  s_mat-codigo = p_codigo.
  s_mat-descricao = p_desc.
  s_mat-un_venda = p_unven.
  s_mat-peso = p_peso.
  s_mat-un_peso = p_unpeso.

  IF lv_cod IS NOT INITIAL.

    UPDATE ztmaterial
    SET descricao = @p_desc
    WHERE codigo = @p_codigo.

    IF sy-subrc = 0.
      MESSAGE: 'Atualizado' TYPE 'S'.
    ENDIF.

  ELSE.

    INSERT ztmaterial FROM s_mat.

    IF sy-subrc = 0.
      MESSAGE: 'Adicionado' TYPE 'S'.
    ENDIF.

  ENDIF.
