################ Constants ################

constant: EVENTS_TABLE {
  ##value: "instance.retail_api.tbl_events"
  value: "`retail-shared-demos.retail.tbl_events`"
  export: override_optional
}

constant: PRODUCTS_TABLE {
  ##value: "instance.retail_api.tbl_products"
  value: "`retail-shared-demos.retail.tbl_products`"
  export: override_optional
}

constant: SALES_MATERIALIZED_VIEW {
  ##value: "instance.retail_api.mv_sales"
  value: "`retail-shared-demos.retail.mv_sales`"
  export: override_optional
}

constant: CONNECTION {
  ##value: "bq-connection"
  value: "looker-retailshared"
  export: override_optional
}
