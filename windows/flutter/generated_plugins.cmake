# 
# Generated file, do not edit. 
# 

list(APPEND FLUTTER_PLUGIN_LIST 
cloud_firestore 
firebase_auth 
firebase_core 
) 

list(APPEND FLUTTER_FFI_PLUGIN_LIST 
) 

set(PLUGIN_BUNDLED_LIBRARIES) 

foreach(plugin ${FLUTTER_PLUGIN_LIST}) 
add_subdirectory(flutter/ephemeral/.plugin_symlinks/${plugin}/windows plugins/${plugin}) 
target_link_libraries(${BINARY_NAME} PRIVATE ${plugin}_plugin) 
list(APPEND 