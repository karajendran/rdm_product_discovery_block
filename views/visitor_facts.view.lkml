view: visitor_facts {
  derived_table: {
    explore_source: events {
      column: count {}
      column: count_of_sessions {}
      column: count_of_add_to_cart_events {}
      column: count_of_detail_page_views {}
      column: count_of_purchase_events {}
      column: count_of_purchase_product {}
      column: count_of_transactions {}
      column: count_of_search_events {}
      column: count_of_search_product_results {}
      column: count_of_search_query {}
      column: total_tx_total { field: order_facts.total_tx_total }
      column: total_tax_tx { field: order_facts.total_tax_tx }
      column: visitor_id {}
      column: min_event {}
      column: max_event {}
      # bind_all_filters: yes
    }
  }

  dimension: count {
    hidden: yes
    label: "Events Count of Events"
    description: ""
    type: number
  }

  dimension: count_of_sessions {
    hidden: yes
    description: ""
    type: number
  }

  dimension: count_of_add_to_cart_events {
    hidden: yes
    description: ""
    type: number
  }
  dimension: count_of_detail_page_views {
    hidden: yes
    description: ""
    type: number
  }

  dimension: count_of_purchase_events {
    hidden: yes
    description: ""
    type: number
  }

  dimension: count_of_purchase_product {
    hidden: yes
    label: "Events Count of Purchased Products"
    description: ""
    type: number
  }

  dimension: count_of_transactions {
    hidden: yes
    description: ""
    type: number
  }

  dimension: count_of_search_events {
    hidden: yes
    description: ""
    type: number
  }

  dimension: count_of_search_product_results {
    hidden: yes
    description: ""
    type: number
  }

  dimension: count_of_search_query {
    hidden: yes
    label: "Events Count of Search Queries"
    description: ""
    type: number
  }

  dimension: customer_ltv {
    label: "Customer LTV"
    hidden: yes
    type: number
    sql: ${TABLE}.total_tx_total ;;
  }

  dimension: ltv_tier {
    group_label: "Lifetime Value (LTV)"
    label: "Customer LTV Tier"
    type: tier
    sql: ${customer_ltv} ;;
    tiers: [0,500,1000,1500,2000,2500,3000]
  }

  measure: average_ltv {
    label: "Average Customer Lifetime Value (LTV)"
    type: average
    sql: ${customer_ltv} ;;
  }

  dimension: total_tax_tx {
    hidden: yes
    type: number
  }

  dimension: visitor_id {
    hidden: yes
    primary_key: yes
  }

  dimension_group: created_at {
    label: "User Created At"
    # hidden: yes
    type: time
    sql: ${TABLE}.min_event ;;
  }

  dimension_group: last_visit {
    hidden: yes
    type: time
    sql: ${TABLE}.max_event ;;
  }

}
