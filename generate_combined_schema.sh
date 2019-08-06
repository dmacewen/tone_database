#!/bin/bash
cat create_extensions.sql create_users_table.sql create_user_settings_table.sql create_beta_testers_table.sql create_capture_sessions_table.sql create_captures_table.sql create_capture_results_table.sql > combined_schema.sql
