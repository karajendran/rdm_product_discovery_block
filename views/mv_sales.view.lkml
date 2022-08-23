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
    type: number
    sql: ${TABLE}.basket_size ;;
  }

  measure: total_basket_size {
    type: sum
    sql: ${basket_size} ;;
  }

  measure: average_basket_size {
    type: average
    sql: ${basket_size} ;;
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
    type: number
    sql: ${TABLE}.product_total ;;
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
    label: "Total Transaction Cost"
    type: sum
    sql: ${tx_cost} ;;
  }

  measure: average_tx_cost {
    label: "Average Transaction Cost"
    type: average
    sql: ${tx_cost} ;;
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

  dimension: tx_total {
    type: number
    hidden: yes
    sql: ${TABLE}.tx_total ;;
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
}
