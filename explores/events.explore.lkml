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

  join: tbl_products__brands {
    from: tbl_products__brands
    # view_label: "Brands"
    sql: LEFT JOIN UNNEST(${products.brands}) as tbl_products__brands ;;
    relationship: one_to_many
  }

  join: price_info {
    from: tbl_products__price_info
    sql: LEFT JOIN UNNEST(${products.price_info}) as tbl_events__product_details ;;
    relationship: one_to_many
    }

  join: categories {
    from: tbl_products__categories
    # view_label: "Categories"
    sql: LEFT JOIN UNNEST(${products.categories}) as tbl_products__categories ;;
    relationship: one_to_many
  }

  join: order_facts {
    from: mv_sales
    view_label: "Order Details"
    sql_on: ${events.purchase_transaction__id} = ${order_facts.tx_id} ;;
    relationship: one_to_many
  }

}