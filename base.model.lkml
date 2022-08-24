connection: "looker-retailshared"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/sessions/*.view.lkml"
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

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

  join: visitor_facts {
    view_label: "User"
    type: left_outer
    sql_on: ${sessions.visitor_id} = ${visitor_facts.visitor_id} ;;
    relationship: many_to_one
  }

  join: products {
    from: tbl_products
    sql_on: ${product_details.product__id} = ${products.id} ;;
    relationship: one_to_many
  }

  join: price_info {
    from: tbl_products__price_info
    sql: LEFT JOIN UNNEST(${products.price_info}) as tbl_events__product_details ;;
    relationship: one_to_many
    }

  join: categories {
    from: tbl_products__categories
    view_label: "Categories"
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
