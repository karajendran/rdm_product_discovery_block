view: tbl_events {
  sql_table_name: `retail-shared-demos.retail.tbl_events`
    ;;

  dimension: pk {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${event_raw} || ${session_id} ;;
  }

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.event_time ;;
  }

  dimension: event_type {
    hidden: yes
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: event_type_new {
    label: "Event Type"
    type: string
    sql: CASE WHEN ${event_type} = 'detail-page-view' THEN '1) Detail Page View'
              WHEN ${event_type} =  'search' THEN '2) Search'
              WHEN ${event_type} =  'add-to-cart' THEN '3) Add To Cart'
              WHEN ${event_type} =  'purchase-complete' THEN '4) Purchase'
              ELSE 'Other'
              END;;
  }

  dimension: product_details {
    hidden: yes
    sql: ${TABLE}.product_details ;;
  }

  dimension: purchase_transaction__cost {
    type: number
    sql: ${TABLE}.purchase_transaction.cost ;;
    group_label: "Purchase Transaction"
    group_item_label: "Cost"
  }

  dimension: purchase_transaction__currency_code {
    type: string
    sql: ${TABLE}.purchase_transaction.currency_code ;;
    group_label: "Purchase Transaction"
    group_item_label: "Currency Code"
  }

  dimension: purchase_transaction__id {
    type: string
    sql: ${TABLE}.purchase_transaction.id ;;
    group_label: "Purchase Transaction"
    group_item_label: "ID"
  }

  dimension: purchase_transaction__revenue {
    type: number
    sql: ${TABLE}.purchase_transaction.revenue ;;
    group_label: "Purchase Transaction"
    group_item_label: "Revenue"
  }

  dimension: purchase_transaction__tax {
    type: number
    sql: ${TABLE}.purchase_transaction.tax ;;
    group_label: "Purchase Transaction"
    group_item_label: "Tax"
  }

  dimension: search_query {
    type: string
    sql: TRIM(UPPER(${TABLE}.search_query)) ;;
  }

  dimension: session_id {
    type: string
    sql: TRIM(UPPER(${TABLE}.session_id)) ;;
  }

  dimension: user_id {
    type: string
    sql: TRIM(UPPER(${TABLE}.user_id)) ;;
  }

  dimension: visitor_id {
    type: string
    sql: TRIM(UPPER(${TABLE}.visitor_id)) ;;
  }

  measure: count {
    label: "Count of Events"
    type: count
    drill_fields: []
  }

  # WHEN ${event_type} = 'detail-page-view' THEN '1) Detail Page View'
  #             WHEN ${event_type} =  'search' THEN '2) Search'
  #             WHEN ${event_type} =  'add-to-cart' THEN '3) Add To Cart'
  #             WHEN ${event_type} =  'purchase-complete' THEN '4) Purchase'

  measure: count_of_detail_page_views {
    label: "Count of Detail Page Views"
    type: count
    filters: [event_type: "detail-page-view"]
    drill_fields: []
  }

  measure: count_of_search_events{
    label: "Count of Search Events"
    type: count
    filters: [event_type: "search"]
    drill_fields: [products.id,products.title,count_of_search_events]
  }

  measure: count_of_add_to_cart_events {
    label: "Count of Add to Cart Events"
    type: count
    filters: [event_type: "add-to-cart"]
    drill_fields: []
  }

  measure: count_of_purchase_events {
    label: "Count of Purchase Events"
    type: count
    filters: [event_type: "purchase-complete"]
    drill_fields: []
  }
}

view: tbl_events__product_details {
  dimension: product__cost {
    type: number
    sql: product.cost ;;
    group_label: "Product"
    group_item_label: "Cost"
  }

  dimension: product__currency_code {
    type: string
    sql: product.currency_code ;;
    group_label: "Product"
    group_item_label: "Currency Code"
  }

  dimension: product__id {
    primary_key: yes
    type: string
    sql: product.id ;;
    group_label: "Product"
    group_item_label: "ID"
  }

  dimension: product__price {
    type: number
    sql: product.price ;;
    group_label: "Product"
    group_item_label: "Price"
  }

  dimension_group: effective {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: product.price_effective_time ;;
  }

  dimension_group: expire {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: product.price_expire_time ;;
  }

  dimension: quantity {
    type: number
    sql: quantity ;;
  }

  dimension: sales_amount {
    hidden: yes
    type: number
    sql: ${quantity} * ${product__price} ;;
    value_format_name: usd
  }

  measure: total_sales {
    type: sum
    sql: ${sales_amount} ;;
    value_format_name: usd
  }

  dimension: tbl_events__product_details {
    type: string
    hidden: yes
    sql: tbl_events__product_details ;;
  }
}
