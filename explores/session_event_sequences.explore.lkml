# explore: session_event_sequences {
#   view_label: "Search Session Events"
#   label: "Search Session Events"

#   join: sessions {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${session_event_sequences.session_id} = ${sessions.session_id} ;;
#   }

#   # join: order_facts {
#   #   from: mv_sales
#   #   type: left_outer
#   #   sql_on: ${sessions.session_id} = ${order_facts.session} ;;
#   #   relationship: many_to_one
#   # }
# }
