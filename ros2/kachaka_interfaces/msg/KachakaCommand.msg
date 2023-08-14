uint8 COMMAND_TYPE_OTHER=0
uint8 MOVE_SHELF_COMMAND=1
uint8 RETURN_SHELF_COMMAND=2
uint8 UNDOCK_SHELF_COMMAND=5
uint8 MOVE_TO_LOCATION_COMMAND=7
uint8 RETURN_HOME_COMMAND=8
uint8 DOCK_SHELF_COMMAND=9
uint8 SPEAK_COMMAND=12
uint8 MOVE_TO_POSE_COMMAND=13

uint8 command_type

# NOTE: only used for MOVE_SHELF_COMMAND
string move_shelf_command_target_shelf_id
string move_shelf_command_destination_location_id
bool move_shelf_command_undock_on_destination

# NOTE: only used for RETURN_SHELF_COMMAND
string return_shelf_command_target_shelf_id

# NOTE: only used for UNDOCK_SHELF_COMMAND
string undock_shelf_command_target_shelf_id

# NOTE: only used for MOVE_TO_LOCATION_COMMAND
string move_to_location_command_target_location_id

# NOTE: only used for RETURN_HOME_COMMAND
bool return_home_command_silent

# NOTE: only used for SPEAK_COMMAND
string speak_command_text

# NOTE: only used for MOVE_TO_POSE_COMMAND
float64 move_to_pose_command_x
float64 move_to_pose_command_y
float64 move_to_pose_command_yaw
