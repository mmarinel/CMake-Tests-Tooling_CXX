/**
 * @file lib.cpp
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2024-03-04
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#include "config.hpp"

#include <iostream>

void print_project_infos()
{
	std::cout
		<< "PROJECT: "
		<< project_name << "; VERSION: "
		<< project_version
		<< std::endl;
}
