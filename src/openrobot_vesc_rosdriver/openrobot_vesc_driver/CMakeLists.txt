cmake_minimum_required(VERSION 2.8.3)
project(openrobot_vesc_driver)

find_package(catkin REQUIRED COMPONENTS
  pluginlib
  roscpp
  std_msgs
  openrobot_vesc_msgs
  serial
)

catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS pluginlib roscpp std_msgs openrobot_vesc_msgs serial
)

###########
## Build ##
###########

include_directories(
  include
  ${Boost_INCLUDE_DIRS}
  ${catkin_INCLUDE_DIRS}
)

# node executable
add_executable(openrobot_vesc_driver_node src/openrobot_vesc_driver_node.cpp
                                          src/openrobot_vesc_driver.cpp
                                          src/openrobot_vesc_interface.cpp
                                          src/openrobot_vesc_packet.cpp
                                          src/openrobot_vesc_packet_factory.cpp)
add_dependencies(openrobot_vesc_driver_node ${catkin_EXPORTED_TARGETS})
target_link_libraries(openrobot_vesc_driver_node ${catkin_LIBRARIES})

#############
## Install ##
#############

install(TARGETS openrobot_vesc_driver_node
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY include/${PROJECT_NAME}/
        DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION})
install(DIRECTORY launch/
        DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/launch)