{% macro markup(selling_price,cost_price) %}
({{selling_price}} - {{cost_price}})/{{cost_price}}
{% endmacro %}