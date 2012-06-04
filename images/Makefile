####################################################################################
# Makefile (configuration file for GNU make - see http://www.gnu.org/software/make/)
#
# --------------------------------------------------------------------------------
# This is a 'slave' makefile intended to be placed in a subdirectory that call 
# the parent Makefile of the upper directory
# --------------------------------------------------------------------------------
#
# Author: Sebastien Varrette <Sebastien.Varrette@uni.lu>
#          Web page : http://varrette.gforge.uni.lu/
# Creation date : 2012-06-04
#
# Please refer to ../Makefile for more informations on compilation options
# 
####################################################################################
all:
	$(MAKE) -C ../

%:
	$(MAKE) -C ../ $@

