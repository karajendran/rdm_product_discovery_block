include: "/views/affinity/affinity.view.lkml"
include: "/views/tbl_products.view.lkml"

explore: affinity {
  label: "Affinity Analysis"

  always_filter: {
    filters: {
      field: affinity.product_b_id
      value: "-NULL"
    }
  }

  join: product_a {
    from: tbl_products
    type: left_outer
    view_label: "Product A Details"
    relationship: many_to_one
    sql_on: ${affinity.product_a_id} = ${product_a.id} ;;
  }

  join: product_b {
    from: tbl_products
    type: left_outer
    view_label: "Product B Details"
    relationship: many_to_one
    sql_on: ${affinity.product_b_id} = ${product_b.id} ;;
  }
}