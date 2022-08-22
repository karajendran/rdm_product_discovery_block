connection: "looker-retailshared"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: events {
  from: tbl_events

  join: product_details {
    from: tbl_events__product_details
    sql: LEFT JOIN UNNEST(${events.product_details}) as tbl_events__product_details
         LEFT JOIN UNNEST([product]) as product;;
    relationship: one_to_many
  }

  join: products {
    from: tbl_products
    sql_on: ${product_details.product__id} = ${products.id} ;;
    relationship: one_to_many
  }

  join: categories {
    from: tbl_products__categories
    view_label: "Categories"
    sql: LEFT JOIN UNNEST(${products.categories}) as tbl_products__categories ;;
    relationship: one_to_many
  }

}
