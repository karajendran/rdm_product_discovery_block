view: mv_sales {
  sql_table_name: `retail-shared-demos.retail.mv_sales`
    ;;

  dimension: primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${day_raw} || ${session} ;;
  }

  dimension: basket_size {
    hidden: yes
    type: number
    sql: ${TABLE}.basket_size ;;
  }

  measure: total_basket_size {
    hidden: yes
    type: sum
    sql: ${basket_size} ;;
  }

  measure: average_basket_size {
    # hidden: yes
    type: average
    sql: ${basket_size} ;;
    value_format_name: decimal_1
  }

  dimension_group: day {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.day ;;
  }

  dimension: product_total {
    hidden: yes
    type: number
    sql: ${TABLE}.product_total ;;
  }

  measure: total_product {
    label: "Total Product Sold"
    type: sum
    sql: ${product_total} ;;
  }

  dimension: session {
    hidden: yes
    type: string
    sql: ${TABLE}.session ;;
  }

  dimension: tx_cost {
    hidden: yes
    type: number
    sql: ${TABLE}.tx_cost ;;
  }

  measure: total_tx_cost {
    label: "Total Transaction Costs"
    type: sum
    sql: ${tx_cost} ;;
    value_format_name: usd
  }

  measure: average_tx_cost {
    label: "Average Transaction Costs"
    type: average
    sql: ${tx_cost} ;;
    value_format_name: usd
  }

  dimension: tx_cur {
    hidden: yes
    type: string
    sql: ${TABLE}.tx_cur ;;
  }

  dimension: tx_id {
    hidden: yes
    type: string
    sql: ${TABLE}.tx_id ;;
  }

  dimension: tx_tax {
    hidden: yes
    type: number
    sql: ${TABLE}.tx_tax ;;
  }

  measure: total_tax_tx {
    label: "Total Taxes"
    type: sum
    sql: ${tx_tax} ;;
    value_format_name: usd
  }

  dimension: tx_total {
    type: number
    hidden: yes
    sql: ${TABLE}.tx_total ;;
  }

  measure: total_tx_total {
    hidden: yes
    label: "Total Sales"
    type: sum
    sql: ${tx_total} ;;
    value_format_name: usd
  }

  measure: average_tx_total {
    label: "Average Sale"
    type: average
    sql: ${tx_total} ;;
    value_format_name: usd
  }

  dimension: user {
    hidden: yes
    type: string
    sql: ${TABLE}.user ;;
  }

  dimension: visitor {
    hidden: yes
    type: string
    sql: ${TABLE}.visitor ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }

  measure: shipping_and_discount {
    type: number
    sql: ${total_tx_total}-${product_total}-${total_tax_tx} ;;
    value_format_name: usd
  }

  measure: liability {
    type: number
    sql: ${total_tax_tx}+${shipping_and_discount} ;;
    value_format_name: usd
  }

  # dimension: gross_margin {
  #   type: number
  #   sql: ${tx_total} - ${tx_tax} - ${tx_cost} ;;
  #   value_format_name: usd
  # }

  # measure: total_gross_margin {
  #   type: sum
  #   sql: ${gross_margin} ;;
  #   value_format_name: usd
  # }

}
