#! /usr/bin/env bash
################################################################################
# test_helper.bash -
# Time-stamp: <Thu 2016-03-03 14:54 svarrette>
#
# Copyright (c) 2016 Sebastien Varrette <Sebastien.Varrette@uni.lu>
#
################################################################################

# Colors
COLOR_RED="\033[0;31m"
COLOR_BACK="\033[0m"

# See https://github.com/jasonkarns/bats-assert
# Note: flunk forces a test failure with an optional message
load helpers/assertions/all

print_error_and_exit() {
    echo -e  "${COLOR_RED}***ERROR***${COLOR_BACK} $*"
    exit 1
}

# Now place below your assert helper functions common to all your tests
# Ex: assert_falkor_dotfile_{present|absent} etc.
