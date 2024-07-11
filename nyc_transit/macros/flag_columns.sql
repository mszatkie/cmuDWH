{% macro flag_columns() %}
{% set flag_columns = ['store_and_fwd_flag', 'SR_Flag'] %}
{{ return(flag_columns) }}
{% endmacro %}
