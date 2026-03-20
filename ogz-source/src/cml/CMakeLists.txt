file(GLOB src
    "Include/*.h"
    "source/*.cpp"
    "source/*.c"
)

add_target(NAME cml TYPE STATIC SOURCES "${src}")

target_include_directories(cml PUBLIC
	.
	Include
	${ZLIB_INCLUDE_DIRS}
	${OPENSSL_INCLUDE_DIR}
	../sdk/rapidxml/include
	../sdk/rapidjson/include
)

if (WIN32)
	target_include_directories(cml PUBLIC ../sdk/curl/include)
else()
	target_include_directories(cml PUBLIC ${LibCURL_INCLUDE_DIR})
endif()


if (WIN32)
	target_link_libraries(cml PUBLIC
		rpcrt4.lib
	)
endif()

if (UNIX)
	target_include_directories(cml PUBLIC ../sdk/pevents/src)
	target_link_libraries(cml PUBLIC pthread pevents)
endif()


target_link_libraries(cml PUBLIC
	${ZLIB_LIBRARIES}
	${OPENSSL_LIBRARIES}
)

if (WIN32)
	target_link_libraries(cml PUBLIC curl)
else()
	target_link_libraries(cml PUBLIC ${LibCURL_LIBRARIES})
endif()