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

  dimension: product_details_array_length {
    hidden: yes
    type: number
    sql: ARRAY_LENGTH(${product_details}) ;;
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

  measure: count_of_transactions {
    group_label: "Purchase & Transaction Events"
    label: "Count of Transactions"
    type: count_distinct
    sql: ${purchase_transaction__id} ;;
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

  measure: count_of_search_query {
    group_label: "Search Events"
    label: "Count of Search Queries"
    type: count_distinct
    sql: ${search_query} ;;
  }

  dimension: session_id {
    type: string
    sql: TRIM(UPPER(${TABLE}.session_id)) ;;
  }

  measure: count_of_sessions {
    group_label: "General Counts"
    label: "Count of Sessions"
    type: count_distinct
    sql: ${session_id} ;;
  }

  dimension: user_id {
    type: string
    sql: TRIM(UPPER(${TABLE}.user_id)) ;;
  }

  measure: count_of_users {
    group_label: "General Counts"
    label: "Count of Users"
    type: count_distinct
    sql: ${user_id} ;;
  }

  dimension: visitor_id {
    type: string
    sql: TRIM(UPPER(${TABLE}.visitor_id)) ;;
  }

  measure: count_of_visitors {
    group_label: "General Counts"
    label: "Count of Visitors"
    type: count_distinct
    sql: ${visitor_id} ;;
  }

  measure: count {
    group_label: "General Counts"
    label: "Count of Events"
    type: count
    drill_fields: []
  }

  # WHEN ${event_type} = 'detail-page-view' THEN '1) Detail Page View'
  #             WHEN ${event_type} =  'search' THEN '2) Search'
  #             WHEN ${event_type} =  'add-to-cart' THEN '3) Add To Cart'
  #             WHEN ${event_type} =  'purchase-complete' THEN '4) Purchase'

  measure: count_of_detail_page_views {
    group_label: "Page View Events"
    label: "Count of Detail Page Views"
    type: count
    filters: [event_type: "detail-page-view"]
    drill_fields: []
  }

  measure: count_of_search_events{
    group_label: "Search Events"
    label: "Count of Search Events"
    type: count
    filters: [event_type: "search"]
    drill_fields: [products.id,products.title,count_of_search_events]
  }

  measure: count_of_add_to_cart_events {
    group_label: "Cart Events"
    label: "Count of Add to Cart Events"
    type: count
    filters: [event_type: "add-to-cart"]
    drill_fields: []
  }

  measure: count_of_purchase_events {
    group_label: "Purchase & Transaction Events"
    label: "Count of Purchase Events"
    type: count
    filters: [event_type: "purchase-complete"]
    drill_fields: []
  }

  measure: count_of_purchase_product {
    group_label: "Purchase & Transaction Events"
    label: "Count of Purchased Products"
    type: sum
    filters: [event_type: "purchase-complete"]
    sql:   ${product_details_array_length} ;;
    drill_fields: []
  }

  measure: average_purchase_product {
    group_label: "Purchase & Transaction Events"
    label: "Average Purchased Products"
    type: average
    filters: [event_type: "purchase-complete"]
    sql:   ${product_details_array_length}  ;;
    value_format_name: decimal_0
    drill_fields: []
  }

  measure: count_of_search_product_results {
    group_label: "Search Events"
    label: "Count of Search Product Results"
    type: sum
    filters: [event_type: "search"]
    sql:   ${product_details_array_length}  ;;
    drill_fields: []
  }

  measure: average_search_product_results {
    group_label: "Search Events"
    label: "Average Search Product Results"
    type: average
    filters: [event_type: "search"]
    sql:  ${product_details_array_length} ;;
    value_format_name: decimal_0
    drill_fields: []
  }

  measure: total_impressions {
    group_label: "Search Events"
    label: "Total Impressions"
    type: number
    sql: ${count_of_search_events} + ${count_of_detail_page_views} ;;
    drill_fields: []
  }

  measure: total_converted_sessions {
    group_label: "Purchase & Transaction Events"
    label: "Total Converted Sessions"
    type: count_distinct
    filters: [event_type: "purchase-complete",product_details_array_length: ">0"]
    sql: ${session_id} ;;
  }

  measure: percentage_of_sessions_converted {
    group_label: "Purchase & Transaction Events"
    label: "Percentage of Sessions Converted"
    type: number
    sql: 1.0*${total_converted_sessions}/NULLIF(${count_of_sessions},0) ;;
    value_format_name: percent_4
  }

  measure: total_converted_customers {
    group_label: "Purchase & Transaction Events"
    label: "Total Converted Users"
    type: count_distinct
    filters: [event_type: "purchase-complete",product_details_array_length: ">0"]
    sql: ${user_id} ;;
  }

  measure: percentage_of_users_converted {
    group_label: "Purchase & Transaction Events"
    label: "Percentage of Users Converted"
    type: number
    sql: 1.0*${total_converted_customers}/NULLIF(${count_of_users},0) ;;
    value_format_name: percent_4
  }

}

view: tbl_events__product_details {
  dimension: product__cost {
    type: number
    sql: product.cost ;;
    view_label: "Order Details"
    group_label: "Order Item Details"
    group_item_label: "Cost"
  }

  dimension: product__currency_code {
    type: string
    sql: product.currency_code ;;
    view_label: "Order Details"
    group_label: "Order Item Details"
    group_item_label: "Currency Code"
  }

  dimension: product__id {
    primary_key: yes
    type: string
    sql: product.id ;;
    view_label: "Order Details"
    group_label: "Order Item Details"
    group_item_label: "ID"
  }

  dimension: product__price {
    type: number
    sql: product.price ;;
    view_label: "Order Details"
    group_label: "Order Item Details"
    group_item_label: "Price"
  }

  dimension_group: effective {
    hidden: yes
    view_label: "Order Details"
    group_label: "Order Item Details"
    type: time
    timeframes: [
      date
    ]
    sql: product.price_effective_time ;;
  }

  dimension_group: expire {
    hidden: yes
    view_label: "Order Details"
    group_label: "Order Item Details"
    type: time
    timeframes: [
      date
    ]
    sql: product.price_expire_time ;;
  }

  dimension: quantity {
    view_label: "Order Details"
    group_label: "Order Item Details"
    type: number
    sql: quantity ;;
  }

  measure: total_quantity {
    view_label: "Order Details"
    type: sum
    sql: ${quantity} ;;
  }

  dimension: sales_amount {
    view_label: "Order Details"
    group_label: "Order Item Details"
    hidden: yes
    type: number
    sql: ${quantity} * ${product__price} ;;
    value_format_name: usd
  }

  measure: total_sales {
    hidden: yes
    view_label: "Order Details"
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
