# include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
view: session_event_sequences {
  derived_table: {
    sql: WITH session_flat as
          (SELECT
         session_id
         ,event_time
         ,event_type
         , search_query
        ,ROW_NUMBER() OVER(ORDER BY session_id, event_time, event_type ASC) AS event_id
        ,ROW_NUMBER() OVER(PARTITION BY  session_id ORDER BY event_time, event_type ASC) AS event_seq
      FROM ${tbl_events.SQL_TABLE_NAME} as tbl_events

    WHERE  session_id IN (SELECT session_id FROM  ${sessions.SQL_TABLE_NAME} WHERE sessions.count_of_search_events > 0 GROUP BY 1)
      )

      ,next_event_facts as (SELECT session_flat.session_id
      ,session_flat.event_time
      ,session_flat.event_type
      ,session_flat.event_id
      ,session_flat.event_seq
      ,session_flat.search_query
      ,LAST_VALUE(IF(session_flat.event_type = 'search', session_flat.event_seq, NULL)) OVER(PARTITION BY session_flat.session_id ORDER BY session_flat.event_id ASC) as last_search_event_seq
      ,LAST_VALUE(IF(session_flat.event_type = 'search', session_flat.event_time, NULL)) OVER(PARTITION BY session_flat.session_id ORDER BY session_flat.event_id ASC) as last_search_event_time
      ,MIN(CASE WHEN session_flat.event_type = 'search' THEN session_flat.event_id ELSE NULL END) OVER(PARTITION BY session_flat.session_id ORDER BY session_flat.event_id) as first_search_event_in_session
      ,MIN(CASE WHEN session_flat.event_type = 'search' THEN session_flat.event_time ELSE NULL END) OVER(PARTITION BY session_flat.session_id ORDER BY session_flat.event_id) as first_search_event_time_in_session
      ,MIN(CASE WHEN session_flat.event_type = 'search' THEN session_flat.event_seq ELSE NULL END) OVER(PARTITION BY session_flat.session_id ORDER BY session_flat.event_id) as first_search_event_seq_in_session
      ,MIN(CASE WHEN session_flat.event_type = 'detail-page-view' THEN session_flat.event_id ELSE NULL END) OVER(PARTITION BY session_flat.session_id ORDER BY session_flat.event_id) as first_detail_page_view_event_in_session
      ,MIN(CASE WHEN session_flat.event_type = 'detail-page-view' THEN session_flat.event_time ELSE NULL END) OVER(PARTITION BY session_flat.session_id ORDER BY session_flat.event_id) as first_detail_page_view_event_time_in_session
      ,MIN(CASE WHEN session_flat.event_type = 'detail-page-view' THEN session_flat.event_seq ELSE NULL END) OVER(PARTITION BY session_flat.session_id ORDER BY session_flat.event_id) as first_detail_page_view_event_seq_in_session
      ,MIN(CASE WHEN session_flat.event_type = 'add-to-cart' THEN session_flat.event_id ELSE NULL END) OVER(PARTITION BY session_flat.session_id ORDER BY session_flat.event_id) as first_add_to_cart_event_in_session
      ,MIN(CASE WHEN session_flat.event_type = 'add-to-cart' THEN session_flat.event_time ELSE NULL END) OVER(PARTITION BY session_flat.session_id ORDER BY session_flat.event_id) as first_add_to_cart_event_time_in_session
      ,MIN(CASE WHEN session_flat.event_type = 'add-to-cart' THEN session_flat.event_seq ELSE NULL END) OVER(PARTITION BY session_flat.session_id ORDER BY session_flat.event_id) as first_add_to_cart_event_seq_in_session
      ,MIN(CASE WHEN session_flat.event_type = 'purchase-complete' THEN session_flat.event_id ELSE NULL END) OVER(PARTITION BY session_flat.session_id ORDER BY session_flat.event_id) as first_purchase_event_in_session
      ,MIN(CASE WHEN session_flat.event_type = 'purchase-complete' THEN session_flat.event_time ELSE NULL END) OVER(PARTITION BY session_flat.session_id ORDER BY session_flat.event_id) as first_purchase_event_time_in_session
      ,MIN(CASE WHEN session_flat.event_type = 'purchase-complete' THEN session_flat.event_seq ELSE NULL END) OVER(PARTITION BY session_flat.session_id ORDER BY session_flat.event_id) as first_purchase_event_seq_in_session
      ,MIN(session_flat_next_event.event_id) AS next_event_id
      ,MIN(session_flat_next_event.event_seq) AS next_event_seq
      ,MIN(session_flat_next_event.event_time) AS next_event_time
      ,MIN(CASE WHEN session_flat_next_event.event_type = 'search' THEN session_flat_next_event.event_id ELSE NULL END) AS next_search_event
      ,MIN(CASE WHEN session_flat_next_event.event_type = 'search' THEN session_flat_next_event.event_time ELSE NULL END) AS next_search_event_time
      ,MIN(CASE WHEN session_flat_next_event.event_type = 'search' THEN session_flat_next_event.event_seq ELSE NULL END) AS next_search_event_seq
      ,MIN(CASE WHEN session_flat_next_event.event_type = 'detail-page-view' THEN session_flat_next_event.event_id ELSE NULL END) AS next_detail_page_view
      ,MIN(CASE WHEN session_flat_next_event.event_type = 'detail-page-view' THEN session_flat_next_event.event_time ELSE NULL END) AS next_detail_page_view_time
      ,MIN(CASE WHEN session_flat_next_event.event_type = 'detail-page-view' THEN session_flat_next_event.event_seq ELSE NULL END) AS next_detail_page_view_event_seq
      ,MIN(CASE WHEN session_flat_next_event.event_type = 'add-to-cart' THEN session_flat_next_event.event_id ELSE NULL END) AS next_add_to_cart_event
      ,MIN(CASE WHEN session_flat_next_event.event_type = 'add-to-cart' THEN session_flat_next_event.event_time ELSE NULL END) AS next_add_to_cart_event_time
      ,MIN(CASE WHEN session_flat_next_event.event_type = 'add-to-cart' THEN session_flat_next_event.event_seq ELSE NULL END) AS next_add_to_cart_event_seq
      ,MIN(CASE WHEN session_flat_next_event.event_type = 'purchase-complete' THEN session_flat_next_event.event_id ELSE NULL END) AS next_purchase_event
      ,MIN(CASE WHEN session_flat_next_event.event_type = 'purchase-complete' THEN session_flat_next_event.event_time ELSE NULL END) AS next_purchase_event_time
      ,MIN(CASE WHEN session_flat_next_event.event_type = 'purchase-complete' THEN session_flat_next_event.event_seq ELSE NULL END) AS next_purchase_event_seq
      FROM session_flat
      LEFT JOIN session_flat AS session_flat_next_event ON session_flat.session_id = session_flat_next_event.session_id
      AND session_flat.event_id < session_flat_next_event.event_id
      GROUP BY 1,2,3,4,5,6)




      SELECT next_event_facts.*
      ,session_flat.event_type AS next_event_type
      ,session_flat.search_query AS next_search_query
      FROM next_event_facts
      LEFT JOIN session_flat ON next_event_facts.session_id = session_flat.session_id AND next_event_facts.next_event_id = session_flat.event_id
      ORDER BY 1,2
      ;;
    # sql_trigger_value: SELECT TODAY()  ;;
  }

  measure: count {
    label: "Count of Search Session Events"
    type: count
  }

  dimension: session_id {
    hidden: yes
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension_group: event {
    group_label: "First Event Dimensions"
    # hidden: yes
    type: time
    sql: TIMESTAMP(${TABLE}.event_time) ;;
  }

  dimension: event_type {
    group_label: "First Event Dimensions"
    # hidden: yes
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: is_detail_page_view {
    group_label: "Event Type (Yes/No)"
    type: yesno
    sql:  ${event_type} = 'detail-page-view' ;;
    # hidden: yes
  }

  dimension: is_search {
    group_label: "Event Type (Yes/No)"
    type: yesno
    sql:  ${event_type} = 'search' ;;
    # hidden: yes
  }

  measure: count_of_search_events {
    hidden: yes
    type: count
    filters: [is_search: "Yes"]
  }

  dimension: is_add_to_cart {
    group_label: "Event Type (Yes/No)"
    type: yesno
    sql:  ${event_type} = 'add-to-cart' ;;
    hidden: yes
  }

  dimension: is_purchase_complete {
    group_label: "Event Type (Yes/No)"
    type: yesno
    sql:  ${event_type} = 'purchase-complete' ;;
    hidden: yes
  }

  dimension: is_detail_page_view_next {
    group_label: "Next Event Type (Yes/No)"
    type: yesno
    sql:   ${next_event_type} = 'detail-page-view' ;;
    # hidden: yes
  }

  dimension: is_search_next {
    group_label: "Next Event Type (Yes/No)"
    type: yesno
    sql:   ${next_event_type} = 'search' ;;
    hidden: yes
  }

  dimension: is_add_to_cart_next {
    group_label: "Next Event Type (Yes/No)"
    type: yesno
    sql:   ${next_event_type} = 'add-to-cart' ;;
    hidden: yes
  }

  dimension: is_purchase_complete_next {
    group_label: "Next Event Type (Yes/No)"
    type: yesno
    sql:  ${next_event_type} = 'purchase-complete' ;;
    hidden: yes
  }

  # dimension: pk {
  #   hidden: yes
  #   primary_key: yes
  #   type: number
  #   sql: ${session_id} || ${event_raw} || ${event_id} ;;
  # }

  dimension: event_id {
    group_label: "First Event Dimensions"
    # hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.event_id ;;
  }

  dimension: event_seq {
    group_label: "First Event Dimensions"
    label: "Event Sequence"
    # hidden: yes
    type: number
    sql: ${TABLE}.event_seq ;;
  }

  dimension: search_query {
    group_label: "First Event Dimensions"
    label: "Search Query"
    type: string
    sql: ${TABLE}.search_query ;;
  }

  measure: count_of_search_queries {
    type: count_distinct
    hidden: yes
    sql: ${search_query} ;;
  }

  dimension: last_search_event_seq {
    hidden: yes
    type: number
    sql: ${TABLE}.last_search_event_seq ;;
  }

  dimension_group: last_search_event {
    hidden: yes
    type: time
    sql: TIMESTAMP(${TABLE}.last_search_event_time) ;;
  }

  dimension: events_between_search_and_page_view {
    hidden: yes
    type: number
    sql: CASE WHEN ${is_search} THEN ${next_detail_page_view_event_seq} - ${event_seq} ELSE NULL END ;;
  }

  measure: average_events_between_search_and_page_view  {
    type: average
    sql: ${events_between_search_and_page_view} ;;
    value_format_name: decimal_1
  }

  dimension: time_browsing_results {
    hidden: yes
    type: number
    sql: CASE WHEN ${is_search} AND ${is_detail_page_view_next}
                                THEN TIMESTAMP_DIFF(${next_event_raw},${event_raw},second)
              ELSE NULL
              END
                                ;;
  }

  measure: average_time_browsing_results {
    type: average
    sql: ${time_browsing_results} ;;
    value_format_name: decimal_2
  }

  dimension: first_search_event_in_session {
    hidden: yes
    type: number
    sql: ${TABLE}.first_search_event_in_session ;;
  }

  dimension: first_search_event_time_in_session {
    hidden: yes
    type: string
    sql: ${TABLE}.first_search_event_time_in_session ;;
  }

  dimension: first_search_event_seq_in_session {
    hidden: yes
    label: "First Search Event in Session"
    type: number
    sql: ${TABLE}.first_search_event_seq_in_session ;;
  }

  measure: average_first_search_event_seq_in_session {
    label: "Average First Search Event in Session"
    type: average
    sql: ${first_search_event_seq_in_session} ;;
    value_format_name: decimal_0
  }


  dimension: first_detail_page_view_event_in_session {
    hidden: yes
    type: number
    sql: ${TABLE}.first_detail_page_view_event_in_session ;;
  }

  dimension: first_detail_page_view_event_time_in_session {
    hidden: yes
    type: string
    sql: ${TABLE}.first_detail_page_view_event_time_in_session ;;
  }

  dimension: first_detail_page_view_event_seq_in_session {
    hidden: yes
    type: number
    sql: ${TABLE}.first_detail_page_view_event_seq_in_session ;;
  }
  measure: average_first_detail_page_view_event_seq_in_session {
    label: "Average First Detail Page Event in Session"
    type: average
    sql: ${first_detail_page_view_event_seq_in_session} ;;
    value_format_name: decimal_0
  }

  dimension: first_add_to_cart_event_in_session {
    hidden: yes
    type: number
    sql: ${TABLE}.first_add_to_cart_event_in_session ;;
  }

  dimension: first_add_to_cart_event_time_in_session {
    hidden: yes
    type: string
    sql: ${TABLE}.first_add_to_cart_event_time_in_session ;;
  }

  dimension: first_add_to_cart_event_seq_in_session {
    hidden: yes
    type: number
    sql: ${TABLE}.first_add_to_cart_event_seq_in_session ;;
  }

  measure: average_first_add_to_cart_event_seq_in_session {
    label: "Average First Add to Cart Event in Session"
    type: average
    sql: ${first_add_to_cart_event_seq_in_session} ;;
    value_format_name: decimal_0
  }

  dimension: first_purchase_event_in_session {
    hidden: yes
    type: number
    sql: ${TABLE}.first_purchase_event_in_session ;;
  }

  dimension: first_purchase_event_time_in_session {
    hidden: yes
    type: string
    sql: ${TABLE}.first_purchase_event_time_in_session ;;
  }

  dimension: first_purchase_event_seq_in_session {
    hidden: yes
    type: number
    sql: ${TABLE}.first_purchase_event_seq_in_session ;;
  }

  measure: average_first_purchase_event_seq_in_session {
    label: "Average First Purchase Event in Session"
    type: average
    sql: ${first_purchase_event_seq_in_session} ;;
    value_format_name: decimal_0
  }

  dimension: next_event_id {
    hidden: yes
    type: number
    sql: ${TABLE}.next_event_id ;;
  }

  dimension: next_event_seq {
    hidden: yes
    type: number
    sql: ${TABLE}.next_event_seq ;;
  }

  dimension: is_bounce_event {
    type: yesno
    sql: ${next_event_id} = 'Bounce' ;;
  }

  dimension_group: next_event {
    group_label: "Next Event Dimensions"
    # hidden: yes
    type: time
    sql: TIMESTAMP(${TABLE}.next_event_time) ;;
  }

  dimension: duration_between_events {
    hidden: yes
    type: duration_second
    sql_start: ${event_raw};;
    sql_end: ${next_event_raw};;
  }

  measure: average_duration_between_events {
    type: average
    sql: ${duration_between_events} ;;
    value_format_name: decimal_2
  }

  dimension: next_search_event {
    hidden: yes
    type: number
    sql: ${TABLE}.next_search_event ;;
  }

  dimension_group: next_search_event {
    hidden: yes
    type: time
    sql: TIMESTAMP(${TABLE}.next_search_event_time_ ;;
  }

  dimension: next_search_event_seq {
    hidden: yes
    type: number
    sql: ${TABLE}.next_search_event_seq ;;
  }

  dimension: next_detail_page_view {
    hidden: yes
    type: number
    sql: ${TABLE}.next_detail_page_view ;;
  }

  dimension: next_detail_page_view_time {
    hidden: yes
    type: string
    sql: ${TABLE}.next_detail_page_view_time ;;
  }

  dimension: next_detail_page_view_event_seq {
    hidden: yes
    type: number
    sql: ${TABLE}.next_detail_page_view_event_seq ;;
  }

  dimension: next_add_to_cart_event {
    hidden: yes
    type: number
    sql: ${TABLE}.next_add_to_cart_event ;;
  }

  dimension: next_add_to_cart_event_time {
    hidden: yes
    type: string
    sql: ${TABLE}.next_add_to_cart_event_time ;;
  }

  dimension: next_add_to_cart_event_seq {
    hidden: yes
    type: number
    sql: ${TABLE}.next_add_to_cart_event_seq ;;
  }

  dimension: next_purchase_event {
    hidden: yes
    type: number
    sql: ${TABLE}.next_purchase_event ;;
  }

  dimension: next_purchase_event_time {
    hidden: yes
    type: string
    sql: ${TABLE}.next_purchase_event_time ;;
  }

  dimension: next_purchase_event_seq {
    hidden: yes
    type: number
    sql: ${TABLE}.next_purchase_event_seq ;;
  }

  dimension: next_event_type {
    group_label: "Next Event Dimensions"
    type: string
    sql: NULLIF(${TABLE}.next_event_type,'Bounce') ;;
  }

  dimension: next_search_query {
    group_label: "Next Event Dimensions"
    type: string
    sql: ${TABLE}.next_search_query ;;
  }

  dimension: is_click_through {
    hidden: yes
    type: yesno
    sql: ${is_search} AND ${is_detail_page_view_next} ;;
  }

  measure: total_click_throughs {
    type: count
    filters: [is_click_through:"Yes"]
  }

  measure: click_through_rate {
    label: "Clickthrough Rate (CTR)"
    type: number
    sql: 1.0*${total_click_throughs}/NULLIF(${count_of_search_events},0) ;;
    value_format_name: percent_2
  }

  dimension: is_search_to_purchase {
    hidden: yes
    type: yesno
    sql: ${is_search} AND ${next_purchase_event_seq} < ${next_search_event_seq} ;;
  }

  measure: total_search_to_purchase {
    hidden: yes
    type: count
    filters: [is_search_to_purchase: "Yes"]
  }

  measure: purchase_rate_per_search {
    label: "Search to Purchase Rate"
    type: number
    sql: 1.0*${total_search_to_purchase}/NULLIF(${count_of_search_events},0) ;;
    value_format_name: percent_2
  }

  set: detail {
    fields: [
      session_id,
      event_time,
      event_type,
      event_id,
      event_seq,
      search_query,
      first_search_event_in_session,
      first_search_event_time_in_session,
      first_search_event_seq_in_session,
      first_detail_page_view_event_in_session,
      first_detail_page_view_event_time_in_session,
      first_detail_page_view_event_seq_in_session,
      first_add_to_cart_event_in_session,
      first_add_to_cart_event_time_in_session,
      first_add_to_cart_event_seq_in_session,
      first_purchase_event_in_session,
      first_purchase_event_time_in_session,
      first_purchase_event_seq_in_session,
      next_event_id,
      next_event_seq,
      next_event_time,
      next_search_event,
      next_search_event_time,
      next_search_event_seq,
      next_detail_page_view,
      next_detail_page_view_time,
      next_detail_page_view_event_seq,
      next_add_to_cart_event,
      next_add_to_cart_event_time,
      next_add_to_cart_event_seq,
      next_purchase_event,
      next_purchase_event_time,
      next_purchase_event_seq,
      next_event_type,
      next_search_query
    ]
  }
}
