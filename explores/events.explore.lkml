include: "/views/tbl_events.view.lkml"
include: "/views/sessions/sessions.view.lkml"
include: "/views/sessions/session_event_sequences.view.lkml"
include: "/views/visitor_facts.view.lkml"
include: "/views/tbl_products.view.lkml"
include: "/views/mv_sales.view.lkml"



explore: events {
  from: tbl_events

  join: product_details {
    from: tbl_events__product_details
    sql: LEFT JOIN UNNEST(${events.product_details}) as tbl_events__product_details
         LEFT JOIN UNNEST([product]) as product
         LEFT JOIN UNNEST([price_info]) as price_info ;;
    relationship: one_to_many
  }

  join: sessions {
    type: left_outer
    sql_on: ${events.session_id} = ${sessions.session_id} ;;
    relationship: many_to_one
  }

  join: session_event_sequences {
    view_label: "Search Session Event Details"
    type: left_outer
    relationship: many_to_many
    sql_on: ${sessions.session_id} = ${session_event_sequences.session_id} ;;
  }

  join: visitor_facts {
    view_label: "User"
    type: left_outer
    sql_on: ${sessions.user_id} = ${visitor_facts.user_id} ;;
    relationship: many_to_one
  }

  join: products {
    from: tbl_products
    sql_on: ${product_details.product__id} = ${products.id} ;;
    relationship: one_to_many
  }

  join: brands {
    from: tbl_products__brands
    sql: LEFT JOIN UNNEST(${products.brands}) as tbl_products__brands ;;
    relationship: one_to_many
  }

  join: categories {
    from: tbl_products__categories
    sql: LEFT JOIN UNNEST(${products.categories}) as tbl_products__categories ;;
    relationship: one_to_many
  }

  join: sizes {
    from: tbl_products__sizes
    sql: LEFT JOIN UNNEST(${products.sizes}) as tbl_products__sizes ;;
    relationship: one_to_many
  }

  join: images {
    from: tbl_products__images
    sql: LEFT JOIN UNNEST(${products.images}) as tbl_products__images ;;
    relationship: one_to_many
  }

  join: colors {
    from: tbl_products__colors
    sql: LEFT JOIN UNNEST(${products.colors}) as tbl_products__colors ;;
    relationship: one_to_many
  }

  join: conditions {
    from: tbl_products__conditions
    sql: LEFT JOIN UNNEST(${products.conditions}) as tbl_products__conditions ;;
    relationship: one_to_many
  }

  join: order_facts {
    from: mv_sales
    sql_on: ${events.purchase_transaction__id} = ${order_facts.tx_id} ;;
    relationship: one_to_many
  }

}
