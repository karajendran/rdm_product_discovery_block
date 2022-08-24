view: sessions {
  derived_table: {
    explore_source: events {
      column: session_id {}
      # column: user_id {}
      column: visitor_id {}
      column: count {}
      column: count_of_add_to_cart_events {}
      column: count_of_detail_page_views {}
      column: count_of_purchase_events {}
      column: count_of_purchase_product {}
      column: count_of_transactions {}
      column: count_of_search_events {}
      column: count_of_search_product_results {}
      column: count_of_search_query {}
      column: min_event {}
      column: max_event {}
      # bind_all_filters: yes
    }
  }

  #####  Basic Web Info  ########

  dimension: pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${session_id} || ${visitor_id} ;;
  }

  dimension: session_id {
    hidden: yes
  }

  dimension: number_of_events_in_session {
    hidden: yes
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension: count_of_add_to_cart_events {
    hidden: yes
    type: number
  }

  dimension: count_of_detail_page_views {
    hidden: yes
    type: number
  }

  dimension: count_of_purchase_events {
    hidden: yes
    type: number
  }

  dimension: count_of_purchase_product {
    hidden: yes
    type: number
  }

  dimension: count_of_transactions {
    hidden: yes
    type: number
  }

  dimension: count_of_search_events {
    hidden: yes
    type: number
  }

  dimension: count_of_search_product_results {
    hidden: yes
    type: number
  }

  dimension: count_of_search_query {
    hidden: yes
    type: number
  }

  dimension_group: session_start {
    hidden: yes
    type: time
    sql: ${TABLE}.min_event ;;
  }

  dimension_group: session_end {
    hidden: yes
    type: time
    sql: ${TABLE}.max_event ;;
  }

  # dimension: user_id {
  #   hidden: yes
  #   type: string
  # }

  dimension: visitor_id {
    hidden: yes
    type: string
  }

  dimension: duration {
    label: "Duration (Sec)"
    type: duration_second
    sql_start: ${session_start_raw} ;;
    sql_end: ${session_end_raw} ;;
  }

  measure: average_duration {
    group_label: "General"
    label: "Average Duration (Sec)"
    type: average
    value_format_name: decimal_2
    sql: ${duration} ;;
  }

  dimension: duration_seconds_tier {
    label: "Duration Tier (Sec)"
    type: tier
    tiers: [10, 30, 60, 120, 300]
    style: integer
    sql: ${duration} ;;
  }

  dimension: months_since_first_session {
    label: "Months Since First Session"
    type: number
    sql: date_diff(DATE(${session_start_raw}), DATE(${visitor_facts.created_at_raw}), MONTH ) ;;
  }

  measure: spend_per_session {
    hidden: yes
    type: number
    value_format_name: usd
    sql: 1.0*${product_details.total_sales} / NULLIF(${count_of_sessions},0) ;;
  }

  measure: spend_per_purchase {
    hidden: yes
    type: number
    value_format_name: usd
    sql: 1.0*${product_details.total_sales} / NULLIF(${count_with_purchase_event},0) ;;
  }

  measure: count_of_sessions {
    group_label: "General"
    type: count
  }

  #####  Bounce Information  ########

  dimension: is_bounce_session {
    label: "Is Bounce Session"
    type: yesno
    sql: ${number_of_events_in_session} = 1 ;;
  }

  measure: count_bounce_sessions {
    group_label: "Bounce"
    label: "Count (Bounce Sessions)"
    type: count

    filters: {
      field: is_bounce_session
      value: "Yes"
    }
  }

  measure: percent_bounce_sessions {
    group_label: "Bounce"
    label: "% Bounce Sessions"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${count_bounce_sessions} / nullif(${count_of_sessions},0) ;;
  }

####### Session by event types included  ########

  dimension: includes_add_to_cart {
    group_label: "Events (Yes/No)"
    label: "Includes Add To Cart"
    type: yesno
    sql: ${count_of_add_to_cart_events} > 0 ;;
  }

  dimension: includes_detail_page_views {
    group_label: "Events (Yes/No)"
    label: "Includes Detail Page View"
    type: yesno
    sql: ${count_of_detail_page_views} > 0 ;;
  }

  dimension: includes_search_events {
    group_label: "Events (Yes/No)"
    label: "Includes Search Event"
    type: yesno
    sql: ${count_of_search_events} > 0 ;;
  }

  dimension: includes_purchase_event {
    group_label: "Events (Yes/No)"
    label: "Includes Purchase Event"
    type: yesno
    sql: ${count_of_purchase_events} > 0 ;;
  }

  dimension: includes_search_query {
    group_label: "Events (Yes/No)"
    label: "Includes Search Query"
    type: yesno
    sql: ${count_of_search_query} > 0 ;;
  }

  measure: count_with_add_to_cart {
    group_label: "Sessions with Events"
    label: "Count with Add To Cart"
    type: count
    filters: {
      field: includes_add_to_cart
      value: "Yes"
    }
  }

  measure: count_with_purchase_event {
    group_label: "Sessions with Events"
    label: "Count with Purchase Event"
    type: count
    filters: {
      field: includes_purchase_event
      value: "Yes"
    }
  }

  measure: count_with_detail_page_view {
    group_label: "Sessions with Events"
    label: "Count with Detail Page View"
    type: count
    filters: {
      field: includes_detail_page_views
      value: "Yes"
    }
  }

  measure: count_with_search_events {
    group_label: "Sessions with Events"
    label: "Count with Search Events"
    type: count
    filters: {
      field: includes_search_events
      value: "Yes"
    }
  }

  measure: count_with_search_queries {
    group_label: "Sessions with Events"
    label: "Count with Search Queries"
    type: count
    filters: {
      field: includes_search_query
      value: "Yes"
    }
  }

  ####### Linear Funnel   ########

  dimension: furthest_funnel_step {
    label: "Furthest Funnel Step"
    sql: CASE
      WHEN ${count_of_purchase_events} > 0 THEN '(5) Purchase'
      WHEN ${count_of_add_to_cart_events} > 0 THEN '(4) Add to Cart'
      WHEN ${count_of_detail_page_views} > 0 THEN '(3) View Product'
      WHEN ${count_of_search_events} > 0 THEN '(2) Search'
      ELSE '(1) Land'
      END
       ;;
  }

  measure: all_sessions {
    group_label: "Funnel View"
    label: "(1) All Sessions"
    type: count
  }

  measure: count_search_or_later {
    group_label: "Funnel View"
    label: "(2) Search or later"
    type: count
    filters: {
      field: furthest_funnel_step
      value: "(2) Search,(3) View Product,(4) Add to Cart,(5) Purchase"
    }
  }

  measure: count_product_or_later {
    group_label: "Funnel View"
    label: "(3) View Product or later"
    type: count
    filters: {
      field: furthest_funnel_step
      value: "(3) View Product,(4) Add to Cart,(5) Purchase"
    }
  }

  measure: count_cart_or_later {
    group_label: "Funnel View"
    label: "(4) Add to Cart or later"
    type: count
    filters: {
      field: furthest_funnel_step
      value: "(4) Add to Cart,(5) Purchase"
    }
  }

  measure: count_purchase {
    group_label: "Funnel View"
    label: "(5) Purchase"
    type: count
    filters: {
      field: furthest_funnel_step
      value: "(5) Purchase"
    }
  }

  measure: cart_to_checkout_conversion {
    group_label: "Funnel View"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${count_purchase} / nullif(${count_cart_or_later},0) ;;
  }

  measure: overall_conversion {
    group_label: "Funnel View"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${count_purchase} / nullif(${count_of_sessions},0) ;;
  }

}
