/**
 * @file main.cpp
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2024-03-04
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#include "lib.hpp"

#include <iostream>
#include <spdlog/spdlog.h>
#include <nlohmann/json.hpp>

int main(int argc, char const *argv[])
{(void)argc, (void)argv;

	print_project_infos();
// int	a[2];
// a[2] = 1337;
// std::cout << a[2] << std::endl;
	std::cout << "loaded nlohmann_json lib, VERSION: "
	<< NLOHMANN_JSON_VERSION_MAJOR << "."
	<< NLOHMANN_JSON_VERSION_MINOR << "."
	<< NLOHMANN_JSON_VERSION_PATCH << "."
	<< std::endl;
	
	std::cout << "loaded spdlog lib, VERSION: "
	<< SPDLOG_VER_MAJOR << "."
	<< SPDLOG_VER_MINOR << "."
	<< SPDLOG_VER_PATCH << "."
	<< std::endl;
	
	return 0;
}
