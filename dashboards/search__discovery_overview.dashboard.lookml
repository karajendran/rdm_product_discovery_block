- dashboard: search__discovery_overview
  title: Search & Discovery Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: HUZBSw6pmwNPiBn74mQNUD
  elements:
  - title: Purchase Events
    name: Purchase Events
    model: base
    explore: events
    type: single_value
    fields: [events.count_of_purchase_events, events.period]
    filters:
      events.compare_to: Period
    sorts: [events.period]
    limit: 500
    dynamic_fields: [{args: [events.count_of_purchase_events], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: events.count_of_purchase_events, label: Percent
          change from previous - Events Count of Purchase Events, source_field: events.count_of_purchase_events,
        table_calculation: percent_change_from_previous_events_count_of_purchase_events,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: Purchase Events
    comparison_label: vs. Previous Period
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#7CB342",
        font_color: '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      Date Range: events.current_date_range
    row: 5
    col: 0
    width: 6
    height: 2
  - title: Average Basket Size
    name: Average Basket Size
    model: base
    explore: events
    type: single_value
    fields: [events.period, order_facts.average_basket_size]
    filters:
      events.compare_to: Period
    sorts: [events.period]
    limit: 500
    dynamic_fields: [{category: table_calculation, label: Percent change from previous
          - Events Count of Purchase Events, value_format: !!null '', value_format_name: percent_0,
        calculation_type: percent_difference_from_previous, table_calculation: percent_change_from_previous_events_count_of_purchase_events,
        args: [order_facts.average_basket_size], _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: Average Basket Size
    comparison_label: vs. Previous Period
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#7CB342",
        font_color: '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      Date Range: events.current_date_range
    row: 9
    col: 0
    width: 6
    height: 2
  - name: "<b>Sales & Purchase Events</b>"
    type: text
    title_text: "<b>Sales & Purchase Events</b>"
    subtitle_text: Use this section to analyze sales performance.
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Average Basket Size (Copy)
    name: Average Basket Size (Copy)
    model: base
    explore: events
    type: single_value
    fields: [events.period, order_facts.average_tx_total]
    filters:
      events.compare_to: Period
    sorts: [events.period]
    limit: 500
    dynamic_fields: [{category: table_calculation, label: Percent change from previous
          - Events Count of Purchase Events, value_format: !!null '', value_format_name: percent_0,
        calculation_type: percent_difference_from_previous, table_calculation: percent_change_from_previous_events_count_of_purchase_events,
        args: [order_facts.average_tx_total], _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: Average Order Price
    comparison_label: vs. Previous Period
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#7CB342",
        font_color: '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      Date Range: events.current_date_range
    row: 11
    col: 0
    width: 6
    height: 2
  - title: Average Basket Size (Copy 2)
    name: Average Basket Size (Copy 2)
    model: base
    explore: events
    type: single_value
    fields: [events.period, events.percentage_of_sessions_converted]
    filters:
      events.compare_to: Period
    sorts: [events.period]
    limit: 500
    dynamic_fields: [{category: table_calculation, label: Percent change from previous
          - Events Count of Purchase Events, value_format: !!null '', value_format_name: percent_0,
        calculation_type: percent_difference_from_previous, table_calculation: percent_change_from_previous_events_count_of_purchase_events,
        args: [events.percentage_of_sessions_converted], _kind_hint: measure, _type_hint: number,
        id: SklqdSch4c}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#34A853"
    single_value_title: Conversion Rate
    comparison_label: vs. Previous Period
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#7CB342",
        font_color: '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Number of sessions with a purchase event divided by total session count.
    listen:
      Date Range: events.current_date_range
    row: 21
    col: 0
    width: 6
    height: 2
  - title: Total Sales
    name: Total Sales
    model: base
    explore: events
    type: single_value
    fields: [events.period, order_facts.total_tx_total]
    filters:
      events.current_date_range: 3 months
      events.compare_to: Period
    sorts: [events.period]
    limit: 500
    dynamic_fields: [{args: [events.count_of_purchase_events], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: events.count_of_purchase_events, label: Percent
          change from previous - Events Count of Purchase Events, source_field: events.count_of_purchase_events,
        table_calculation: percent_change_from_previous_events_count_of_purchase_events,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Total Sales
    value_format: $0.00,"K"
    comparison_label: vs. Previous Period
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [events.period]
    listen:
      Date Range: events.event_date
    row: 2
    col: 0
    width: 6
    height: 3
  - title: Sessions vs Purchase Events
    name: Sessions vs Purchase Events
    model: base
    explore: events
    type: looker_line
    fields: [events.event_date, events.percentage_of_sessions_converted, events.count_of_sessions,
      events.count_of_purchase_events]
    sorts: [events.event_date]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: events.count_of_sessions,
            id: events.count_of_sessions, name: Sessions}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: events.count_of_purchase_events,
            id: events.count_of_purchase_events, name: Purchases}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: events.percentage_of_sessions_converted,
            id: events.percentage_of_sessions_converted, name: 'Conversions:'}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear}]
    series_types:
      events.count_of_sessions: column
      events.percentage_of_sessions_converted: area
    series_colors:
      events.count_of_sessions: "#DADCE0"
      events.count_of_purchase_events: "#4285F4"
      events.percentage_of_sessions_converted: transparent
    series_labels:
      events.count_of_sessions: Sessions
      events.count_of_purchase_events: Purchases
      events.percentage_of_sessions_converted: 'Conversions:'
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: '0.005', label: 0.5% Converted}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    note_state: collapsed
    note_display: hover
    note_text: This chart shows the daily session counts and converted sessions.
    title_hidden: true
    listen:
      Date Range: events.event_date
    row: 2
    col: 6
    width: 18
    height: 7
  - title: Average Basket Size Over Time
    name: Average Basket Size Over Time
    model: base
    explore: events
    type: looker_column
    fields: [order_facts.average_basket_size, events.event_date]
    sorts: [events.event_date]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: order_facts.average_basket_size,
            id: order_facts.average_basket_size, name: Average Basket Size}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    reference_lines: []
    trend_lines: []
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: This chart displays the daily average basket size over time.
    title_hidden: true
    listen:
      Date Range: events.event_date
    row: 9
    col: 6
    width: 18
    height: 2
  - title: Average Sale Over Time
    name: Average Sale Over Time
    model: base
    explore: events
    type: looker_column
    fields: [events.event_date, order_facts.average_tx_total]
    sorts: [events.event_date]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: order_facts.average_basket_size,
            id: order_facts.average_basket_size, name: Average Basket Size}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    reference_lines: []
    trend_lines: []
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: This chart displays the daily average order price over time.
    title_hidden: true
    listen:
      Date Range: events.event_date
    row: 11
    col: 6
    width: 18
    height: 2
  - name: "<b>Session Events</b> "
    type: text
    title_text: "<b>Session Events</b> "
    subtitle_text: Use this section to analyze session performance metrics.
    body_text: ''
    row: 13
    col: 0
    width: 24
    height: 2
  - title: Total Sessions
    name: Total Sessions
    model: base
    explore: events
    type: single_value
    fields: [events.period, sessions.count_of_sessions]
    filters:
      events.compare_to: Period
    sorts: [events.period]
    limit: 500
    dynamic_fields: [{args: [sessions.count_of_sessions], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: sessions.count_of_sessions, label: Percent
          change from previous - Sessions Count of Sessions, source_field: sessions.count_of_sessions,
        table_calculation: percent_change_from_previous_sessions_count_of_sessions,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: SVERhls8VQ}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#34A853"
    single_value_title: Total Sessions
    value_format: 0.00,"K"
    comparison_label: vs. Previous Period
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Date Range: events.current_date_range
    row: 16
    col: 0
    width: 6
    height: 3
  - title: Bounce Percentage
    name: Bounce Percentage
    model: base
    explore: events
    type: single_value
    fields: [events.period, sessions.percent_bounce_sessions]
    filters:
      events.compare_to: Period
    sorts: [events.period]
    limit: 500
    dynamic_fields: [{category: table_calculation, label: Percent change from previous
          - Sessions Count of Sessions, value_format: !!null '', value_format_name: percent_0,
        calculation_type: percent_difference_from_previous, table_calculation: percent_change_from_previous_sessions_count_of_sessions,
        args: [sessions.percent_bounce_sessions], _kind_hint: measure, _type_hint: number,
        id: dtTEHWZWkI}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#34A853"
    single_value_title: Bounced Sessions
    comparison_label: vs. Previous Period
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: Count of single event sessions divided by total session count.
    listen:
      Date Range: events.current_date_range
    row: 23
    col: 0
    width: 6
    height: 2
  - title: Duration
    name: Duration
    model: base
    explore: events
    type: single_value
    fields: [events.period, sessions.average_duration]
    filters:
      events.compare_to: Period
    sorts: [events.period]
    limit: 500
    dynamic_fields: [{category: table_calculation, label: Percent change from previous
          - Sessions Count of Sessions, value_format: !!null '', value_format_name: percent_0,
        calculation_type: percent_difference_from_previous, table_calculation: percent_change_from_previous_sessions_count_of_sessions,
        args: [sessions.average_duration], _kind_hint: measure, _type_hint: number,
        id: WHLlOrGLdo}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#34A853"
    single_value_title: Avg. Duration (Sec)
    comparison_label: vs. Previous Period
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: 'Seconds between first and last event times. '
    listen:
      Date Range: events.current_date_range
    row: 25
    col: 0
    width: 6
    height: 2
  - title: Events Per Session
    name: Events Per Session
    model: base
    explore: events
    type: single_value
    fields: [sessions.average_events_in_session, events.period]
    filters:
      events.compare_to: Period
    sorts: [sessions.average_events_in_session desc 0]
    limit: 500
    dynamic_fields: [{args: [sessions.average_events_in_session], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: sessions.average_events_in_session,
        label: Percent change from previous - Sessions Average Events In Session,
        source_field: sessions.average_events_in_session, table_calculation: percent_change_from_previous_sessions_average_events_in_session,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: KIBufLgKNf}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#34A853"
    single_value_title: Events Per Session
    comparison_label: vs. Previous Period
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Average number of individual events recorded in a session.
    listen:
      Date Range: events.current_date_range
    row: 27
    col: 0
    width: 6
    height: 2
  - title: LTV
    name: LTV
    model: base
    explore: events
    type: single_value
    fields: [events.period, visitor_facts.average_ltv]
    filters:
      events.compare_to: Period
    sorts: [events.period]
    limit: 500
    dynamic_fields: [{args: [events.count_of_purchase_events], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: events.count_of_purchase_events, label: Percent
          change from previous - Events Count of Purchase Events, source_field: events.count_of_purchase_events,
        table_calculation: percent_change_from_previous_events_count_of_purchase_events,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, is_disabled: true, id: 8lcJSFEu8g}, {args: [visitor_facts.average_ltv],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: visitor_facts.average_ltv, label: Percent change from previous -
          User Average Customer Lifetime Value (LTV), source_field: visitor_facts.average_ltv,
        table_calculation: percent_change_from_previous_user_average_customer_lifetime_value_ltv,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: D3RmRrvYdk}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: Avg. LTV
    value_format: ''
    comparison_label: vs. Previous Period
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [events.period]
    listen:
      Date Range: events.current_date_range
    row: 7
    col: 0
    width: 6
    height: 2
  - title: Session Funnel
    name: Session Funnel
    model: base
    explore: events
    type: looker_funnel
    fields: [sessions.all_sessions, sessions.count_product_or_later,
      sessions.count_cart_or_later, sessions.count_purchase]
    limit: 500
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    color_application:
      collection_id: google
      custom:
        id: 4bc168ae-d516-8ef5-9491-f21418efaab2
        label: Custom
        type: continuous
        stops:
        - color: "#DADCE0"
          offset: 0
        - color: "#34A853"
          offset: 100
      options:
        steps: 5
    isStepped: true
    labelOverlap: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: sessions.average_search_queries_per_session,
            id: sessions.average_search_queries_per_session, name: Average Search
              Queries per Session}], showLabels: false, showValues: false, maxValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: sessions.average_search_queries_per_session
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    font_size: '14'
    series_types: {}
    point_style: circle
    series_colors: {}
    show_value_labels: true
    label_density: 25
    label_color: [black]
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    title_hidden: true
    listen:
      Date Range: events.event_date
    row: 16
    col: 6
    width: 9
    height: 6
  - title: Cart to Conversion
    name: Cart to Conversion
    model: base
    explore: events
    type: looker_funnel
    fields: [sessions.count_cart_or_later, sessions.count_purchase]
    limit: 500
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    color_application:
      collection_id: google
      custom:
        id: 4bc168ae-d516-8ef5-9491-f21418efaab2
        label: Custom
        type: continuous
        stops:
        - color: "#DADCE0"
          offset: 0
        - color: "#34A853"
          offset: 100
      options:
        steps: 5
    isStepped: true
    labelOverlap: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: sessions.average_search_queries_per_session,
            id: sessions.average_search_queries_per_session, name: Average Search
              Queries per Session}], showLabels: false, showValues: false, maxValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: sessions.average_search_queries_per_session
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    font_size: '14'
    series_types: {}
    point_style: circle
    series_colors: {}
    show_value_labels: true
    label_density: 25
    label_color: [black]
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    title_hidden: true
    listen:
      Date Range: events.event_date
    row: 19
    col: 15
    width: 9
    height: 3
  - name: ''
    type: text
    title_text: ''
    subtitle_text: "<b>Session Funnel Top/Bottom Zoom-In</b>"
    body_text: ''
    row: 15
    col: 15
    width: 9
    height: 1
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: "<b>Session Funnel</b>"
    body_text: ''
    row: 15
    col: 6
    width: 9
    height: 1
  - title: Sessions to Search
    name: Sessions to Search
    model: base
    explore: events
    type: looker_funnel
    fields: [sessions.all_sessions, sessions.count_product_or_later]
    limit: 500
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    color_application:
      collection_id: google
      custom:
        id: 4bc168ae-d516-8ef5-9491-f21418efaab2
        label: Custom
        type: continuous
        stops:
        - color: "#DADCE0"
          offset: 0
        - color: "#34A853"
          offset: 100
      options:
        steps: 5
    isStepped: true
    labelOverlap: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: sessions.average_search_queries_per_session,
            id: sessions.average_search_queries_per_session, name: Average Search
              Queries per Session}], showLabels: false, showValues: false, maxValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: sessions.average_search_queries_per_session
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    font_size: '14'
    series_types: {}
    point_style: circle
    series_colors: {}
    show_value_labels: true
    label_density: 25
    label_color: [black]
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    title_hidden: true
    listen:
      Date Range: events.event_date
    row: 16
    col: 15
    width: 9
    height: 3
  - title: Sessions Sparkline
    name: Sessions Sparkline
    model: base
    explore: events
    type: looker_line
    fields: [sessions.count_of_sessions, events.event_date]
    sorts: [events.event_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: sessions.count_of_sessions,
            id: sessions.count_of_sessions, name: Count of Sessions}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors:
      sessions.count_of_sessions: "#34A853"
    defaults_version: 1
    title_hidden: true
    listen:
      Date Range: events.event_date
    row: 19
    col: 0
    width: 6
    height: 2
  - title: Cart Abandonment Rate (Search Sessions vs No Search Session)
    name: Cart Abandonment Rate (Search Sessions vs No Search Session)
    model: base
    explore: events
    type: looker_column
    fields: [sessions.cart_abandonment_rate, sessions.session_start_week, search_session]
    pivots: [search_session]
    fill_fields: [sessions.session_start_week]
    sorts: [search_session desc, sessions.session_start_week desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: dimension, expression: 'if(${sessions.includes_search_events},"Session
          Had Search Event","Session Does Not Have Search")', label: Search Session,
        value_format: !!null '', value_format_name: !!null '', dimension: search_session,
        _kind_hint: measure, _type_hint: string, id: GhzKpIHSsA}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: pivot
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: sessions.cart_abandonment_rate,
            id: Yes - sessions.cart_abandonment_rate, name: Yes Search Event}, {axisId: sessions.cart_abandonment_rate,
            id: No - sessions.cart_abandonment_rate, name: No Search Event}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hide_legend: true
    series_types: {}
    series_colors:
      Yes - sessions.cart_abandonment_rate: "#34A853"
      No - sessions.cart_abandonment_rate: "#DADCE0"
      Session Does Not Have Search - sessions.cart_abandonment_rate: "#DADCE0"
      Session Had Search Event - sessions.cart_abandonment_rate: "#34A853"
    series_labels:
      No - sessions.cart_abandonment_rate: No Search Event
      Yes - sessions.cart_abandonment_rate: Yes Search Event
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000"}]
    trend_lines: []
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    title_hidden: true
    listen:
      Date Range: events.event_date
    row: 23
    col: 6
    width: 9
    height: 6
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: "<b>Cart Abandonment Rate (Search Sessions vs. No Search Session)</b>"
    body_text: ''
    row: 22
    col: 7
    width: 8
    height: 1
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: "<b>Bounce Rate (Search Sessions vs. No Search Session)</b>"
    body_text: ''
    row: 22
    col: 15
    width: 9
    height: 1
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: "<b>Session Facts</b>"
    body_text: ''
    row: 15
    col: 0
    width: 6
    height: 1
  - title: Bounce Rate (Search Sessions vs No Search Session)
    name: Bounce Rate (Search Sessions vs No Search Session)
    model: base
    explore: events
    type: looker_column
    fields: [sessions.session_start_week, search_session, sessions.percent_bounce_sessions]
    pivots: [search_session]
    fill_fields: [sessions.session_start_week]
    sorts: [search_session desc, sessions.session_start_week desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: dimension, expression: 'if(${sessions.includes_search_events},"Session
          Had Search Event","Session Does Not Have Search")', label: Search Session,
        value_format: !!null '', value_format_name: !!null '', dimension: search_session,
        _kind_hint: measure, _type_hint: string, id: GhzKpIHSsA}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: pivot
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: sessions.cart_abandonment_rate,
            id: Yes - sessions.cart_abandonment_rate, name: Yes Search Event}, {axisId: sessions.cart_abandonment_rate,
            id: No - sessions.cart_abandonment_rate, name: No Search Event}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hide_legend: true
    series_types: {}
    series_colors:
      Yes - sessions.cart_abandonment_rate: "#34A853"
      No - sessions.cart_abandonment_rate: "#DADCE0"
      Session Does Not Have Search - sessions.cart_abandonment_rate: "#DADCE0"
      Session Had Search Event - sessions.cart_abandonment_rate: "#34A853"
      Session Had Search Event - sessions.percent_bounce_sessions: "#34A853"
      Session Does Not Have Search - sessions.percent_bounce_sessions: "#DADCE0"
    series_labels:
      No - sessions.cart_abandonment_rate: No Search Event
      Yes - sessions.cart_abandonment_rate: Yes Search Event
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000"}]
    trend_lines: []
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    title_hidden: true
    listen:
      Date Range: events.event_date
    row: 23
    col: 15
    width: 9
    height: 6
  - name: "<b>Product & Category Performance</b> "
    type: text
    title_text: "<b>Product & Category Performance</b> "
    subtitle_text: Use this section to analyze how specific products and categories
      are performing.
    body_text: ''
    row: 29
    col: 0
    width: 24
    height: 2
  - title: Top Sold Products
    name: Top Sold Products
    model: base
    explore: events
    type: looker_grid
    fields: [products.title, product_details.total_sales, product_details.total_quantity,
      events.average_purchase_product, events.count_of_detail_page_views, events.count_of_add_to_cart_events,
      events.count_of_purchase_events]
    filters:
      products.title: "-NULL"
    sorts: [product_details.total_sales desc]
    limit: 20
    dynamic_fields: [{category: table_calculation, expression: "${events.count_of_purchase_events}/${events.count_of_add_to_cart_events}",
        label: Cart to Purchase Rate, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: cart_to_purchase_rate, _type_hint: number,
        id: kUir6tmO4U}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '11'
    rows_font_size: '11'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      events.average_purchase_product: Average Basket Size
      events.count_of_add_to_cart_events: Add to Carts
      events.count_of_detail_page_views: Page Views
    series_cell_visualizations:
      product_details.total_sales:
        is_active: true
        palette:
          palette_id: b0c061ec-8ef3-6b31-07dd-3c7348eabd83
          collection_id: google
          custom_colors:
          - "#DADCE0"
          - "#EA4335"
      product_details.total_quantity:
        is_active: false
      events.count_of_add_to_cart_events:
        is_active: false
    series_text_format:
      events.average_purchase_product:
        align: center
      product_details.total_quantity:
        align: center
      events.count_of_detail_page_views:
        align: center
      events.count_of_add_to_cart_events:
        align: center
      cart_to_purchase_rate:
        align: center
    header_font_color: ''
    header_background_color: "#DADCE0"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, custom: {
            id: d5212b91-28f4-7a01-2f32-2ba594f1af26, label: Custom, type: continuous,
            stops: [{color: "#FFF", offset: 0}, {color: "#EA4335", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [events.average_purchase_product]}, {type: along a scale..., value: !!null '',
        background_color: "#4285F4", font_color: !!null '', color_application: {collection_id: google,
          custom: {id: 10a964c3-4808-69cd-0c62-98a984ae0781, label: Custom, type: continuous,
            stops: [{color: "#FFF", offset: 0}, {color: "#EA4335", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [events.count_of_detail_page_views]}, {type: along a scale..., value: !!null '',
        background_color: "#4285F4", font_color: !!null '', color_application: {collection_id: google,
          custom: {id: ebbd434b-cf6a-06c1-bbca-e33e08db80f8, label: Custom, type: continuous,
            stops: [{color: "#FFF", offset: 0}, {color: "#EA4335", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [product_details.total_quantity]}, {type: along a scale..., value: !!null '',
        background_color: "#4285F4", font_color: !!null '', color_application: {collection_id: google,
          custom: {id: 7526db3e-abe2-9435-a496-56f490bb413f, label: Custom, type: continuous,
            stops: [{color: "#FFF", offset: 0}, {color: "#EA4335", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [events.count_of_add_to_cart_events]}, {type: along a scale..., value: !!null '',
        background_color: "#4285F4", font_color: !!null '', color_application: {collection_id: google,
          custom: {id: 26af82a6-b4bf-3394-79b7-e9d79002daba, label: Custom, type: continuous,
            stops: [{color: "#FFF", offset: 0}, {color: "#EA4335", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [cart_to_purchase_rate]}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [events.count_of_purchase_events]
    title_hidden: true
    listen:
      Date Range: events.event_date
    row: 32
    col: 12
    width: 12
    height: 6
  - title: Top Sold Categories
    name: Top Sold Categories
    model: base
    explore: events
    type: looker_grid
    fields: [product_details.total_sales, product_details.total_quantity, events.average_purchase_product,
      events.count_of_detail_page_views, events.count_of_add_to_cart_events, events.count_of_purchase_events,
      categories.tbl_products__categories]
    filters:
      products.title: "-NULL"
    sorts: [product_details.total_sales desc]
    limit: 20
    dynamic_fields: [{category: table_calculation, expression: "${events.count_of_purchase_events}/${events.count_of_add_to_cart_events}",
        label: Cart to Purchase Rate, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: cart_to_purchase_rate, _type_hint: number,
        id: kUir6tmO4U}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '11'
    rows_font_size: '11'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      events.average_purchase_product: Average Basket Size
      events.count_of_add_to_cart_events: Add to Carts
      events.count_of_detail_page_views: Page Views
    series_cell_visualizations:
      product_details.total_sales:
        is_active: true
        palette:
          palette_id: b0c061ec-8ef3-6b31-07dd-3c7348eabd83
          collection_id: google
          custom_colors:
          - "#DADCE0"
          - "#EA4335"
      product_details.total_quantity:
        is_active: false
      events.count_of_add_to_cart_events:
        is_active: false
    series_text_format:
      events.average_purchase_product:
        align: center
      product_details.total_quantity:
        align: center
      events.count_of_detail_page_views:
        align: center
      events.count_of_add_to_cart_events:
        align: center
      cart_to_purchase_rate:
        align: center
    header_font_color: ''
    header_background_color: "#DADCE0"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, custom: {
            id: d5212b91-28f4-7a01-2f32-2ba594f1af26, label: Custom, type: continuous,
            stops: [{color: "#FFF", offset: 0}, {color: "#EA4335", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [events.average_purchase_product]}, {type: along a scale..., value: !!null '',
        background_color: "#4285F4", font_color: !!null '', color_application: {collection_id: google,
          custom: {id: 10a964c3-4808-69cd-0c62-98a984ae0781, label: Custom, type: continuous,
            stops: [{color: "#FFF", offset: 0}, {color: "#EA4335", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [events.count_of_detail_page_views]}, {type: along a scale..., value: !!null '',
        background_color: "#4285F4", font_color: !!null '', color_application: {collection_id: google,
          custom: {id: ebbd434b-cf6a-06c1-bbca-e33e08db80f8, label: Custom, type: continuous,
            stops: [{color: "#FFF", offset: 0}, {color: "#EA4335", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [product_details.total_quantity]}, {type: along a scale..., value: !!null '',
        background_color: "#4285F4", font_color: !!null '', color_application: {collection_id: google,
          custom: {id: 7526db3e-abe2-9435-a496-56f490bb413f, label: Custom, type: continuous,
            stops: [{color: "#FFF", offset: 0}, {color: "#EA4335", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [events.count_of_add_to_cart_events]}, {type: along a scale..., value: !!null '',
        background_color: "#4285F4", font_color: !!null '', color_application: {collection_id: google,
          custom: {id: 26af82a6-b4bf-3394-79b7-e9d79002daba, label: Custom, type: continuous,
            stops: [{color: "#FFF", offset: 0}, {color: "#EA4335", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [cart_to_purchase_rate]}]
    series_value_format:
      product_details.total_sales: $0.00,"K"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [events.count_of_purchase_events]
    title_hidden: true
    listen:
      Date Range: events.event_date
    row: 39
    col: 12
    width: 12
    height: 6
  - title: Unique Products Purchases
    name: Unique Products Purchases
    model: base
    explore: events
    type: single_value
    fields: [events.period, products.count_of_unique_products]
    filters:
      events.compare_to: Period
      events.is_purchase_complete: 'Yes'
    sorts: [events.period]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: measure, expression: '', label: Count of Product ID,
        value_format: !!null '', value_format_name: decimal_0, based_on: product_details.product__id,
        _kind_hint: measure, measure: count_of_product_id, type: count_distinct, _type_hint: number,
        id: tUrkg5wlBA}, {args: [count_of_product_id], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: count_of_product_id, label: Percent
          change from previous -  Count of Product ID, source_field: count_of_product_id,
        table_calculation: percent_change_from_previous_count_of_product_id, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: dimension, _type_hint: number, id: WvINjUrKSz,
        is_disabled: true}, {args: [products.count_of_unique_products], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: products.count_of_unique_products,
        label: Percent change from previous - Products Count of Unique Products, source_field: products.count_of_unique_products,
        table_calculation: percent_change_from_previous_products_count_of_unique_products,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: dimension,
        _type_hint: number, id: 6g6R8bz06L, is_disabled: true}, {args: [products.count_of_unique_products],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: products.count_of_unique_products, label: Percent change from previous
          - Products Count of Unique Products, source_field: products.count_of_unique_products,
        table_calculation: percent_change_from_previous_products_count_of_unique_products_2,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: V7jPEmHHEN}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    single_value_title: Unique Products Sold
    comparison_label: vs. Previous Period
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Count of unique products sold in date range. '
    listen:
      Date Range: events.current_date_range
    row: 32
    col: 0
    width: 6
    height: 2
  - title: Product Result Size
    name: Product Result Size
    model: base
    explore: events
    type: single_value
    fields: [events.period, events.average_search_product_results]
    filters:
      events.compare_to: Period
      events.is_search: 'Yes'
    sorts: [events.period]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: measure, expression: '', label: Count of Product ID,
        value_format: !!null '', value_format_name: decimal_0, based_on: product_details.product__id,
        _kind_hint: measure, measure: count_of_product_id, type: count_distinct, _type_hint: number,
        id: tUrkg5wlBA}, {args: [count_of_product_id], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: count_of_product_id, label: Percent
          change from previous -  Count of Product ID, source_field: count_of_product_id,
        table_calculation: percent_change_from_previous_count_of_product_id, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, id: WvINjUrKSz,
        is_disabled: true}, {args: [events.count_of_search_product_results], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: events.count_of_search_product_results,
        label: Percent change from previous - Events Count of Search Product Results,
        source_field: events.count_of_search_product_results, table_calculation: percent_change_from_previous_events_count_of_search_product_results,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: Z6PIMwX4nP, is_disabled: true}, {args: [events.average_search_product_results],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: events.average_search_product_results, label: Percent change from
          previous - Events Average Search Product Results, source_field: events.average_search_product_results,
        table_calculation: percent_change_from_previous_events_average_search_product_results,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: 5XTdjlg0c2}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    single_value_title: Avg. Product Results
    comparison_label: vs. Previous Period
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Average number of products surfaced in result set for search queries.
    listen:
      Date Range: events.current_date_range
    row: 36
    col: 0
    width: 6
    height: 2
  - title: Most Prevalent Categories in Search Results
    name: Most Prevalent Categories in Search Results
    model: base
    explore: events
    type: looker_wordcloud
    fields: [events.count_of_search_events, categories.tbl_products__categories]
    filters:
      categories.tbl_products__categories: "-NULL"
    sorts: [events.count_of_search_events desc 0]
    limit: 15
    column_limit: 50
    color_application: undefined
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: 'Most surfaced product categories in result sets for search queries. '
    title_hidden: true
    listen:
      Date Range: events.event_date
    row: 39
    col: 6
    width: 6
    height: 6
  - title: Most Prevalent Brands in Search Results
    name: Most Prevalent Brands in Search Results
    model: base
    explore: events
    type: looker_wordcloud
    fields: [events.count_of_search_events, brands.tbl_products__brands]
    filters:
      categories.tbl_products__categories: "-NULL"
    sorts: [events.count_of_search_events desc 0]
    limit: 15
    column_limit: 50
    color_application: undefined
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: 'Most surfaced brands in result sets for search queries. '
    title_hidden: true
    listen:
      Date Range: events.event_date
    row: 32
    col: 6
    width: 6
    height: 6
  - title: Unique Brands Sold
    name: Unique Brands Sold
    model: base
    explore: events
    type: single_value
    fields: [events.period, brands.count_of_unique_brands]
    filters:
      events.compare_to: Period
      events.is_purchase_complete: 'Yes'
    sorts: [events.period]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: measure, expression: '', label: Count of Product ID,
        value_format: !!null '', value_format_name: decimal_0, based_on: product_details.product__id,
        _kind_hint: measure, measure: count_of_product_id, type: count_distinct, _type_hint: number,
        id: tUrkg5wlBA}, {args: [count_of_product_id], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: count_of_product_id, label: Percent
          change from previous -  Count of Product ID, source_field: count_of_product_id,
        table_calculation: percent_change_from_previous_count_of_product_id, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, id: WvINjUrKSz,
        is_disabled: true}, {args: [events.count_of_search_product_results], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: events.count_of_search_product_results,
        label: Percent change from previous - Events Count of Search Product Results,
        source_field: events.count_of_search_product_results, table_calculation: percent_change_from_previous_events_count_of_search_product_results,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: Z6PIMwX4nP, is_disabled: true}, {args: [events.average_search_product_results],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: events.average_search_product_results, label: Percent change from
          previous - Events Average Search Product Results, source_field: events.average_search_product_results,
        table_calculation: percent_change_from_previous_events_average_search_product_results,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: 5XTdjlg0c2, is_disabled: true}, {args: [tbl_products__brands.count_of_unique_brands],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: tbl_products__brands.count_of_unique_brands, label: Percent change
          from previous - Products Count of Unique Brands, source_field: tbl_products__brands.count_of_unique_brands,
        table_calculation: percent_change_from_previous_products_count_of_unique_brands,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: 5Q0ede9eur}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    single_value_title: Unique Brands Sold
    comparison_label: vs. Previous Period
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Count of unique brands sold in date range.
    listen:
      Date Range: events.current_date_range
    row: 34
    col: 0
    width: 6
    height: 2
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: "<b>Most Prevalent Brands in Search Results</b> "
    body_text: ''
    row: 31
    col: 6
    width: 6
    height: 1
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: "<b>Most Prevalent Categories in Search Results</b> "
    body_text: ''
    row: 38
    col: 6
    width: 6
    height: 1
  - name: " (8)"
    type: text
    title_text: ''
    subtitle_text: "<b>Product Category KPIs</b> "
    body_text: ''
    row: 38
    col: 0
    width: 6
    height: 1
  - name: " (9)"
    type: text
    title_text: ''
    subtitle_text: "<b>Product &  Brand KPIs</b> "
    body_text: ''
    row: 31
    col: 0
    width: 6
    height: 1
  - name: " (10)"
    type: text
    title_text: ''
    subtitle_text: "<b>Top Selling Products</b> "
    body_text: ''
    row: 31
    col: 12
    width: 12
    height: 1
  - title: Unique Categories Purchased
    name: Unique Categories Purchased
    model: base
    explore: events
    type: single_value
    fields: [events.period, categories.count_of_unique_categories]
    filters:
      events.compare_to: Period
      events.is_purchase_complete: 'Yes'
    sorts: [events.period]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: measure, expression: '', label: Count of Product ID,
        value_format: !!null '', value_format_name: decimal_0, based_on: product_details.product__id,
        _kind_hint: measure, measure: count_of_product_id, type: count_distinct, _type_hint: number,
        id: tUrkg5wlBA}, {args: [count_of_product_id], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: count_of_product_id, label: Percent
          change from previous -  Count of Product ID, source_field: count_of_product_id,
        table_calculation: percent_change_from_previous_count_of_product_id, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: dimension, _type_hint: number, id: WvINjUrKSz,
        is_disabled: true}, {args: [products.count_of_unique_products], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: products.count_of_unique_products,
        label: Percent change from previous - Products Count of Unique Products, source_field: products.count_of_unique_products,
        table_calculation: percent_change_from_previous_products_count_of_unique_products,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: dimension,
        _type_hint: number, id: 6g6R8bz06L, is_disabled: true}, {args: [products.count_of_unique_products],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: products.count_of_unique_products, label: Percent change from previous
          - Products Count of Unique Products, source_field: products.count_of_unique_products,
        table_calculation: percent_change_from_previous_products_count_of_unique_products_2,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: V7jPEmHHEN, is_disabled: true}, {args: [categories.count_of_unique_categories],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: categories.count_of_unique_categories, label: Percent change from
          previous - Products Count of Unique Categories, source_field: categories.count_of_unique_categories,
        table_calculation: percent_change_from_previous_products_count_of_unique_categories,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: mDYBl33ATG}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    single_value_title: Unique Categories Sold
    comparison_label: vs. Previous Period
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Number of unique product categories sold.
    listen:
      Date Range: events.current_date_range
    row: 39
    col: 0
    width: 6
    height: 2
  - name: " (11)"
    type: text
    title_text: ''
    subtitle_text: "<b>Top Selling Categories</b> "
    body_text: ''
    row: 38
    col: 12
    width: 12
    height: 1
  - title: Page Views Per Category
    name: Page Views Per Category
    model: base
    explore: events
    type: single_value
    fields: [events.period, categories.count_of_unique_categories, events.count_of_detail_page_views]
    filters:
      events.compare_to: Period
      events.is_detail_page_view: 'Yes'
    sorts: [events.period]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: measure, expression: '', label: Count of Product ID,
        value_format: !!null '', value_format_name: decimal_0, based_on: product_details.product__id,
        _kind_hint: measure, measure: count_of_product_id, type: count_distinct, _type_hint: number,
        id: tUrkg5wlBA}, {args: [count_of_product_id], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: count_of_product_id, label: Percent
          change from previous -  Count of Product ID, source_field: count_of_product_id,
        table_calculation: percent_change_from_previous_count_of_product_id, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: dimension, _type_hint: number, id: WvINjUrKSz,
        is_disabled: true}, {args: [products.count_of_unique_products], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: products.count_of_unique_products,
        label: Percent change from previous - Products Count of Unique Products, source_field: products.count_of_unique_products,
        table_calculation: percent_change_from_previous_products_count_of_unique_products,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: dimension,
        _type_hint: number, id: 6g6R8bz06L, is_disabled: true}, {args: [products.count_of_unique_products],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: products.count_of_unique_products, label: Percent change from previous
          - Products Count of Unique Products, source_field: products.count_of_unique_products,
        table_calculation: percent_change_from_previous_products_count_of_unique_products_2,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: V7jPEmHHEN, is_disabled: true}, {args: [categories.count_of_unique_categories],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: categories.count_of_unique_categories, label: Percent change from
          previous - Products Count of Unique Categories, source_field: categories.count_of_unique_categories,
        table_calculation: percent_change_from_previous_products_count_of_unique_categories,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: mDYBl33ATG, is_disabled: true}, {category: table_calculation,
        expression: "${events.count_of_detail_page_views}/${categories.count_of_unique_categories}",
        label: Avg. Page Views per Category, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: avg_page_views_per_category, _type_hint: number,
        id: cLPNvb0xUk}, {args: [avg_page_views_per_category], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: avg_page_views_per_category, label: Percent
          change from previous -  Avg. Page Views per Category, source_field: avg_page_views_per_category,
        table_calculation: percent_change_from_previous_avg_page_views_per_category,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: gbwDGtjUl3}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    single_value_title: Avg. Page Views
    value_format: 0.00,"K"
    comparison_label: vs. Previous Period
    series_types: {}
    defaults_version: 1
    hidden_fields: [events.count_of_detail_page_views, categories.count_of_unique_categories]
    note_state: collapsed
    note_display: hover
    note_text: 'Average number of product detail page views per product category. '
    listen:
      Date Range: events.current_date_range
    row: 41
    col: 0
    width: 6
    height: 2
  - title: Cart Adds Per Category
    name: Cart Adds Per Category
    model: base
    explore: events
    type: single_value
    fields: [events.period, categories.count_of_unique_categories, events.count_of_add_to_cart_events]
    filters:
      events.compare_to: Period
      events.is_add_to_cart: 'Yes'
    sorts: [events.period]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: measure, expression: '', label: Count of Product ID,
        value_format: !!null '', value_format_name: decimal_0, based_on: product_details.product__id,
        _kind_hint: measure, measure: count_of_product_id, type: count_distinct, _type_hint: number,
        id: tUrkg5wlBA}, {args: [count_of_product_id], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: count_of_product_id, label: Percent
          change from previous -  Count of Product ID, source_field: count_of_product_id,
        table_calculation: percent_change_from_previous_count_of_product_id, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: dimension, _type_hint: number, id: WvINjUrKSz,
        is_disabled: true}, {args: [products.count_of_unique_products], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: products.count_of_unique_products,
        label: Percent change from previous - Products Count of Unique Products, source_field: products.count_of_unique_products,
        table_calculation: percent_change_from_previous_products_count_of_unique_products,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: dimension,
        _type_hint: number, id: 6g6R8bz06L, is_disabled: true}, {args: [products.count_of_unique_products],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: products.count_of_unique_products, label: Percent change from previous
          - Products Count of Unique Products, source_field: products.count_of_unique_products,
        table_calculation: percent_change_from_previous_products_count_of_unique_products_2,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: V7jPEmHHEN, is_disabled: true}, {args: [categories.count_of_unique_categories],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: categories.count_of_unique_categories, label: Percent change from
          previous - Products Count of Unique Categories, source_field: categories.count_of_unique_categories,
        table_calculation: percent_change_from_previous_products_count_of_unique_categories,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: mDYBl33ATG, is_disabled: true}, {category: table_calculation,
        expression: "${events.count_of_add_to_cart_events}/${categories.count_of_unique_categories}",
        label: Avg. Cart Adds per Category, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: avg_cart_adds_per_category, _type_hint: number,
        id: ImXsD8FcqE}, {args: [avg_page_views_per_category], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: avg_page_views_per_category, label: Percent
          change from previous -  Avg. Page Views per Category, source_field: avg_page_views_per_category,
        table_calculation: percent_change_from_previous_avg_page_views_per_category,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: gbwDGtjUl3, is_disabled: true}, {args: [events.count_of_add_to_cart_events],
        calculation_type: percent_difference_from_previous, category: table_calculation,
        based_on: events.count_of_add_to_cart_events, label: Percent change from previous
          - Events Count of Add to Cart Events, source_field: events.count_of_add_to_cart_events,
        table_calculation: percent_change_from_previous_events_count_of_add_to_cart_events,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, id: vMwpCAxAhZ}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    single_value_title: Avg. Cart Additions
    value_format: ''
    comparison_label: vs. Previous Period
    series_types: {}
    defaults_version: 1
    hidden_fields: [categories.count_of_unique_categories, events.count_of_add_to_cart_events]
    note_state: collapsed
    note_display: hover
    note_text: Average number of add to cart events per product category.
    listen:
      Date Range: events.current_date_range
    row: 43
    col: 0
    width: 6
    height: 2
  filters:
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: 180 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: base
    explore: events
    listens_to_filters: []
    field: events.current_date_range
