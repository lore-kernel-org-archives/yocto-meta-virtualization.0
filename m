Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9334BE008DB; Mon,  9 Jan 2017 07:04:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,URIBL_SBL
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.6 URIBL_SBL Contains an URL's NS IP listed in the SBL
	blocklist *      [URIs: init.sh]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9A62E007AA
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Jan 2017 07:04:17 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v09F4GQA013845
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 9 Jan 2017 07:04:16 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 9 Jan 2017 07:04:15 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 9 Jan 2017 10:04:10 -0500
Message-ID: <1483974250-16707-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [mcs][PATCH] chef: remove the use of chef
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jan 2017 15:04:22 -0000
Content-Type: text/plain

The use of chef was never complete, had isses with updating binary
database files and had a cumbersome implementation. Since we are using
Ansible in meta-overc we are dropping the use of chef here and will
look to being at par with meta-overc by using Ansible if/when we get
time to look at runtime configuration in meta-cloud-services.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/Documentation/README.openstackchef  | 219 ------
 meta-openstack/classes/openstack-base.bbclass      |   2 +-
 meta-openstack/classes/openstackchef.bbclass       | 115 ---
 meta-openstack/classes/openstackchef_inc.bbclass   | 831 ---------------------
 .../recipes-devtools/python/python-barbican_git.bb |  12 +-
 .../python/python-ceilometer_git.bb                |  26 +-
 .../recipes-devtools/python/python-cinder_git.bb   |  12 +-
 .../recipes-devtools/python/python-glance_git.bb   |  34 +-
 .../recipes-devtools/python/python-heat_git.bb     |  35 +-
 .../recipes-devtools/python/python-horizon_git.bb  |   2 +-
 .../recipes-devtools/python/python-keystone_git.bb |  50 +-
 .../recipes-devtools/python/python-neutron_git.bb  |  28 +-
 .../recipes-devtools/python/python-nova_git.bb     |  56 +-
 .../recipes-devtools/python/python-swift_git.bb    |  51 +-
 .../cloud-init/cloud-init_0.7.6.bb                 |  14 +-
 .../glusterfs/glusterfs_3.4.2.bbappend             |   6 -
 .../rabbitmq/rabbitmq-server_3.2.4.bb              |   2 +-
 .../recipes-support/deploychef/deploychef_0.1.bb   | 100 ---
 .../deploychef/files/deploychef.init               |  26 -
 .../deploychef/files/run-deploychef                |  33 -
 .../deploychef/files/run-openstackchef             |  30 -
 .../postgresql/postgresql_9.%.bbappend             |  26 +-
 22 files changed, 136 insertions(+), 1574 deletions(-)
 delete mode 100644 meta-openstack/Documentation/README.openstackchef
 delete mode 100644 meta-openstack/classes/openstackchef.bbclass
 delete mode 100644 meta-openstack/classes/openstackchef_inc.bbclass
 delete mode 100644 meta-openstack/recipes-extended/glusterfs/glusterfs_3.4.2.bbappend
 delete mode 100644 meta-openstack/recipes-support/deploychef/deploychef_0.1.bb
 delete mode 100644 meta-openstack/recipes-support/deploychef/files/deploychef.init
 delete mode 100644 meta-openstack/recipes-support/deploychef/files/run-deploychef
 delete mode 100644 meta-openstack/recipes-support/deploychef/files/run-openstackchef

diff --git a/meta-openstack/Documentation/README.openstackchef b/meta-openstack/Documentation/README.openstackchef
deleted file mode 100644
index 7ddf23a..0000000
--- a/meta-openstack/Documentation/README.openstackchef
+++ /dev/null
@@ -1,219 +0,0 @@
-openstackchef.bbclass
-=========
-When an openstack image is built for a CONTROLLER, COMPUTE or allinone, 
-there are build-time variables that are hard-coded into the image. 
-These hardcoded variables need to be provided up front at 
-build time and cannot be changed easily at run-time. 
-What this means is that an image built for a specific deployment
-environment cannot be easily deployed to another environment.
-
-Openstackchef class enables openstack related services like, nova, postgresql, 
-neutron, etc to be re-configured at run-time. This means that if all the 
-services of an openstack installation inherits the openstackchef class,
-openstackchef can successfully re-configure an openstack installation. 
-
-For example, at build time, many of the openstack services need to know ahead of
-time, the IP address of the node on which CONTROLLER and COMPUTE will be deployed. 
-Once this IP address is built into the image, it cannot be changed at runtime. 
-In other words, if you build a CONTROLLER image for a machine with IP address 
-of 192.168.7.2, you cannot use that image on a machine with a different IP address.
-
-This is very restrictive, since it does not allow the re-use of CONTROLLER/COMPUTE 
-images.
-
-Openstackchef.bbclass facilitates the reuse of openstack images across multiple
-machines. It does this by providing a mechanism for openstack related services 
-to register all configuration files that have run-time dependent variables like IP 
-address in them.
-
-By inheriting openstackchef, and registering these configuration files
-with openstackchef, the services are no longer tied to a specific
-run-time environment. This is because, openstackchef makes it possible
-for the registered configuration files to be recreated at run-time when
-any of the environment variables changes.
-
-The configuration files are registered with openstackchef by assigning
-them to the variable CHEF_SERVICES_CONF_FILES in the recipe file.
-
-See example below for barbican:
-
-CHEF_SERVICES_CONF_FILES :="\
-    ${sysconfdir}/${SRCNAME}/vassals/barbican-api.ini \
-    ${sysconfdir}/${SRCNAME}/vassals/barbican-admin.ini \
-    "
-Openstackchef makes chef-solo templates out of
-the registered files. At run-time, the deploychef package
-makes a call to chef-solo, which in-turn use the template files
-to recreate the registered configuration files.
-
-Also see additional description in the openstackchef.bbclass header.
-
-In addition to the simple placeholder/value substitution that is 
-done by the openstackchef class when creating the templates, 
-there are times when recipes need to do morethan a simple placeholder 
-substitution. For cases like these, openstackchef provides a mechanism for 
-the recipes to provide a special callback function. Openstackchef class 
-then makes a call to this special callback function to do any additional substitution.
-
-The special shell callback function is registered with openstackchef by 
-assigning it to the variable CHEF_SERVICES_SPECIAL_FUNC.
-
-The python-neutron recipe defines a special function and specifies it
-as shown below.
-
-CHEF_SERVICES_SPECIAL_FUNC := "deploychef_services_special_func"
-
-Whenever the configuration files of any openstack service
-changes, the service usually needs to reload the configuration file. 
-The list of scripts/priority levels responsible for restarting 
-the service when its configuration files change are assumed to 
-be provided by the following variables:
-
-INITSCRIPT_PACKAGES
-INITSCRIPT_NAME_x or INITSCRIPT_NAME
-INITSCRIPT_PARAMS_x or INITSCRIPT_PARAMS
-
-Here is an example of how python-barbican specifies these variables.
-INITSCRIPT_PACKAGES = "${SRCNAME}"
-INITSCRIPT_NAME_${SRCNAME} = "barbican-api"
-INITSCRIPT_PARAMS_${SRCNAME} = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
-
-In addition, there are services that might need to be restarted but does 
-not necessary have a configuration file. These services can also advertise 
-themselves to openstackchef with the above variables.
-
-However, failure to provide appropriate values for the above variables after 
-registering a set of configuration files for an openstack service will
-lead to the service not working properly.
-
-Dependencies
-------------
-This class depends on the deploychef package for run-time implementation of 
-the class. However, the end user does not have to do anything about this 
-dependency, because it's resolved at build time and all deploychef package
-files are automatically included on the rootfs of resulting image.
-Openstackchef class creates the template files used by the deploychef package 
-to reconfigure an openstack node.
-
-Deploychef executes chefsolo at run-time to recreate
-the configuration files for openstack services from template files
-created by openstackchef.bbclass at build time.
-Chefsolo in turn uses the attributes and templates files to overwrite
-the configuration files for services like neutron, nova, swift, etc..
-that had registered their configuration files with openstackchef class
-at build time.
-
-The base directory for the deploychef package is /opt/deploychef.
-There are many files that goes into the re-configuration of an 
-openstack deployment, however, two are worth mentioning.
-
-1 . Default variables in openstack and the values they hold can be found in: 
-
-/opt/deploychef/cookbooks/openstack/attributes/default.rb
-
-2. A shell script file that should be executed to reconfigure the stack 
-on CONTROLLER, COMPUTE or allinone nodes.
-
-/opt/deploychef/run-deploychef
-
-The script file above should be executed when any of the run-time environment
-variables found at /opt/deploychef/cookbooks/openstack/attributes/default.rb
-is changed. 
-
-Run-time
--------
-Allinone: An allinone node boots-up with openstack re-configured and all services
-accessible either through the command-line or through horizon.
-
-CONTROLLER & COMPUTE:
-Both CONTROLLER and COMPUTE nodes boots-up with their respective IP address  
-updated using the IP address on the interface of the machine on which they run.
-
-For the CONTROLLER, you should be able to access horizon at this point. However,
-both the CONTROLLER and COMPUTE are not aware of each other at this point.
-
-For them to be made aware of each other, we need to inform the COMPUTE node of 
-the location of the CONTROLLER node, similarly, we need to inform the CONTROLLER
-node about the location of the COMPUTE node. 
-
-In order to accomplish this on each node, edit IP address field in the file
-
-/opt/deploychef/cookbooks/openstack/attributes/default.rb
-
-On the CONTROLLER node, change COMPUTE's IP address to the IP address 
-of the machine on which you have openstack COMPUTE deployed.
-
-Assuming COMPUTE's IP address was set to "192.168.7.4" at build-time and the
-current IP address of the machine on which you have COMPUTE deployed is
-"128.224.149.164". Then the line 
-
-default["COMPUTE_IP"] = "192.168.7.4"
-
-should be changed to
-
-default["COMPUTE_IP"] = "128.224.149.164"
-
-
-Now cd into the base directory of deploychef and execute the script
-'run-deploychef'.
-
-cd /opt/deploychef
-./run-deploychef
-
-Note: It's important that you 'cd' into /opt/deploychef when running
-run-deploychef script, because this script makes a call to chefsolo which 
-references files from /opt/depoychef base directory.
-
-Wait for the script to finish executing and you are shown the prompt.
-
-In a similar vein, repeat the above process on the COMPUTE node, but this 
-time, it's the CONTROLLER's IP address you will be changing. Leave the COMPUTE's 
-IP address as is.
-Assuming CONTROLLER's IP address was set to "192.168.7.2" at build-time and the
-current IP address of the machine on which you have CONTROLLER deployed is
-"128.224.149.162". Then the line 
-
-default["CONTROLLER_IP"] = "192.168.7.2"
-
-should be changed to
-
-default["CONTROLLER_IP"] = "128.224.149.162"
-
-
-Again 'cd' into the base directory of deploychef and execut the script
-'run-deploychef'.
-
-cd /opt/deploychef
-./run-deploychef
-
-
-At this point, both COMPUTE and CONTROLLER have been configured and should be 
-communicating with one another.
-
-Maintenance
------------
-This class is maintained by Wind River Systems, Inc.
-Contact <support@windriver.com> or your support representative for more
-information on submitting changes.
-
-
-Building with openstack.bbclass
--------------------------
-This class should be inherited by recipe/class files of openstack services in order 
-for the functionality described above to work. 
-If any component of openstack is left out, that component will
-not work correctly when the stack is reconfigured at run-time, and as a result,
-the openstack deployment will not work.
-
-
-License
--------
-Copyright (C) 2014 Wind River Systems, Inc.
-
-The right to copy, distribute or otherwise make use of this software may
-be licensed only pursuant to the terms of an applicable Wind River license
-agreement.  No license to Wind River intellectual properly rights is granted
-herein.  All rights not licensed by Wind River are reserved by Wind River.
-
-Source code included in tree is under the LICENSE
-stated in class file (.bbclass file) unless other stated.
diff --git a/meta-openstack/classes/openstack-base.bbclass b/meta-openstack/classes/openstack-base.bbclass
index 718aa1c..05dfdf1 100644
--- a/meta-openstack/classes/openstack-base.bbclass
+++ b/meta-openstack/classes/openstack-base.bbclass
@@ -1,4 +1,4 @@
-inherit hosts openstackchef
+inherit hosts
 
 ROOTFS_POSTPROCESS_COMMAND += "openstack_configure_hosts ; "
 
diff --git a/meta-openstack/classes/openstackchef.bbclass b/meta-openstack/classes/openstackchef.bbclass
deleted file mode 100644
index c2e4a40..0000000
--- a/meta-openstack/classes/openstackchef.bbclass
+++ /dev/null
@@ -1,115 +0,0 @@
-# openstackchef.bbclass
-# Copyright (c) 2014 Wind River Systems, Inc.
-# 
-# Permission is hereby granted, free of charge, to any person obtaining a copy
-# of this software and associated documentation files (the "Software"), to
-# deal
-# in the Software without restriction, including without limitation the rights
-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-# copies of the Software, and to permit persons to whom the Software is
-# furnished to do so, subject to the following conditions:
-# 
-# The above copyright notice and this permission notice shall be included in
-# all copies or substantial portions of the Software.
-#
-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-# FROM,
-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-# THE SOFTWARE.
-# 
-#
-# This class provides a framework for openstack services like python-neutron
-# or python-nova to register their configuration files so that they can be
-# recreated at run-time by chef-solo. Inheriting 
-# this class involves exposing configuration files from which this class
-# creates chef-solo templates. These template files are later used by chef-solo 
-# to  recreate the configuration files.
-#
-# For the templates files to be created, the recipes are expected 
-# to define the following variables variables:
-# 
-# SRCNAME: 
-# This is the name of the package, neutron for example for the package
-# python-neutron. It's appended to the names of template files and also
-# used in the creation of package based temporary files. A default value 
-# of ${BPN} is assigned to this variable when it's not defined by recipes
-# inheriting class.
-# 
-# CHEF_SERVICES_CONF_FILES
-#
-# This variable provides the list of configuration files 
-# exposed to this class by the recipes inheriting the class. 
-# These files are expected to be in the image( ${D}) directory, though ${D} 
-# directory is excluded from the file name. Definition of this variable
-# by recipe files is optional.
-# eg. 
-# CHEF_SERVICES_CONF_FILES="\
-#   ${sysconfdir}/chef/neutron/plugins/linuxbridge/linuxbridge_conf.ini.rb \
-#   ${sysconfdir}/chef/neutron/neutron.conf
-#   "
-#
-#INITSCRIPT_PACKAGES
-#This variable provides a mechanism for recipes inheriting this class
-#to provide a list of services to start/stop when their configuration files
-#are recreated on disk.
-#This variable is assumed to be provided by all recipes that register a set
-#of configuration files with this class. Failing to do so will lead to
-#service not reloading the newly created configuration file(s) at run-time.
-#
-# 
-#INITSCRIPT_NAME_x or INITSCRIPT_NAME
-#This variable is also assumed to be set by recipes inheriting this class. 
-#It specifies the names of the services to start/stop as specified above. 
-#Like the variable immediately above, failure to provide this variable will
-#lead to mis-configuration of the service at run-time.
-#
-#
-#INITSCRIPT_PARAMS_x or INITSCRIPT_PARAMS
-#Like the last two variable above, this variable is also assumed to be set
-#by recipes inheriting this class. It is used to extract the run-level
-#priority of the INITSCRIPT_NAME variable(s). Unlike, the previous two 
-#variables, a default run-level is assigned to the script when this variable
-#defaults to the string 'default' 
-#
-#
-# CHEF_SERVICES_SPECIAL_FUNC
-# This variable is optional, and is the name of a shell callback function. 
-# Unlike the placeholder/value substitution which this class does,
-# there are times when recipes need to do more than a simple placeholder/
-# value substitution. This is made possible with the use of the callback
-# function.
-# The callback function should be defined by the recipe(s) inheriting
-# this class. When this variable is defined, this class will call the 
-# callback function and pass it the name of the file to manipulate
-# in the form of the variable CHEF_SERVICES_FILE_NAME. This variable 
-# is then accessed in the callback function in the recipe file as
-# ${CHEF_SERVICES_FILE_NAME}
-#
-inherit hosts openstackchef_inc
-
-#Call this function after the do_install function have executed in 
-#recipes inheriting this class, this ensures that we get configuration
-#files that have been moved to the images directory
-addtask deploychef_install before do_package after do_install
-python do_deploychef_install() { 
-    if deploychef_not_rootfs_class(d) and \
-        deploychef_openstackchef_enabled(d):
-        #copy configuration files from packages inheriting class
-        template_files_tuple = deploychef_copy_conf_files(d)
-        #convert configuration files into templates for chefsolo
-        deploychef_make_templates( d, template_files_tuple)
-        #Generate a list of startup/shutdown services
-        deploychef_make_startup_shutdown_list(d)
-}
-
-#Use of ROOTFS_POSTPROCESS_COMMAND enables us to hook into the post 
-#rootfs creation process and influence the work of openstack_configure_hosts.
-#However, to ensure that our function deploychef_rootfs_postprocess_commands 
-#is called after openstack_configure_hosts and not before it,
-#we add it in front of our callback function here.
-ROOTFS_POSTPROCESS_COMMAND += "openstack_configure_hosts ; deploychef_rootfs_postprocess_commands ; "
-
diff --git a/meta-openstack/classes/openstackchef_inc.bbclass b/meta-openstack/classes/openstackchef_inc.bbclass
deleted file mode 100644
index 91adb41..0000000
--- a/meta-openstack/classes/openstackchef_inc.bbclass
+++ /dev/null
@@ -1,831 +0,0 @@
-# openstackchef_inc.bbclass
-# Copyright (c) 2014 Wind River Systems, Inc.
-#
-# Permission is hereby granted, free of charge, to any person obtaining a copy
-# of this software and associated documentation files (the "Software"), to
-# deal
-# in the Software without restriction, including without limitation the rights
-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-# copies of the Software, and to permit persons to whom the Software is
-# furnished to do so, subject to the following conditions:
-#
-# The above copyright notice and this permission notice shall be included in
-# all copies or substantial portions of the Software.
-#
-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-# FITNESS FOR A PARTICULAR PURPOSE AND NONE INFRINGEMENT. IN NO EVENT SHALL THE
-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-# FROM,
-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-# THE SOFTWARE.
-#
-#
-#This class is a helper class for openstackchef.bbclass and should not be be
-#inherited on it's own. It implements the functionalities used in 
-#openstackchef.bbclass
-CHEFPN = "openstackchef"
-#This variable is here to support legacy use of recipes that inherit this
-#class. By default these recipes will be built without openstackchef support.
-#Set this variable to 'yes' in your local.conf or similar to enable
-#support for OPENSTACKCHEF.
-OPENSTACKCHEF_ENABLED ?=''
-#This variable is defined in most of the openstack services, however,
-#it defaults to bare package name for packages that do not define it.
-SRCNAME ?= "${BPN}"
-#This is the base directory of where deploychef's templates files
-#reside in the classes that inherit it.
-CHEF_TEMPLATE_BASE="${D}${sysconfdir}/${CHEFPN}"
-CHEF_PACKAGE_BASE="${WORKDIR}/package${sysconfdir}/${CHEFPN}"
-CHEF_IMAGE_BASE="${D}${sysconfdir}"
-CHEF_ROOTFS_BASE="${sysconfdir}/${CHEFPN}"
-#These are the prefixs and suffixs to create chefsolo-like placeholders
-ERB_PREFIX = "<%=node[:"
-ERB_SUFFIX = "]%>"
-#These prefix and suffix are used to create our default values
-ERB_DEFAULT_PREFIX="default["
-ERB_DEFAULT_SUFFIX="]"
-#Chefsolo template file extension
-TEMPLATE_EXTENSION='.erb'
-#Build deploychef package since this class has run-time and buil-time dependency 
-#on it
-DEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'chef', 'deploychef', '', d)}"
-RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'chef', 'deploychef', '', d)}"
-CHEF_VERSION = '1'
-#For classes that define a special substitution function, this variable is 
-#set by this class and specifies the file named passed back to these function
-#for any special substitution.
-CHEF_SERVICES_FILE_NAME ?=''
-
-#These are hard coded in the recipes files where they are used. 
-ADMIN_TENANT_NAME ?= 'admin'
-DEMO_USER ?= 'demo'
-#This is dafault value used by update-rc.d script at runtime when
-#build-time update-rd.d class specifies INITSCRIPT_PARAMS as 'defaults' 
-CHEF_INITSCRIPT_PARAMS='defaults 20 10'
-
-def deploychef_services_default_sub_dict(d):
-    """Provides our placeholder/value substitution dictionary for global use
-    
-    This function returns as dictionary containing the default substitution pattern
-    as follows:
-    :<key>: Name of placeholder variable
-    :<value>: A tuple consisting  of the place holder variable followed 
-    by its default value
-    """
-    sub_dict={}
-    #neutron
-    sub_dict['SERVICE_TENANT_NAME'] = ('%SERVICE_TENANT_NAME%' ,
-    '${SERVICE_TENANT_NAME}') 
-    sub_dict['SERVICE_PASSWORD'] = ('%SERVICE_PASSWORD%' , '${SERVICE_PASSWORD}')
-
-    sub_dict['DB_USER'] = ('%DB_USER%', '${DB_USER}')
-    sub_dict['DB_PASSWORD'] = ('%DB_PASSWORD%' , '${DB_PASSWORD}')
-    sub_dict['CONTROLLER_IP'] = ('%CONTROLLER_IP%', '${CONTROLLER_IP}')
-    sub_dict['CONTROLLER_HOST'] = ('%CONTROLLER_HOST%', '${CONTROLLER_HOST}')
-    #nova
-    sub_dict['COMPUTE_IP'] = ('%COMPUTE_IP%', '${COMPUTE_IP}')
-    sub_dict['COMPUTE_HOST'] = ('%COMPUTE_HOST%', '${COMPUTE_HOST}')
-    sub_dict['LIBVIRT_IMAGES_TYPE'] = ('%LIBVIRT_IMAGES_TYPE%' , '${LIBVIRT_IMAGES_TYPE}')
-    sub_dict['OS_PASSWORD'] = ('%OS_PASSWORD%' , '${ADMIN_PASSWORD}')
-    sub_dict['SERVICE_TOKEN'] = ('%SERVICE_TOKEN%' , '${SERVICE_TOKEN}')
-    #swfit
-    sub_dict['ADMIN_TENANT_NAME'] = ('%ADMIN_TENANT_NAME%' , '${ADMIN_TENANT_NAME}')
-    sub_dict['ADMIN_USER'] = ('%ADMIN_USER%' , '${ADMIN_TENANT_NAME}')
-    sub_dict['ADMIN_PASSWORD'] = ('%ADMIN_PASSWORD%' , '${ADMIN_PASSWORD}')
-    sub_dict['DEMO_USER'] = ('%DEMO_USER%' , '${DEMO_USER}')
-    sub_dict['DEMO_PASSWORD'] = ('%DEMO_PASSWORD%' , '${ADMIN_PASSWORD}')
-    #ceilometer
-    sub_dict['CEILOMETER_SECRET'] = ('%CEILOMETER_SECRET%' , '${CEILOMETER_SECRET}')
-
-    #keystone
-    sub_dict['TOKEN_FORMAT'] = ('%TOKEN_FORMAT%' , '${TOKEN_FORMAT}')
-    sub_dict['METADATA_SHARED_SECRET'] = ('%METADATA_SHARED_SECRET%' , '${METADATA_SHARED_SECRET}')
-    #cinder
-    sub_dict['CINDER_BACKUP_BACKEND_DRIVER'] = ('%CINDER_BACKUP_BACKEND_DRIVER%' , '${CINDER_BACKUP_BACKEND_DRIVER}')
-    #cloud-init
-    sub_dict['MANAGE_HOSTS'] = ('%MANAGE_HOSTS%' , '${MANAGE_HOSTS}')
-    sub_dict['HOSTNAME'] = ('%HOSTNAME%' , '${MY_HOST}')
-    #postgresql
-    sub_dict['DB_DATADIR'] = ('%DB_DATADIR%' , '${DB_DATADIR}')
-    #glance
-    sub_dict['GLANCE_DEFAULT_STORE'] = ('%GLANCE_DEFAULT_STORE%' , '${GLANCE_DEFAULT_STORE}')
-    
-    #barbican
-    sub_dict['BARBICAN_MAX_PACKET_SIZE'] = ('%BARBICAN_MAX_PACKET_SIZE%' , '${BARBICAN_MAX_PACKET_SIZE}')
-    #ceph
-    sub_dict['PUBLIC_IP'] = ('%PUBLIC_IP%' , '${CONTROLLER_IP}')
-    sub_dict['PRIVATE_IP'] = ('%PRIVATE_IP%' , '${MY_IP}')
-    sub_dict['PUBLIC_DOMAIN'] = ('%PUBLIC_DOMAIN%' , '${PUBLIC_DOMAIN}')
-    sub_dict['HOST_NAME'] = ('%HOST_NAME%' , '${MY_HOST}')
-    sub_dict['CEPH_BACKING_FILE_SIZE'] = ('%CEPH_BACKING_FILE_SIZE%' , '${CEPH_BACKING_FILE_SIZE}')
-
-    #Most of the services have SERVICE_USER define but the values are different
-    service_user = d.getVar('SRCNAME', True)
-    if service_user:
-        service_user = service_user.upper() + '_SERVICE_USER'
-        sub_dict[service_user] = ('%SERVICE_USER%' , '${SRCNAME}')
-    return sub_dict
-
-#This variable is the default sets of substitutions common to most of the
-#services in an openstack installation. It means this package is not completely
-#agnostic but at the same time it gives us the added advantage of not repeating 
-#ourselves in the recipe/class files that inherits this class.
-CHEF_SERVICES_DEFAULT_CONF_SUBS := "${@deploychef_services_default_sub_dict(d)}"
-
-
-def deploychef_not_rootfs_class(d):
-    """Filter out rootfs related classes
-
-    This function is used to help us selectively executes the creation of template 
-    files and daemon start/stop list. It allows us to executes certain functions 
-    when the recipe inheriting this class is related to rootfs creation.
-    """
-    pkg = d.getVar('PN', True) or d.getVar('BPN', True)
-    #Skip test if recipe/class calling this class is related to rootfs image
-    #creation.
-    if 'image-' in pkg:
-        return False
-    else:
-        return True
-
-def deploychef_openstackchef_enabled(d):
-    """Find out if openstackchef class usage is enabled
-
-    The variable OPENSTACKCHEF_ENABLED is use to support legacy functionality
-    by recipes inheriting this class. Assinging it an empty string disables 
-    the functionality of this class for that recipe file. 
-    This function helps us detect when this variable is set to an empty string.
-    """
-    chef = d.getVar('OPENSTACKCHEF_ENABLED', True) 
-    #Skip test if recipe/class calling this class is related to rootfs image
-    #creation.
-    if chef != '' :
-        return True
-    else:
-        return False
-
-def deploychef_make_startup_shutdown_list(d):
-    """Create list of services to start/stop and save them to file
-
-    This function uses the update-rc.d environment variables defined
-    in the recipes/classes inheriting this class to create the 
-    startup and shutdown services list as defined in the file. 
-    This is important because, when we are replacing the configuration 
-    files for the services, the services needs to be shutdown and 
-    restarted after their configuration files are edited.
-    Therefore, the following variables must be defined by classes inheriting 
-    this class.
-
-    INITSCRIPT_PACKAGES: A list of init scripts
-    INITSCRIPT_PARAMS_x: The default start/stop priority for the above scripts
-    """
-
-    import os
-    if d.getVar('INITSCRIPT_PACKAGES') or d.getVar('INITSCRIPT_NAME'):
-        #script_list = d.getVar('INITSCRIPT_PACKAGES', 1)
-        script_list = d.getVar('INITSCRIPT_PACKAGES', True) or \ 
-         d.getVar('INITSCRIPT_NAME', True)  #Some package do not define INITSCRIPT_PACKAGES
-        msg="list of start/stop services: %s" % str(script_list)
-        bb.debug(2, msg)
-        base_dir = d.getVar('CHEF_TEMPLATE_BASE', 1 )
-        if not os.path.exists(base_dir):
-            os.mkdir(base_dir)
-        startup_file = os.path.join(base_dir, d.getVar('SRCNAME', True) +'-startup-list')
-        shutdown_file = os.path.join(base_dir, d.getVar('SRCNAME', True) +'-shutdown-list')
-        msg ="Startup and shutdown files %s %s saved to %s" % \
-        ( startup_file, shutdown_file, base_dir)
-        bb.note(msg)
-        try:
-            hStartup = open(startup_file, 'w')
-            hShutdown = open(shutdown_file, 'w')
-            for script_name in script_list.split():
-                #Retrieve the default params for update-rc.d for this script
-                #INITSCRIPT_PARAMS_nova-api="defaults 30 10"
-                init_script_name ="INITSCRIPT_NAME_%s" % script_name
-                init_script_name = d.getVar(init_script_name, True) or \
-                d.getVar('INITSCRIPT_NAME', True)
-
-                script_params ="INITSCRIPT_PARAMS_%s" % script_name
-                script_params = d.getVar(script_params, True) or \
-                d.getVar('INITSCRIPT_PARAMS', True)
-                #If only defaults is provided as parameter, then use our default  priority
-                if not script_params  or len(script_params.split()) < 3: 
-                    script_params = d.getVar('CHEF_INITSCRIPT_PARAMS', True)
-                if init_script_name: 
-                    #eg. start 20 5 3 2 . stop 80 0 1 6 .
-                    startup_priority = shutdown_priority = ''
-                    if script_params.find('stop') > 0:
-                        start, stop = script_params.split('stop')
-                        start = start.split()
-                        stop = stop.split()
-                        startup_priority = start[1]
-                        shutdown_priority = stop[0]
-                    elif script_params.find('stop') == 0:
-                        start, stop = script_params.split('start')
-                        start = start.split()
-                        stop = stop.split()
-                        startup_priority = start[0]
-                        shutdown_priority = stop[1]
-                    else:
-                        #"defaults 20 10" 
-                        defaults = script_params.split()
-                        startup_priority = defaults[1]
-                        shutdown_priority = defaults[2]
-                    #Arrange the script's startup/shutdown format as in rc.x
-                    startup_string = "%s%s%s%s" %  ('S', startup_priority, init_script_name, os.linesep)
-                    shutdown_string = "%s%s%s%s" % ('K', shutdown_priority, init_script_name, os.linesep)
-                    hStartup.write(startup_string)
-                    hShutdown.write(shutdown_string)
-                    msg = "%s %s registered for startup and shutdown in" % \
-                    (startup_string, shutdown_string)
-                    bb.debug(2 , msg)
-                else:
-                    msg = "The variables INITSCRIPT_PARAMS_%s or INITSCRIPT_PARAMS \ 
-                    are not set in %s, startup/shutdown list not created for %s: %s" \
-                    % (script_name, d.getVar('FILE', True), d.getVar('SRCNAME', True), script_params)
-                    raise bb.build.FuncFailed(msg)
-            hStartup.close()
-            hShutdown.close()
-        except IOError as e:
-            bb.error("Error opening startup/shutdown files %s %s,  %s %s" % \
-            (startup_file, shutdown_file, d.getVar('FILE'), e))
-    else:
-        msg = "The variable INITSCRIPT_PACKAGES is not set in %s,  \
-        startup/shutdown script will not be made for %s package" % \
-        (d.getVar('FILE', True), d.getVar('SRCNAME', True))
-        bb.build.FuncFailed(msg)
-
-def deploychef_make_substitutions(d, sub_dict, attr_filename, sed_filename):
-    """Make placeholder/value substitution in a file
-    
-    This function makes placeholder substitution into the file named 
-    sed_filename and appends the default value for those substitution into
-    the file named attr_filename.
-    The substitution is based on sets of placeholder/value pair in the 
-    dictionary called sub_dict.
-    :sub_dict: name, placeholder and value dictionary
-    :attr_filename: chef-solo attributes file name
-    :sed_filename: configuration or template file
-    """
-    if attr_filename and sed_filename:
-        if type(sub_dict) is dict:
-            import os
-            import re
-            sHandle = open(sed_filename, 'r+')
-            lines_in_conf_file = sHandle.read()
-            #We only want to append to the list of defines needed by this class
-            hFile= open(attr_filename,'a+')
-            lines_in_file= hFile.read()
-            for key in sub_dict.keys():
-                placeholder , replacement = sub_dict[key]
-                #Filter by placeholder so that our attribute file only include
-                #defines for class being built 
-                if re.search(placeholder,lines_in_conf_file):
-                    #Make the substitution to create a template file out of
-                    #the configuration file or just replace placeholder in
-                    #configuration file
-                    if d.getVar('TEMPLATE_EXTENSION', True) in sed_filename:
-                        #Format the default attributes as expected by chefsolo
-                        #for template file.
-                        attr_string = d.getVar('ERB_DEFAULT_PREFIX', True)
-                        attr_string += r'"' + key
-                        attr_string += r'"' + d.getVar('ERB_DEFAULT_SUFFIX', True)
-                        attr_string +=' = ' + r'"' + replacement + r'"'
-                        #Only write default values that do not yet exist in file
-                        #if key not in lines_in_file:
-                        if not re.search(key,lines_in_file):
-                            hFile.write("%s%s" % (attr_string, os.linesep))
-                        #Replace the placeholders in the current file, with
-                        #new_replacement
-                        new_replacement = d.getVar('ERB_PREFIX') + key
-                        new_replacement += d.getVar('ERB_SUFFIX')
-                        lines_in_conf_file = re.sub(placeholder, new_replacement, lines_in_conf_file)
-            #Write template file to disk
-            sHandle.seek(0)
-            sHandle.truncate()
-            sHandle.write(lines_in_conf_file)
-            sHandle.close()
-            
-            hFile.close()
-            if False:
-                msg = "Cannot read/write to attributes file %s as expected:%s"\
-                % (attr_filename, d.getVar('FILE'))
-                bb.build.FuncFailed(msg)
-        else:
-            msg = "The substitution dictionary variable sub_dict is not set  %s as expected "\
-            % d.getVar('FILE')
-            bb.error(msg)
-    else:
-        msg = "Null file names passsed to function %s %s "\
-        % (d.getVar('FUNC'), d.getVar('FILE'))
-        bb.error(msg)
-
-
-
-def deploychef_make_templates( d, conf_tuple=tuple()):
-    """Create a template file out of a configuration file
-
-    Using substitution placeholders and values in the substitution
-    dictionary declared as CHEF_SERVICES_DEFAULT_CONF_SUBS, this function
-    makes the substitution for all placeholders. If the file is a ruby template file, 
-    it replaces the placeholders with a chefsolo expression; 
-    thereby creating a chefsolo template file.
-    
-    :conf_tuple: List of configuration files
-    """
-
-    if len(conf_tuple):
-        import os, ast
-        base_dir = d.getVar('CHEF_TEMPLATE_BASE', 1 )
-        attr_file = os.path.join(base_dir, d.getVar('SRCNAME', True) + '-attributes.rb')
-        msg ="Default attributes saved to %s" % attr_file
-        if os.path.exists(attr_file):
-            os.remove(attr_file)
-        bb.note(msg)
-        try:
-            for file_name in conf_tuple:
-                #If a special substitution function is defined for class 
-                #inheriting this class, set the file name expected by special
-                #function before calling the function 
-                special_func_name = d.getVar('CHEF_SERVICES_SPECIAL_FUNC')
-                if special_func_name:
-                    bb.data.setVar('CHEF_SERVICES_FILE_NAME', file_name,\
-                    d)
-                    bb.build.exec_func(special_func_name, d)
-                
-                #Make the necessary susbstitutions using the default
-                #substitutiin dictionary
-                sub_dict = d.getVar('CHEF_SERVICES_DEFAULT_CONF_SUBS', 1)
-                msg = "The variable %s is not set in %s as a dictionary as expected "\
-                % ('CHEF_SERVICES_DEFAULT_CONF_SUBS', d.getVar('FILE'))
-                if sub_dict:
-                    #Safely retrieve our python data structure
-                    sub_dict = ast.literal_eval(sub_dict)
-                    if type(sub_dict) is dict:
-                        deploychef_make_substitutions(d, sub_dict, attr_file, file_name)
-                    else:
-                        raise bb.build.FuncFailed(msg)
-                else:
-                    raise bb.build.FuncFailed(msg)
-                #Make the necessary susbstitutions using auxilliary dictionary
-                #if provided by inheriting class
-                sub_dict = d.getVar('CHEF_SERVICES_CONF_SUBS', 1)
-                if sub_dict:
-                    sub_dict = ast.literal_eval(sub_dict)
-                    msg = "The variable %s is not set in %s as a dictionary as expected "\
-                    % ('CHEF_SERVICES_CONF_SUB', d.getVar('FILE'))
-                    if type(sub_dict) is dict:
-                        pass
-                        deploychef_make_substitutions(d, sub_dict, attr_file, file_name)
-                    else:
-                        bb.build.FuncFailed(msg)
-        except IOError as e:
-            bb.error("Could not write to attribute file %s: in %s,  %s" % \
-            (attr_file, d.getVar('FILE'), e))
-
-def deploychef_copy_single_conf_file(d, dst_base, conf_file):
-    """Create a chef-solo template from an openstack configuration file
-
-    This function copies a single configuration file (conf_file)
-    to destination directory (dst_dir) and return a tuple that contains
-    both the absolute path of the conf_file and the template files it was
-    copied as.
-    """
-    if conf_file: 
-        import shutil
-        import os
-        #Create the absolute path to configuration file since it's with relative
-        #to image directory
-        image_base = d.getVar('D', True)
-        if conf_file.startswith(os.sep):
-            conf_file=conf_file[1:]
-        abs_conf_path = os.path.join(image_base, conf_file)
-        
-        if os.path.exists(abs_conf_path):
-            dst_base = os.path.join(dst_base, os.path.dirname(conf_file))
-            #make room for the template file about to be created
-            if not os.path.exists(dst_base):
-                os.makedirs(dst_base)
-
-            abs_template_file = os.path.basename(conf_file) + \
-            d.getVar('TEMPLATE_EXTENSION', True) + '.' + d.getVar('SRCNAME', True)
-            abs_template_file = os.path.join(dst_base, abs_template_file)
-            #Copy conf file as template file
-            shutil.copy(abs_conf_path, abs_template_file)
-            msg = "\nConf file: %s\n Copied to: %s \n"\
-            % (abs_conf_path, abs_template_file)
-            bb.debug(2, msg)
-            return (abs_conf_path, abs_template_file)
-        else:
-            msg = "Configuration file: %s in %s does not \
-            exist" % (abs_conf_path, d.getVar('FILE'))
-            raise bb.build.FuncFailed(msg)
-    else:
-        msg = "The specified configuration file destined for %s in %s is an empty string\n" \
-        % (dst_base, d.getVar('FILE'))
-        raise bb.build.FuncFailed(msg)
-
-
-    
-def deploychef_copy_conf_files(d): 
-    """Copy openstack services' configuration files to be used as chef-solo templates
-
-    Copy the configuration file(s) for the services under 
-    ${D}${sysconfdir}/${CHEFPN}/<conf_file>. 
-    The file(s) is/are assumed to be located in the images directory; ${D}<conf_file>
-    And evaluate all necessary substitution in the configuration file.
-    """
-    abs_template_list = list()
-    abs_conf_list = list()
-
-    #Retrieve our string of configuration files
-    conf_files = d.getVar('CHEF_SERVICES_CONF_FILES', True )
-    #The template files that will be made from the configuration files will be
-    #copied with reference to this base directory.
-    dst_base = d.getVar('CHEF_TEMPLATE_BASE', True ) 
-    if conf_files and len(conf_files.strip()):
-        conf_files = conf_files.split()
-        if len(conf_files) != 1:
-            for conf_file in conf_files:
-                abs_conf_path, abs_template_path = deploychef_copy_single_conf_file(d, \
-                dst_base, conf_file)
-                if abs_template_path:
-                    #Save the absolute path to the template file 
-                    abs_template_list.append(abs_template_path)
-                if abs_conf_path:
-                    #Save the absolute path to the configuration file
-                    abs_conf_list.append(abs_conf_path)
-        else:
-            abs_conf_path, abs_template_path = deploychef_copy_single_conf_file(d,\
-            dst_base, conf_files[0])
-            if abs_template_path:
-                #Save the absolute path to the template file 
-                abs_template_list.append(abs_template_path)
-            if abs_conf_path:
-                #Save the absolute path to the template file 
-                abs_conf_list.append(abs_conf_path)
-        #Since the recipes no longer do the substitution in the
-        #configuration files, let us do it for the configuration files
-        deploychef_make_templates(d, tuple(abs_conf_list))
-    else:
-        msg = "The variable CHEF_SERVICES_CONF_FILES is not set"
-        msg += " in %s as a list of files as expected" % d.getVar('FILE', True) 
-        #raise bb.build.FuncFailed(msg)
-        #No longer a requirement that all recipes inheriting this 
-        #class must have a set of configuration files.
-        bb.debug(2,msg)
-    return tuple(abs_template_list)
-
-def deploychef_postinst_substitutions(d, sub_dict, postinst):
-    """Make value substitution in openstack services' postinstall scripts
-
-    This function makes all necessary substitution in the 'setup' related postinsts 
-    functions pgk_postinst_${PN}-setup. The substitution is base on entries in a 
-    dictionary sub_dict. In addition it also updates the list of defined constansts 
-    based on the values specified in dictionary or as specified by the recipe's 
-    callback function.
-    
-    :sub_dict: name, placeholder and value substitution dictionary
-    :postinst: content of an openstack service's postinstall script
-
-    """
-    if postinst:
-        if type(sub_dict) is dict:
-            import re
-            base_dir = d.getVar('CHEF_PACKAGE_BASE', True)
-            attr_filename = os.path.join(base_dir, d.getVar('SRCNAME', True) + '-attributes.rb')
-            if os.path.exists(attr_filename):
-                hFile= open(attr_filename,'a+')
-                lines_in_file= hFile.read()
-                for key in sub_dict.keys():
-                    placeholder , replacement = sub_dict[key]
-                    if replacement and ( re.search(placeholder, postinst) or \
-                        re.search(replacement, postinst)):
-                        #If there is any remaining placeholder in the current string
-                        #replace it.
-                        new_replacement = d.getVar('ERB_PREFIX') + key
-                        new_replacement += d.getVar('ERB_SUFFIX')
-                        
-                        updated_postinst = re.sub(placeholder, new_replacement, postinst)
-                        #If the placeholder has been substituted, look for the
-                        #substitution and replace it with our template value
-                        updated_postinst = re.sub(replacement, new_replacement, updated_postinst)
-                        #Update our attributes file with the updated replacement
-                        #string
-                        attr_string = d.getVar('ERB_DEFAULT_PREFIX', True)
-                        attr_string += r'"' + key
-                        attr_string += r'"' + d.getVar('ERB_DEFAULT_SUFFIX', True)
-                        attr_string +=' = ' + r'"' + replacement + r'"'
-                        #Only write default values that do not yet exist in file
-                        #if key not in lines_in_file:
-                        if not re.search(key,lines_in_file):
-                            hFile.write("%s%s" % (attr_string, os.linesep))
-
-                        postinst_msg= "placeholder %s \n replacement %s \n updated_postinst :\n  %s \n" % \
-                        (placeholder, replacement, updated_postinst)
-                        bb.debug(2, postinst_msg)
-                        postinst = updated_postinst
-                hFile.close()
-        else:
-            msg = "The substitution dictionary variable sub_dict is not set  %s as expected "\
-            % d.getVar('FILE')
-            bb.build.FuncFailed(msg)
-    else:
-        msg = "Null string passsed to function %s %s "\
-        % (d.getVar('FUNC'), d.getVar('FILE'))
-        bb.build.FuncFailed(msg)
-    return postinst
-
-def deploychef_update_package_postinsts(d):
-    """Make placeholder/value substitution in openstack postinstall scripts
-
-    This function searches all the 'setup' related post-install scripts for 
-    references to placeholders of interest; such as %CONTROLLER_IP%.
-    It replaces any such reference when it does find one with a placeholder
-    (<%=node[:CONTROLLER_IP]%>); that essentially converts the post-install 
-    script to a chefsolo template.
-    """
-    def update_postinst_package(pkg):
-        bb.debug(1, 'Updating placeholders in postinst for pkg_postinst_%s scripts' % pkg)
-        
-        ldata = bb.data.createCopy(d)
-        overrides = ldata.getVar("OVERRIDES", True)
-        
-        msg = "%s The override variable is %s" % (pkg, overrides)
-        bb.note(msg)
-        ldata.setVar("OVERRIDES", "%s:%s" % (pkg, overrides))
-        
-        bb.data.update_data(ldata)
-        postinst = ldata.getVar('pkg_postinst', True)
-        if postinst:
-            #Make the necessary substitutions using the default
-            #substitution dictionary
-            overrides = d.getVar("OVERRIDES", True)
-            msg = "%s The override variable is %s :\n %s " % (pkg, overrides, postinst)
-            bb.note(msg)
-            sub_dict = d.getVar('CHEF_SERVICES_DEFAULT_CONF_SUBS', 1)
-            msg = "The variable %s is not set in %s as a dictionary as expected "\
-            % ('CHEF_SERVICES_DEFAULT_CONF_SUBS', d.getVar('FILE'))
-            if sub_dict:
-                import ast
-                #Safely retrieve our python data structure
-                sub_dict = ast.literal_eval(sub_dict)
-                if type(sub_dict) is dict:
-                    import re
-                    updated_postinst = deploychef_postinst_substitutions(d, sub_dict, postinst)
-                    #Replace the placeholders in postinst script if any
-                    d.setVar('pkg_postinst_%s' % pkg, updated_postinst)
-                else:
-                    raise bb.build.FuncFailed(msg)
-            else:
-                raise bb.build.FuncFailed(msg)
-        else:
-            msg= "pkg_postinst_%s does not exist for %s\n" % (pkg, str(ldata))
-            bb.note(msg)
-            bb.build.FuncFailed(msg)
-        
-    packages = (d.getVar('PACKAGES', True) or "").split()
-    if packages != []:
-        for  pkg in packages:
-            if pkg.endswith('setup'):
-                update_postinst_package(pkg)
-    
-python populate_packages_append() {
-
-    deploychef_update_package_postinsts(d)
-}
-
-def deploychef_add_file_to_FILES_PN(d, conf_file=None):
-    """Add all directories under a file name to FILES_${PN} variable
-
-    This function appends the name of the template file to the FILES_${PN}/${BPN}
-    bitbake variable to avoid QA warning about files built but not 
-    added to rootfs. $CHEF_TEMPLATE_BASE/conf_file. Note that conf_file
-    is relative to the root filesystem as in /etc/neutron/neutron.conf
-    The template file will be located in /etc/${CHEFPN}/etc/neutron/neutron.conf.rb
-    Thefore, we need to make sure that all directories above the
-    template file are added to FILES_${PN} variable.
-    
-    :conf_file: a chef-solo template file
-    """
-    import re
-    import os
-    #Perform an override so that we can update FILES_${PN} variables
-    ldata = bb.data.createCopy(d)
-    overrides = ldata.getVar("OVERRIDES", True)
-    pkg = d.getVar('PN', True) or d.getVar('BPN', True)
-    files = d.getVar('FILES_%s' % pkg, True)
-    pkg_files = "FILES_%s" %  pkg    
-    ldata.setVar("OVERRIDES", "%s:%s" % (pkg_files, overrides))
-    bb.data.update_data(ldata)
-
-    dest_base = d.getVar('CHEF_TEMPLATE_BASE', True)
-    pkg_imagedir = d.getVar('CHEF_ROOTFS_BASE', True)
-    #Add the packages image base directory if it does not already exist
-    if re.search(pkg_imagedir, files) == None:
-        #All the directory and all files in it
-        files = "%s %s" % ( files, pkg_imagedir)
-        files = "%s %s%s*" % ( files, pkg_imagedir, os.sep )
-        d.setVar('FILES_%s' % pkg, files)
-        msg= "Updated FILES_%s: %s for base images dir" % (pkg, d.getVar('FILES_%s' % pkg, files))
-        bb.debug(2,msg)
-    #All the files and all sub directory leading up to the package image base directory
-    if conf_file:
-        rel_basedir = os.path.dirname(conf_file)
-        if rel_basedir.startswith(os.sep):
-            rel_basedir = rel_basedir[1:]
-        rel_basedir = os.path.join(pkg_imagedir, rel_basedir)
-        if re.search(rel_basedir, files) == None:
-            files = "%s %s" % ( files, rel_basedir)
-            files = "%s %s%s*" % ( files, rel_basedir, os.sep )
-            while rel_basedir.count(os.sep) > 4:
-                #Must be above /etc/chef/etc/ 
-                rel_basedir_list = rel_basedir.split(os.sep)
-                rel_basedir = os.sep.join(rel_basedir_list[:-1])
-                if re.search(rel_basedir, files) == None:
-                    #All the directory and files in it
-                    files = "%s %s" % ( files, rel_basedir)
-                    files = "%s  %s%s*" % ( files, rel_basedir, os.sep )
-                    bb.note(files)
-            bb.debug(2, files)
-            d.setVar('FILES_%s' % pkg, files)
-            msg= "Updated FILES_%s: %s " % (pkg, d.getVar('FILES_%s' % pkg, files))
-            bb.debug(2,msg)
-
-def deploychef_update_FILES_PN_variable(d):
-    """Indicate that the created chef-solo templates should be packaged
-    
-    This function ensures that all the templates files which are based off
-    of configuration files exposed to this class are packaged up when they
-    are copied from the images directory to the various packages folders
-    This avoids the QA warning such as: 
-    WARNING: For recipe python-neutron, the following files/directories were installed 
-    but not shipped in any package:
-    """
-    conf_files = d.getVar('CHEF_SERVICES_CONF_FILES', True )
-    if conf_files and len(conf_files.strip()):
-        import shutil
-        import os
-        for conf_file in conf_files.split():
-            deploychef_add_file_to_FILES_PN(d, conf_file)
-    else:
-        #Add the directory containing the start/stop scripts
-        deploychef_add_file_to_FILES_PN(d)
-
-
-python populate_packages_prepend() {
-
-    deploychef_update_FILES_PN_variable(d)
-}
-
-#The sets of functions below are for post rootfs processing. Preparing files
-#for chefsolo is a two stage process. First we must create the required files
-#in the package's image directory; and this is mostly done by the functions
-#above. 
-#And then we aggregate the files from their respective package directories
-#and put them together for the deploychef package in the expected
-#location.
-CHEF_ROOT_DIR="${IMAGE_ROOTFS}/${sysconfdir}/${CHEFPN}"
-CHEF_CONF_DIR="${CHEF_ROOT_DIR}/${sysconfdir}"
-INITD_DIR="${IMAGE_ROOTFS}/${sysconfdir}/init.d"
-POSTINSTS_DIR="${IMAGE_ROOTFS}/${sysconfdir}/rpm-postinsts"
-DEPLOYCHEF_DIR="${IMAGE_ROOTFS}/opt/deploychef"
-DEPLOYCHEF_TEMPLATES_DIR="${DEPLOYCHEF_DIR}/cookbooks/openstack/templates/default"
-ATTRIBUTES_DIR="${DEPLOYCHEF_DIR}/cookbooks/openstack/attributes"
-ATTRIBUTES_FILE="${ATTRIBUTES_DIR}/default.rb"
-
-deploychef_copy_host_files() {
-   #The /etc/hosts & /etc/hostname files are written during the rootfs
-   #post process, therefore the only way of making templates out of them 
-   #is to hook into the rootfs post process command.
-    if [ -f "${IMAGE_ROOTFS}/${sysconfdir}/hosts" ]; then
-        #Convert etc/hosts to chefsolo template
-        cp ${IMAGE_ROOTFS}/${sysconfdir}/hosts ${IMAGE_ROOTFS}/${sysconfdir}/${CHEFPN}/${sysconfdir}/hosts.erb
-        sed -e "s,${CONTROLLER_IP},${ERB_PREFIX}CONTROLLER_IP${ERB_SUFFIX},g" -i \
-        ${IMAGE_ROOTFS}/${sysconfdir}/${CHEFPN}/${sysconfdir}/hosts.erb
-        sed -e "s,${CONTROLLER_HOST},${ERB_PREFIX}CONTROLLER_HOST${ERB_SUFFIX},g" -i \
-        ${IMAGE_ROOTFS}/${sysconfdir}/${CHEFPN}/${sysconfdir}/hosts.erb
-        
-        sed -e "s,${COMPUTE_IP},${ERB_PREFIX}COMPUTE_IP${ERB_SUFFIX},g" -i \
-        ${IMAGE_ROOTFS}/${sysconfdir}/${CHEFPN}/${sysconfdir}/hosts.erb
-        sed -e "s,${COMPUTE_HOST},${ERB_PREFIX}COMPUTE_HOST${ERB_SUFFIX},g" -i \
-        ${IMAGE_ROOTFS}/${sysconfdir}/${CHEFPN}/${sysconfdir}/hosts.erb
-        #Create an attribute file for /etc/hosts 
-        attr_string="${ERB_DEFAULT_PREFIX}\"COMPUTE_IP\"${ERB_DEFAULT_SUFFIX} = \"${COMPUTE_IP}\""
-        echo "$attr_string" > ${IMAGE_ROOTFS}/${sysconfdir}/${CHEFPN}/hosts-attributes.rb
-        attr_string="${ERB_DEFAULT_PREFIX}\"COMPUTE_HOST\"${ERB_DEFAULT_SUFFIX} = \"${COMPUTE_HOST}\""
-        echo "$attr_string" >> ${IMAGE_ROOTFS}/${sysconfdir}/${CHEFPN}/hosts-attributes.rb
-        attr_string="${ERB_DEFAULT_PREFIX}\"CONTROLLER_IP\"${ERB_DEFAULT_SUFFIX} = \"${CONTROLLER_IP}\""
-        echo "$attr_string" >> ${IMAGE_ROOTFS}/${sysconfdir}/${CHEFPN}/hosts-attributes.rb
-        attr_string="${ERB_DEFAULT_PREFIX}\"CONTROLLER_HOST\"${ERB_DEFAULT_SUFFIX} = \"${CONTROLLER_HOST}\""
-        echo "$attr_string" >> ${IMAGE_ROOTFS}/${sysconfdir}/${CHEFPN}/hosts-attributes.rb
-    fi
-
-    if [ -f "${IMAGE_ROOTFS}/${sysconfdir}/hostname" ]; then
-        #Convert etc/hostname to chefsolo template
-        cp ${IMAGE_ROOTFS}/${sysconfdir}/hostname ${IMAGE_ROOTFS}/${sysconfdir}/${CHEFPN}/${sysconfdir}/hostname.erb
-        sed -e "s,${MY_HOST},${ERB_PREFIX}HOSTNAME${ERB_SUFFIX},g" -i \
-        ${IMAGE_ROOTFS}/${sysconfdir}/${CHEFPN}/${sysconfdir}/hostname.erb
-        #Create an attribute file for /etc/hostname 
-        attr_string="${ERB_DEFAULT_PREFIX}\"HOSTNAME\"${ERB_DEFAULT_SUFFIX} = \"${MY_HOST}\""
-        echo "$attr_string" > ${IMAGE_ROOTFS}/${sysconfdir}/${CHEFPN}/hostname-attributes.rb
-    fi
-}
-
-
-combine_services_daemons(){
-    if [ -n $1 ]; then
-        file_suffix=$1
-        rm -f ${DEPLOYCHEF_DIR}/$file_suffix
-        #combine the list of shutdown/startup scripts
-        find "${CHEF_ROOT_DIR}/" -name "*$file_suffix" 2> /dev/null | while read fname; do 
-            service_cont=$(cat $fname)
-            for line in $service_cont; do 
-                service=$(echo $line | awk -F"[SK][0-9]+" '{print $2}')
-                if [ -e ${INITD_DIR}/$service ]; then
-                    echo $line >> ${DEPLOYCHEF_DIR}/$file_suffix
-                fi
-            done
-        done
-    fi
-}
-
-#This function combines the attributes of all the sevices into
-#a default.rb attributes file.
-combine_services_attributes(){
-    file_suffix='attributes.rb'
-    mkdir -p ${ATTRIBUTES_DIR}; rm -f ${ATTRIBUTES_FILE} 2>/dev/null
-    #combine the list of shutdown/starup scripts
-    find "${CHEF_ROOT_DIR}/" -name "*$file_suffix" 2> /dev/null | \
-    while read fname; do
-        cat $fname | while read line_in_file; do
-        index=$(echo  $line_in_file | awk -F'"' '{print $2}')
-        #Only append attributes that are not in the default.rb attributes file
-        if [ ! `grep -l $index ${ATTRIBUTES_FILE}` ]; then
-            echo $line_in_file >> ${ATTRIBUTES_FILE}
-        fi
-    done
-    done
-}
-
-#This function copies the templates to deploychef directory from
-#within the packages directories
-copy_templates_in_place(){
-    #copy rpm-postinsts and config templates into templates directory
-    mkdir -p ${DEPLOYCHEF_TEMPLATES_DIR}
-    #First copy all our configuration template files
-    if [ -d ${CHEF_CONF_DIR} ]; then
-        cp -rf ${CHEF_CONF_DIR} ${DEPLOYCHEF_TEMPLATES_DIR}
-    fi
-    #Now copy the rpm-postinsts files into cookbooks/templates/default/etc/
-    if [ -d ${POSTINSTS_DIR} ]; then
-        cp -rf ${POSTINSTS_DIR} ${DEPLOYCHEF_TEMPLATES_DIR}/${sysconfdir}
-        #Move the files to base of the templates directory, where chef-solo 
-        #expects them
-        cp -f ${POSTINSTS_DIR}/* ${DEPLOYCHEF_TEMPLATES_DIR}/.
-    fi
-    
-}
-
-filter_node_dependent_templates(){
-    if [ -d ${DEPLOYCHEF_TEMPLATES_DIR} ]; then
-        find "${DEPLOYCHEF_TEMPLATES_DIR}/" -name "*.erb*" 2> /dev/null | \
-        while read fname; do
-            config_file=$(echo  $fname | awk -F'/default' '{print $2}' | awk \
-                -F'.erb' '{print $1}')
-            #If the base configuration file does not exist on this node
-            #remove it.
-            if [ ! -f ${IMAGE_ROOTFS}$config_file ]; then
-                rm -f "$fname"
-            else
-                #Move the file to the default template directory where
-                #chefsolo expect them 
-                cp "$fname"  "${DEPLOYCHEF_TEMPLATES_DIR}"
-            fi
-        done
-    fi
-}
-
-#This function is our post rootfs hook, it enables
-#us to do what we wish to do during rootfs creation process.
-deploychef_rootfs_postprocess_commands() {
-   
-    if [ -n "${OPENSTACKCHEF_ENABLED}" ]; then
-        deploychef_copy_host_files
-        combine_services_daemons 'shutdown-list'
-        combine_services_daemons 'startup-list'
-        combine_services_attributes
-        copy_templates_in_place
-        filter_node_dependent_templates
-    else
-        #Let us delete the deploychef init script that runs
-        #chef-solo at boot-up from rootfs
-        rm -f ${INITD_DIR}/deploychef 2> /dev/null
-    fi
-    #We nolonger have need for /etc/${CHEFPN} directory on rootfs
-    #Not even at run-time
-    rm -rf "${CHEF_ROOT_DIR}" 
-}
-
diff --git a/meta-openstack/recipes-devtools/python/python-barbican_git.bb b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
index c3b2896..0b3d768 100644
--- a/meta-openstack/recipes-devtools/python/python-barbican_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
@@ -19,7 +19,7 @@ SRCREV = "e6f05febbe18a86e4e6b05acc5f4868fa3beb291"
 PV = "2015.1.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-inherit update-rc.d setuptools identity hosts useradd default_configs openstackchef monitor
+inherit update-rc.d setuptools identity hosts useradd default_configs monitor
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup"
 KEYSTONE_HOST="${CONTROLLER_IP}"
@@ -48,10 +48,8 @@ do_install_append() {
     cp -r ${TEMPLATE_CONF_DIR}/* ${BARBICAN_CONF_DIR}
 
     install -d ${D}${localstatedir}/lib/barbican
-    if [ -z "${OPENSTACKCHEF_ENABLED}" ]; then
-        sed -e "s:%BARBICAN_MAX_PACKET_SIZE%:${BARBICAN_MAX_PACKET_SIZE}:g" -i ${BARBICAN_CONF_DIR}/vassals/barbican-api.ini
-        sed -e "s:%BARBICAN_MAX_PACKET_SIZE%:${BARBICAN_MAX_PACKET_SIZE}:g" -i ${BARBICAN_CONF_DIR}/vassals/barbican-admin.ini
-    fi
+    sed -e "s:%BARBICAN_MAX_PACKET_SIZE%:${BARBICAN_MAX_PACKET_SIZE}:g" -i ${BARBICAN_CONF_DIR}/vassals/barbican-api.ini
+    sed -e "s:%BARBICAN_MAX_PACKET_SIZE%:${BARBICAN_MAX_PACKET_SIZE}:g" -i ${BARBICAN_CONF_DIR}/vassals/barbican-admin.ini
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
 
@@ -68,10 +66,6 @@ do_install_append() {
         -i ${D}/${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/tests/api/test_resources_policy.py
 }
 
-CHEF_SERVICES_CONF_FILES :="\
-    ${sysconfdir}/${SRCNAME}/vassals/barbican-api.ini \
-    ${sysconfdir}/${SRCNAME}/vassals/barbican-admin.ini \
-    "
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system barbican"
 USERADD_PARAM_${PN}  = "--system --home /var/lib/barbican -g barbican \
diff --git a/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb b/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
index 0d6e2d3..5645626 100644
--- a/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
@@ -63,21 +63,20 @@ do_install_append() {
     install -m 600 ${TEMPLATE_CONF_DIR}/*.yaml ${CEILOMETER_CONF_DIR}
 
     install -m 600 ${TEMPLATE_CONF_DIR}/api_paste.ini ${CEILOMETER_CONF_DIR}
-    if [ -z "${OPENSTACKCHEF_ENABLED}" ]; then
-        sed -e "s:%CEILOMETER_SECRET%:${CEILOMETER_SECRET}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
+    sed -e "s:%CEILOMETER_SECRET%:${CEILOMETER_SECRET}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
 
-        sed -e "s:%DB_USER%:${DB_USER}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
-        sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
+    sed -e "s:%DB_USER%:${DB_USER}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
+    sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
 
-        sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
-        sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
+    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
+    sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
 
-        sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
-        sed -e "s:%COMPUTE_HOST%:${COMPUTE_HOST}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
+    sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
+    sed -e "s:%COMPUTE_HOST%:${COMPUTE_HOST}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
+
+    sed -e "s:%ADMIN_PASSWORD%:${ADMIN_PASSWORD}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
+    sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
 
-        sed -e "s:%ADMIN_PASSWORD%:${ADMIN_PASSWORD}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
-        sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
-    fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
 
@@ -108,9 +107,6 @@ do_install_append() {
     fi 
 }
 
-CHEF_SERVICES_CONF_FILES :="\
-    ${sysconfdir}/${SRCNAME}/ceilometer.conf \
-    "
 pkg_postinst_${SRCNAME}-setup () {
     if [ "x$D" != "x" ]; then
         exit 1
@@ -128,7 +124,7 @@ pkg_postinst_${SRCNAME}-setup () {
     ceilometer-dbsync
 }
 
-inherit setuptools identity hosts update-rc.d default_configs openstackchef monitor
+inherit setuptools identity hosts update-rc.d default_configs monitor
 
 PACKAGES += " ${SRCNAME}-tests"
 PACKAGES += "${SRCNAME}-setup ${SRCNAME}-common ${SRCNAME}-api"
diff --git a/meta-openstack/recipes-devtools/python/python-cinder_git.bb b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
index 91098c4..e70a3aa 100644
--- a/meta-openstack/recipes-devtools/python/python-cinder_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
@@ -24,7 +24,7 @@ SRCREV = "61026d4e4f2a58dd84ffb2e4e40ab99860b9316a"
 PV = "7.0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-inherit setuptools update-rc.d identity default_configs hosts openstackchef monitor
+inherit setuptools update-rc.d identity default_configs hosts monitor
 
 CINDER_BACKUP_BACKEND_DRIVER ?= "cinder.backup.drivers.swift"
 
@@ -77,8 +77,7 @@ do_install_append() {
 
     install -d ${D}${localstatedir}/log/${SRCNAME}
     
-    if [ -z "${OPENSTACKCHEF_ENABLED}" ]; then
-        for file in api-paste.ini cinder.conf; do
+    for file in api-paste.ini cinder.conf; do
         sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" \
             -i ${CINDER_CONF_DIR}/$file
         sed -e "s:%SERVICE_USER%:${SRCNAME}:g" -i ${CINDER_CONF_DIR}/$file
@@ -89,8 +88,7 @@ do_install_append() {
         sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${CINDER_CONF_DIR}/$file
         sed -e "s:%CINDER_BACKUP_BACKEND_DRIVER%:${CINDER_BACKUP_BACKEND_DRIVER}:g" \
         -i ${CINDER_CONF_DIR}/$file
-        done
-    fi
+    done
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
@@ -125,10 +123,6 @@ do_install_append() {
     sed -e "s:%IS_DEFAULT%:${is_default}:g" -i ${D}/etc/cinder/drivers/glusterfs_setup.sh
 }
 
-CHEF_SERVICES_CONF_FILES :="\
-    ${sysconfdir}/${SRCNAME}/cinder.conf \
-    ${sysconfdir}/${SRCNAME}/api-paste.ini \
-    "
 pkg_postinst_${SRCNAME}-setup () {
     if [ "x$D" != "x" ]; then
         exit 1
diff --git a/meta-openstack/recipes-devtools/python/python-glance_git.bb b/meta-openstack/recipes-devtools/python/python-glance_git.bb
index bce373d..27c33b9 100644
--- a/meta-openstack/recipes-devtools/python/python-glance_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glance_git.bb
@@ -18,7 +18,7 @@ PV = "11.0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit setuptools update-rc.d identity default_configs hosts openstackchef monitor
+inherit setuptools update-rc.d identity default_configs hosts monitor
 
 GLANCE_DEFAULT_STORE ?= "file"
 GLANCE_KNOWN_STORES ?= "glance.store.rbd.Store,\
@@ -97,20 +97,18 @@ do_install_append() {
 
     install -d ${D}${localstatedir}/log/${SRCNAME}
 
-    if [ -z "${OPENSTACKCHEF_ENABLED}" ]; then
-        for file in api registry cache
-        do
-            sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" \
-                -i ${GLANCE_CONF_DIR}/glance-$file.conf
-            sed -e "s:%SERVICE_USER%:${SRCNAME}:g" -i ${GLANCE_CONF_DIR}/glance-$file.conf
-            sed -e "s:%SERVICE_PASSWORD%:${SERVICE_PASSWORD}:g" \
-                -i ${GLANCE_CONF_DIR}/glance-$file.conf
-            sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" \
-                -i ${GLANCE_CONF_DIR}/glance-$file.conf
-            sed -e "s:%DB_USER%:${DB_USER}:g" \
-                -i ${GLANCE_CONF_DIR}/glance-$file.conf
-        done
-    fi
+    for file in api registry cache
+    do
+	sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" \
+	    -i ${GLANCE_CONF_DIR}/glance-$file.conf
+	sed -e "s:%SERVICE_USER%:${SRCNAME}:g" -i ${GLANCE_CONF_DIR}/glance-$file.conf
+	sed -e "s:%SERVICE_PASSWORD%:${SERVICE_PASSWORD}:g" \
+	    -i ${GLANCE_CONF_DIR}/glance-$file.conf
+	sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" \
+	    -i ${GLANCE_CONF_DIR}/glance-$file.conf
+	sed -e "s:%DB_USER%:${DB_USER}:g" \
+	    -i ${GLANCE_CONF_DIR}/glance-$file.conf
+    done
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
@@ -123,12 +121,6 @@ do_install_append() {
     cp run_tests.sh ${GLANCE_CONF_DIR}
 }
 
-CHEF_SERVICES_CONF_FILES := "\
-    ${sysconfdir}/${SRCNAME}/glance-api.conf \
-    ${sysconfdir}/${SRCNAME}/glance-cache.conf \
-    ${sysconfdir}/${SRCNAME}/glance-registry.conf \
-    "
-
 pkg_postinst_${SRCNAME}-setup () {
     if [ "x$D" != "x" ]; then
         exit 1
diff --git a/meta-openstack/recipes-devtools/python/python-heat_git.bb b/meta-openstack/recipes-devtools/python/python-heat_git.bb
index 75d5ba6..6da768f 100644
--- a/meta-openstack/recipes-devtools/python/python-heat_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-heat_git.bb
@@ -70,25 +70,24 @@ do_install_append() {
     install -d ${HEAT_CONF_DIR}/environment.d
     install -m 600 ${TEMPLATE_CONF_DIR}/environment.d/* ${HEAT_CONF_DIR}/environment.d
     install -m 664 ${TEMPLATE_CONF_DIR}/api-paste.ini ${HEAT_CONF_DIR}
-    if [ -z "${OPENSTACKCHEF_ENABLED}" ]; then
-        sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" \
-            -i ${HEAT_CONF_DIR}/api-paste.ini
-        sed -e "s:%SERVICE_USER%:${SRCNAME}:g" -i ${HEAT_CONF_DIR}/api-paste.ini
-        sed -e "s:%SERVICE_PASSWORD%:${SERVICE_PASSWORD}:g" -i ${HEAT_CONF_DIR}/api-paste.ini
-        sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${HEAT_CONF_DIR}/api-paste.ini
+    sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" \
+	-i ${HEAT_CONF_DIR}/api-paste.ini
+    sed -e "s:%SERVICE_USER%:${SRCNAME}:g" -i ${HEAT_CONF_DIR}/api-paste.ini
+    sed -e "s:%SERVICE_PASSWORD%:${SERVICE_PASSWORD}:g" -i ${HEAT_CONF_DIR}/api-paste.ini
+    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${HEAT_CONF_DIR}/api-paste.ini
 
-        sed -e "s:%DB_USER%:${DB_USER}:g" -i ${HEAT_CONF_DIR}/heat.conf
-        sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${HEAT_CONF_DIR}/heat.conf
+    sed -e "s:%DB_USER%:${DB_USER}:g" -i ${HEAT_CONF_DIR}/heat.conf
+    sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${HEAT_CONF_DIR}/heat.conf
 
-        sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${HEAT_CONF_DIR}/heat.conf
-        sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${HEAT_CONF_DIR}/heat.conf
+    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${HEAT_CONF_DIR}/heat.conf
+    sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${HEAT_CONF_DIR}/heat.conf
 
-        sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${HEAT_CONF_DIR}/heat.conf
-        sed -e "s:%COMPUTE_HOST%:${COMPUTE_HOST}:g" -i ${HEAT_CONF_DIR}/heat.conf
+    sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${HEAT_CONF_DIR}/heat.conf
+    sed -e "s:%COMPUTE_HOST%:${COMPUTE_HOST}:g" -i ${HEAT_CONF_DIR}/heat.conf
+
+    sed -e "s:%ADMIN_PASSWORD%:${ADMIN_PASSWORD}:g" -i ${HEAT_CONF_DIR}/heat.conf
+    sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" -i ${HEAT_CONF_DIR}/heat.conf
 
-        sed -e "s:%ADMIN_PASSWORD%:${ADMIN_PASSWORD}:g" -i ${HEAT_CONF_DIR}/heat.conf
-        sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" -i ${HEAT_CONF_DIR}/heat.conf
-    fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
 
@@ -107,10 +106,6 @@ do_install_append() {
     fi
 }
 
-CHEF_SERVICES_CONF_FILES :="\
-    ${sysconfdir}/${SRCNAME}/heat.conf \
-    ${sysconfdir}/${SRCNAME}/api-paste.ini \
-   "
 pkg_postinst_${SRCNAME}-setup () {
     if [ "x$D" != "x" ]; then
         exit 1
@@ -128,7 +123,7 @@ pkg_postinst_${SRCNAME}-setup () {
     heat-manage db_sync
 }
 
-inherit setuptools identity hosts update-rc.d default_configs openstackchef monitor
+inherit setuptools identity hosts update-rc.d default_configs monitor
 
 PACKAGES += "${SRCNAME}-tests ${SRCNAME}-templates ${SRCNAME}-common ${SRCNAME}-api ${SRCNAME}-api-cfn ${SRCNAME}-engine"
 PACKAGES += "${SRCNAME}-setup"
diff --git a/meta-openstack/recipes-devtools/python/python-horizon_git.bb b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
index 01ce598..5a23930 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
@@ -84,7 +84,7 @@ SRCREV = "593f0b78eea8efbb6d833d66acc7ab4dc852159b"
 PV = "8.0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-inherit setuptools update-rc.d python-dir default_configs openstackchef monitor
+inherit setuptools update-rc.d python-dir default_configs monitor
 
 # no longer required. kept as reference.
 # do_install[dirs] += "${D}/usr/share/bin"
diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
index e79a6a4..49aa530 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
@@ -24,7 +24,7 @@ PV = "8.0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit setuptools update-rc.d identity hosts default_configs openstackchef monitor
+inherit setuptools update-rc.d identity hosts default_configs monitor
 
 SERVICE_TOKEN = "password"
 TOKEN_FORMAT ?= "PKI"
@@ -114,28 +114,26 @@ do_install_append() {
         admin_endpoint = http://%CONTROLLER_IP%:8081/keystone/admin/ " \
         -i ${KEYSTONE_CONF_DIR}/keystone.conf
     
-    if [ -z "${OPENSTACKCHEF_ENABLED}" ]; then
-        sed -e "s:%SERVICE_TOKEN%:${SERVICE_TOKEN}:g" \
-            -i ${KEYSTONE_CONF_DIR}/keystone.conf
-        sed -e "s:%DB_USER%:${DB_USER}:g" -i ${KEYSTONE_CONF_DIR}/keystone.conf
-        sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" \
-            -i ${KEYSTONE_CONF_DIR}/keystone.conf
-
-        sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" \
-            -i ${KEYSTONE_CONF_DIR}/keystone.conf
-        sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" \
-            -i ${KEYSTONE_CONF_DIR}/identity.sh
-
-        sed -e "s:%TOKEN_FORMAT%:${TOKEN_FORMAT}:g" \
-            -i ${KEYSTONE_CONF_DIR}/keystone.conf
-        
-        sed -e "s/%ADMIN_PASSWORD%/${ADMIN_PASSWORD}/g" \
-            -i ${D}${sysconfdir}/init.d/keystone
-        sed -e "s/%SERVICE_PASSWORD%/${SERVICE_PASSWORD}/g" \
-            -i ${D}${sysconfdir}/init.d/keystone
-        sed -e "s/%SERVICE_TENANT_NAME%/${SERVICE_TENANT_NAME}/g" \
-            -i ${D}${sysconfdir}/init.d/keystone
-    fi    
+    sed -e "s:%SERVICE_TOKEN%:${SERVICE_TOKEN}:g" \
+	-i ${KEYSTONE_CONF_DIR}/keystone.conf
+    sed -e "s:%DB_USER%:${DB_USER}:g" -i ${KEYSTONE_CONF_DIR}/keystone.conf
+    sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" \
+	-i ${KEYSTONE_CONF_DIR}/keystone.conf
+
+    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" \
+	-i ${KEYSTONE_CONF_DIR}/keystone.conf
+    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" \
+	-i ${KEYSTONE_CONF_DIR}/identity.sh
+
+    sed -e "s:%TOKEN_FORMAT%:${TOKEN_FORMAT}:g" \
+	-i ${KEYSTONE_CONF_DIR}/keystone.conf
+
+    sed -e "s/%ADMIN_PASSWORD%/${ADMIN_PASSWORD}/g" \
+	-i ${D}${sysconfdir}/init.d/keystone
+    sed -e "s/%SERVICE_PASSWORD%/${SERVICE_PASSWORD}/g" \
+	-i ${D}${sysconfdir}/init.d/keystone
+    sed -e "s/%SERVICE_TENANT_NAME%/${SERVICE_TENANT_NAME}/g" \
+	-i ${D}${sysconfdir}/init.d/keystone
     
     install -d ${KEYSTONE_PACKAGE_DIR}/tests/tmp
 
@@ -189,12 +187,6 @@ role_tree_dn = ou=Roles,${LDAP_DN} \
     fi
 }
 
-CHEF_SERVICES_CONF_FILES := "\
-    ${sysconfdir}/${SRCNAME}/keystone.conf \
-    ${sysconfdir}/${SRCNAME}/identity.sh \
-    ${sysconfdir}/init.d/keystone \
-    "
-
 pkg_postinst_${SRCNAME}-setup () {
     # python-keystone postinst start
     if [ "x$D" != "x" ]; then
diff --git a/meta-openstack/recipes-devtools/python/python-neutron_git.bb b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
index f651a8f..51c2ac4 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
@@ -24,7 +24,7 @@ PV = "7.0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit setuptools update-rc.d identity hosts default_configs openstackchef monitor
+inherit setuptools update-rc.d identity hosts default_configs monitor
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup"
 KEYSTONE_HOST="${CONTROLLER_IP}"
@@ -117,8 +117,8 @@ do_install_append() {
         install -m 0755 ${WORKDIR}/neutron-$AGENT.init.sh ${D}${sysconfdir}/init.d/neutron-$AGENT-agent
         install -m 600 ${WORKDIR}/${AGENT}_agent.ini ${NEUTRON_CONF_DIR}/
     fi
-    if [ -z "${OPENSTACKCHEF_ENABLED}" ]; then
-        for file in plugins/ml2/ml2_conf.ini neutron.conf metadata_agent.ini; do
+
+    for file in plugins/ml2/ml2_conf.ini neutron.conf metadata_agent.ini; do
         sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" -i ${NEUTRON_CONF_DIR}/$file
         sed -e "s:%SERVICE_USER%:${SRCNAME}:g" -i ${NEUTRON_CONF_DIR}/$file
         sed -e "s:%SERVICE_PASSWORD%:${SERVICE_PASSWORD}:g" -i ${NEUTRON_CONF_DIR}/$file
@@ -127,8 +127,8 @@ do_install_append() {
         sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${NEUTRON_CONF_DIR}/$file
         sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${NEUTRON_CONF_DIR}/$file
         sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${NEUTRON_CONF_DIR}/$file
-        done
-    fi
+    done
+
     sed -e "s:^auth_host.*:#auth_host:g" -i ${NEUTRON_CONF_DIR}/neutron.conf
     sed -e "s:^auth_port.*:#auth_port:g" -i ${NEUTRON_CONF_DIR}/neutron.conf
     sed -e "s:^auth_protocol.*:#auth_protocol:g" -i ${NEUTRON_CONF_DIR}/neutron.conf
@@ -154,24 +154,6 @@ pkg_postinst_${SRCNAME}-setup () {
                            --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head
 }
 
-CHEF_SERVICES_CONF_FILES := " \
-    ${sysconfdir}/${SRCNAME}/neutron.conf \
-    ${sysconfdir}/${SRCNAME}/metadata_agent.ini \
-    ${sysconfdir}/${SRCNAME}/plugins/ml2/ml2_conf.ini \
-    "
-deploychef_services_special_func(){
-    #This function is a callback function for the deploychef .bbclass
-    #We define this special callback funtion because we are doing 
-    #more than a placeholder substitution. The variable CHEF_SERVICES_FILE_NAME
-    #is defined in deploychef_framework.bbclass
-    if [ -n "${CHEF_SERVICES_FILE_NAME}" ]; then
-        sed "s:^# rabbit_host =.*:rabbit_host = %CONTROLLER_IP%:" -i \
-        ${CHEF_SERVICES_FILE_NAME}
-    fi
-}
-
-CHEF_SERVICES_SPECIAL_FUNC := "deploychef_services_special_func"
-
 pkg_postinst_${SRCNAME}-plugin-openvswitch-setup () {
     if [ "x$D" != "x" ]; then
         exit 1
diff --git a/meta-openstack/recipes-devtools/python/python-nova_git.bb b/meta-openstack/recipes-devtools/python/python-nova_git.bb
index 7e0e861..c1f4de1 100644
--- a/meta-openstack/recipes-devtools/python/python-nova_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-nova_git.bb
@@ -30,7 +30,7 @@ PV = "12.0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit update-rc.d setuptools identity hosts useradd default_configs openstackchef monitor
+inherit update-rc.d setuptools identity hosts useradd default_configs monitor
 
 LIBVIRT_IMAGES_TYPE ?= "default"
 
@@ -103,38 +103,38 @@ do_install_append() {
     install -o nova -m 664 ${WORKDIR}/nova.conf               ${NOVA_CONF_DIR}/nova.conf
     install -o nova -m 664 ${TEMPLATE_CONF_DIR}/api-paste.ini ${NOVA_CONF_DIR}
     install -o nova -m 664 ${WORKDIR}/openrc                  ${NOVA_CONF_DIR}
-    if [ -z "${OPENSTACKCHEF_ENABLED}" ]; then
-        # Configuration options
-        sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" \
-            -i ${NOVA_CONF_DIR}/api-paste.ini
-        sed -e "s:%SERVICE_USER%:${SRCNAME}:g" -i ${NOVA_CONF_DIR}/api-paste.ini
-        sed -e "s:%SERVICE_PASSWORD%:${SERVICE_PASSWORD}:g" \
-            -i ${NOVA_CONF_DIR}/api-paste.ini
-        sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${NOVA_CONF_DIR}/api-paste.ini
 
-        sed -e "s:%DB_USER%:${DB_USER}:g" -i ${NOVA_CONF_DIR}/nova.conf
-        sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${NOVA_CONF_DIR}/nova.conf
+    # Configuration options
+    sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" \
+	-i ${NOVA_CONF_DIR}/api-paste.ini
+    sed -e "s:%SERVICE_USER%:${SRCNAME}:g" -i ${NOVA_CONF_DIR}/api-paste.ini
+    sed -e "s:%SERVICE_PASSWORD%:${SERVICE_PASSWORD}:g" \
+	-i ${NOVA_CONF_DIR}/api-paste.ini
+    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${NOVA_CONF_DIR}/api-paste.ini
 
-        sed -e "s:%METADATA_SHARED_SECRET%:${METADATA_SHARED_SECRET}:g" -i ${NOVA_CONF_DIR}/nova.conf
+    sed -e "s:%DB_USER%:${DB_USER}:g" -i ${NOVA_CONF_DIR}/nova.conf
+    sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${NOVA_CONF_DIR}/nova.conf
 
-        sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${NOVA_CONF_DIR}/nova.conf
-        sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${NOVA_CONF_DIR}/nova.conf
+    sed -e "s:%METADATA_SHARED_SECRET%:${METADATA_SHARED_SECRET}:g" -i ${NOVA_CONF_DIR}/nova.conf
 
-        sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${NOVA_CONF_DIR}/nova.conf
-        sed -e "s:%COMPUTE_HOST%:${COMPUTE_HOST}:g" -i ${NOVA_CONF_DIR}/nova.conf
+    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${NOVA_CONF_DIR}/nova.conf
+    sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${NOVA_CONF_DIR}/nova.conf
 
-        sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" -i ${NOVA_CONF_DIR}/nova.conf
-        sed -e "s:%SERVICE_USER%:${SRCNAME}:g" -i ${NOVA_CONF_DIR}/nova.conf
-        sed -e "s:%SERVICE_PASSWORD%:${SERVICE_PASSWORD}:g" -i ${NOVA_CONF_DIR}/nova.conf
+    sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${NOVA_CONF_DIR}/nova.conf
+    sed -e "s:%COMPUTE_HOST%:${COMPUTE_HOST}:g" -i ${NOVA_CONF_DIR}/nova.conf
 
-        sed -e "s:%LIBVIRT_IMAGES_TYPE%:${LIBVIRT_IMAGES_TYPE}:g" -i ${NOVA_CONF_DIR}/nova.conf
+    sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" -i ${NOVA_CONF_DIR}/nova.conf
+    sed -e "s:%SERVICE_USER%:${SRCNAME}:g" -i ${NOVA_CONF_DIR}/nova.conf
+    sed -e "s:%SERVICE_PASSWORD%:${SERVICE_PASSWORD}:g" -i ${NOVA_CONF_DIR}/nova.conf
 
-        sed -e "s:%OS_PASSWORD%:${ADMIN_PASSWORD}:g" -i ${NOVA_CONF_DIR}/openrc
-        sed -e "s:%SERVICE_TOKEN%:${SERVICE_TOKEN}:g" -i ${NOVA_CONF_DIR}/openrc
+    sed -e "s:%LIBVIRT_IMAGES_TYPE%:${LIBVIRT_IMAGES_TYPE}:g" -i ${NOVA_CONF_DIR}/nova.conf
+
+    sed -e "s:%OS_PASSWORD%:${ADMIN_PASSWORD}:g" -i ${NOVA_CONF_DIR}/openrc
+    sed -e "s:%SERVICE_TOKEN%:${SERVICE_TOKEN}:g" -i ${NOVA_CONF_DIR}/openrc
+
+    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${NOVA_CONF_DIR}/openrc
+    sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${NOVA_CONF_DIR}/openrc
 
-        sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${NOVA_CONF_DIR}/openrc
-        sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${NOVA_CONF_DIR}/openrc
-    fi
     install -o nova -d ${NOVA_CONF_DIR}/instances
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
@@ -159,12 +159,6 @@ do_install_append() {
     cp -r "${S}/plugins" "${D}/${PYTHON_SITEPACKAGES_DIR}/nova"
 }
 
-CHEF_SERVICES_CONF_FILES := "\
-    ${sysconfdir}/${SRCNAME}/nova.conf \
-    ${sysconfdir}/${SRCNAME}/api-paste.ini \
-    ${sysconfdir}/${SRCNAME}/openrc \
-    "
-
 pkg_postinst_${SRCNAME}-setup () {
     if [ "x$D" != "x" ]; then
         exit 1
diff --git a/meta-openstack/recipes-devtools/python/python-swift_git.bb b/meta-openstack/recipes-devtools/python/python-swift_git.bb
index 7862251..8552ea7 100644
--- a/meta-openstack/recipes-devtools/python/python-swift_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-swift_git.bb
@@ -20,7 +20,7 @@ SRCREV="4ca08cc395e686265574366497a6869e94eebcb2"
 PV="2.2.2+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-inherit setuptools python-dir update-rc.d hosts identity openstackchef
+inherit setuptools python-dir update-rc.d hosts identity
 
 # The size of the backing file (in Gigabytes) of loopback devices
 # which are used for setting up Swift storage devices.  The value
@@ -82,39 +82,32 @@ do_install_append() {
     sed 's/^# swift_dir =.*/swift_dir = \/etc\/swift/' -i ${SWIFT_CONF_DIR}/object-server.conf
     sed 's/^# devices =.*/devices = \/etc\/swift\/node/' -i ${SWIFT_CONF_DIR}/object-server.conf
     sed 's/^# mount_check =.*/mount_check = false/' -i ${SWIFT_CONF_DIR}/object-server.conf
-    if [ -z "${OPENSTACKCHEF_ENABLED}" ]; then
-        sed "s/%SERVICE_TENANT_NAME%/${SERVICE_TENANT_NAME}/g" -i ${SWIFT_CONF_DIR}/proxy-server.conf
-        sed "s/%SERVICE_USER%/${SRCNAME}/g" -i ${SWIFT_CONF_DIR}/proxy-server.conf
-        sed "s/%SERVICE_PASSWORD%/${SERVICE_PASSWORD}/g" -i ${SWIFT_CONF_DIR}/proxy-server.conf
-
-        sed "s/%SERVICE_TENANT_NAME%/${SERVICE_TENANT_NAME}/g" -i ${SWIFT_CONF_DIR}/dispersion.conf
-        sed "s/%SERVICE_USER%/${SRCNAME}/g" -i ${SWIFT_CONF_DIR}/dispersion.conf
-        sed "s/%SERVICE_PASSWORD%/${SERVICE_PASSWORD}/g" -i ${SWIFT_CONF_DIR}/dispersion.conf
-
-        sed "s/%ADMIN_TENANT_NAME%/admin/g" -i ${SWIFT_CONF_DIR}/test.conf
-        sed "s/%ADMIN_USER%/admin/g" -i ${SWIFT_CONF_DIR}/test.conf
-        sed "s/%ADMIN_PASSWORD%/${ADMIN_PASSWORD}/g" -i ${SWIFT_CONF_DIR}/test.conf
-        sed "s/%SERVICE_TENANT_NAME%/${SERVICE_TENANT_NAME}/g" -i ${SWIFT_CONF_DIR}/test.conf
-        sed "s/%SERVICE_USER%/${SRCNAME}/g" -i ${SWIFT_CONF_DIR}/test.conf
-        sed "s/%SERVICE_PASSWORD%/${SERVICE_PASSWORD}/g" -i ${SWIFT_CONF_DIR}/test.conf
-        sed "s/%DEMO_USER%/demo/g" -i ${SWIFT_CONF_DIR}/test.conf
-        sed "s/%DEMO_PASSWORD%/${ADMIN_PASSWORD}/g" -i ${SWIFT_CONF_DIR}/test.conf
-
-        sed "s/%SWIFT_BACKING_FILE_SIZE%/${SWIFT_BACKING_FILE_SIZE}/g" -i ${D}${sysconfdir}/init.d/swift
-        sed "s/%CONTROLLER_IP%/${CONTROLLER_IP}/g" -i ${D}${sysconfdir}/init.d/swift
-    fi
+
+    sed "s/%SERVICE_TENANT_NAME%/${SERVICE_TENANT_NAME}/g" -i ${SWIFT_CONF_DIR}/proxy-server.conf
+    sed "s/%SERVICE_USER%/${SRCNAME}/g" -i ${SWIFT_CONF_DIR}/proxy-server.conf
+    sed "s/%SERVICE_PASSWORD%/${SERVICE_PASSWORD}/g" -i ${SWIFT_CONF_DIR}/proxy-server.conf
+
+    sed "s/%SERVICE_TENANT_NAME%/${SERVICE_TENANT_NAME}/g" -i ${SWIFT_CONF_DIR}/dispersion.conf
+    sed "s/%SERVICE_USER%/${SRCNAME}/g" -i ${SWIFT_CONF_DIR}/dispersion.conf
+    sed "s/%SERVICE_PASSWORD%/${SERVICE_PASSWORD}/g" -i ${SWIFT_CONF_DIR}/dispersion.conf
+
+    sed "s/%ADMIN_TENANT_NAME%/admin/g" -i ${SWIFT_CONF_DIR}/test.conf
+    sed "s/%ADMIN_USER%/admin/g" -i ${SWIFT_CONF_DIR}/test.conf
+    sed "s/%ADMIN_PASSWORD%/${ADMIN_PASSWORD}/g" -i ${SWIFT_CONF_DIR}/test.conf
+    sed "s/%SERVICE_TENANT_NAME%/${SERVICE_TENANT_NAME}/g" -i ${SWIFT_CONF_DIR}/test.conf
+    sed "s/%SERVICE_USER%/${SRCNAME}/g" -i ${SWIFT_CONF_DIR}/test.conf
+    sed "s/%SERVICE_PASSWORD%/${SERVICE_PASSWORD}/g" -i ${SWIFT_CONF_DIR}/test.conf
+    sed "s/%DEMO_USER%/demo/g" -i ${SWIFT_CONF_DIR}/test.conf
+    sed "s/%DEMO_PASSWORD%/${ADMIN_PASSWORD}/g" -i ${SWIFT_CONF_DIR}/test.conf
+
+    sed "s/%SWIFT_BACKING_FILE_SIZE%/${SWIFT_BACKING_FILE_SIZE}/g" -i ${D}${sysconfdir}/init.d/swift
+    sed "s/%CONTROLLER_IP%/${CONTROLLER_IP}/g" -i ${D}${sysconfdir}/init.d/swift
+
     cp -r test ${D}/${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/
     grep -rl '^from test' ${D}/${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/test | xargs sed 's/^from test/from swift\.test/g' -i
 
 }
 
-CHEF_SERVICES_CONF_FILES := " \
-    ${sysconfdir}/${SRCNAME}/test.conf \
-    ${sysconfdir}/${SRCNAME}/dispersion.conf \
-    ${sysconfdir}/${SRCNAME}/proxy-server.conf \
-    ${sysconfdir}/init.d/swift \
-    "
-
 pkg_postinst_${SRCNAME}-setup () {
     if [ "x$D" != "x" ]; then
         exit 1
diff --git a/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb b/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb
index 01ee924..c6b3529 100644
--- a/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb
+++ b/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb
@@ -28,19 +28,15 @@ do_install_prepend() {
 
 do_install_append() {
     install -m 0755 ${WORKDIR}/cloud.cfg ${D}${sysconfdir}/cloud/cloud.cfg
-    if [ -z "${OPENSTACKCHEF_ENABLED}" ]; then
-        sed -e "s:%MANAGE_HOSTS%:${MANAGE_HOSTS}:g" -i ${D}${sysconfdir}/cloud/cloud.cfg
-        sed -e "s:%HOSTNAME%:${HOSTNAME}:g" -i ${D}${sysconfdir}/cloud/cloud.cfg
-    fi
+
+    sed -e "s:%MANAGE_HOSTS%:${MANAGE_HOSTS}:g" -i ${D}${sysconfdir}/cloud/cloud.cfg
+    sed -e "s:%HOSTNAME%:${HOSTNAME}:g" -i ${D}${sysconfdir}/cloud/cloud.cfg
+
     ln -s ${libdir}/${BPN}/uncloud-init ${D}${sysconfdir}/cloud/uncloud-init
     ln -s ${libdir}/${BPN}/write-ssh-key-fingerprints ${D}${sysconfdir}/cloud/write-ssh-key-fingerprints
 }
 
-inherit setuptools update-rc.d openstackchef
-
-CHEF_SERVICES_CONF_FILES := " \
-    ${sysconfdir}/cloud/cloud.cfg \
-    "
+inherit setuptools update-rc.d
 
 PACKAGES += "${PN}-systemd"
 
diff --git a/meta-openstack/recipes-extended/glusterfs/glusterfs_3.4.2.bbappend b/meta-openstack/recipes-extended/glusterfs/glusterfs_3.4.2.bbappend
deleted file mode 100644
index b52d27a..0000000
--- a/meta-openstack/recipes-extended/glusterfs/glusterfs_3.4.2.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-#
-# Copyright (C) 2013 Wind River Systems, Inc.
-#
-inherit openstackchef
-
-
diff --git a/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.2.4.bb b/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.2.4.bb
index 6ac3e59..101d098 100644
--- a/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.2.4.bb
+++ b/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.2.4.bb
@@ -46,7 +46,7 @@ do_install() {
     mv ${D}/plugins ${RABBIT_LIB_DIR}/plugins
 }
 
-inherit useradd update-rc.d openstackchef
+inherit useradd update-rc.d
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system rabbitmq"
diff --git a/meta-openstack/recipes-support/deploychef/deploychef_0.1.bb b/meta-openstack/recipes-support/deploychef/deploychef_0.1.bb
deleted file mode 100644
index 6237538..0000000
--- a/meta-openstack/recipes-support/deploychef/deploychef_0.1.bb
+++ /dev/null
@@ -1,100 +0,0 @@
-#
-# Copyright (C) 2014 Wind River Systems, Inc.
-#
-SUMMARY = "For the provisioning of OpenStack nodes"
-DESCRIPTION = "There are a number of variables that are baked into Openstack \
-at build time, for example the ip address of a compute or controller node. \
-This means that when a new compute or controller node boots up, it will \
-have an ip address that differs from its currently assigned ip address \
-This package facilitates the recreation of openstack script and \ 
-configuration files, as well as their placement in the appropriate directories on \
-the files system on a compute/controller/allinone node at runtime"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-PR = "r1"
-
-
-RDEPENDS_${PN} = "chef"
-SRC_URI = "\
-    file://deploychef.init  \
-    file://attributes.json  \
-    file://config.rb \
-    file://default_recipe.rb \
-    file://run-openstackchef \
-    file://run-postinsts \
-    file://run-deploychef \
-    file://service-shutdown \
-    file://deploychef-inc \
-    "
-inherit update-rc.d identity hosts default_configs
-
-S = "${WORKDIR}"
-#Since this package does not need to be ran for each boot-up
-#There is no need for an init scrpt so install it in /opt/${BPN}
-DEPLOYCHEF_ROOT_DIR ?= "/opt/${BPN}"
-POSTINSTS_DIR ?= "rpm-postinsts"
-
-#Provide a mechanism for these strings to be over-written if necessary
-COOKBOOK_DIR = "${DEPLOYCHEF_ROOT_DIR}/cookbooks/"
-ATTRIBUTE_DIR = "${DEPLOYCHEF_ROOT_DIR}/cookbooks/openstack/attributes/"
-RECIPE_DIR = "${DEPLOYCHEF_ROOT_DIR}/cookbooks/openstack/recipes/"
-
-FILES_${PN} += " \
-    ${DEPLOYCHEF_ROOT_DIR}/* \
-    ${DEPLOYCHEF_ROOT_DIR}/conf-templates/* \
-    ${DEPLOYCHEF_ROOT_DIR}/cookbooks/* \
-    ${DEPLOYCHEF_ROOT_DIR}/cookbooks/openstack/recipes/* \
-    ${DEPLOYCHEF_ROOT_DIR}/cookbooks/openstack/templates/* \
-    ${DEPLOYCHEF_ROOT_DIR}/cookbooks/openstack/templates/default \
-    ${DEPLOYCHEF_ROOT_DIR}/cookbooks/openstack/attributes \
-    ${DEPLOYCHEF_ROOT_DIR}/cookbooks/openstack/attributes/* \
-    "
-#Read the module config files and make them into
-#chef-solo templates
-do_install() {
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-        #This script will make templates out of postinst script before they
-        #have a chance to run
-        install -d ${D}${sysconfdir}/init.d
-        install -m 0755 ${S}/${BPN}.init ${D}${sysconfdir}/init.d/${BPN}
-
-        install -d ${D}/${DEPLOYCHEF_ROOT_DIR}
-        #Copy the template configuration scripts to image directory
-        install -m 0644 ${S}/config.rb ${D}/${DEPLOYCHEF_ROOT_DIR}/config.rb
-        install -m 0644 ${S}/attributes.json ${D}/${DEPLOYCHEF_ROOT_DIR}/attributes.json
-        install -m 0755 ${S}/run-postinsts ${D}/${DEPLOYCHEF_ROOT_DIR}/run-postinsts
-        install -m 0755 ${S}/run-openstackchef ${D}/${DEPLOYCHEF_ROOT_DIR}/run-openstackchef
-        install -m 0755 ${S}/run-deploychef  ${D}/${DEPLOYCHEF_ROOT_DIR}/run-deploychef
-        install -m 0755 ${S}/service-shutdown  ${D}/${DEPLOYCHEF_ROOT_DIR}/service-shutdown
-        install -m 0644 ${S}/deploychef-inc  ${D}/${DEPLOYCHEF_ROOT_DIR}/deploychef-inc
-        #Copy the chefsolo recipe file to chefsolo recipe folder
-        install -d ${D}/${RECIPE_DIR}
-        install -m 0644 ${S}/default_recipe.rb  ${D}/${RECIPE_DIR}/default.rb
-    fi
-}
-
-do_install_append() {
-
-    #Replace all required placeholders
-    for file in "${D}/${DEPLOYCHEF_ROOT_DIR}/run-deploychef \ 
-        ${D}/${DEPLOYCHEF_ROOT_DIR}/service-shutdown \
-        ${D}/${DEPLOYCHEF_ROOT_DIR}/deploychef-inc \
-        ${D}/${DEPLOYCHEF_ROOT_DIR}/run-postinsts \
-        ${D}/${DEPLOYCHEF_ROOT_DIR}/run-openstackchef \
-        ${D}/${RECIPE_DIR}/default.rb \
-        ${D}/${sysconfdir}/init.d/${BPN} "; do
-
-        sed -i s:%SYSCONFDIR%:${sysconfdir}:g $file
-        sed -i s:%POSTINSTS_DIR%:${POSTINSTS_DIR}:g $file
-        sed -i s:%PACKAGE_NAME%:${BPN}:g $file
-        sed -i s:%DEPLOYCHEF_ROOT_DIR%:${DEPLOYCHEF_ROOT_DIR}:g $file
-    done
-}
-
-INITSCRIPT_PACKAGES = "${BPN}"
-INITSCRIPT_NAME_${BPN} = "${BPN}"
-INITSCRIPT_PARAMS = "start 96 S ."
-
diff --git a/meta-openstack/recipes-support/deploychef/files/deploychef.init b/meta-openstack/recipes-support/deploychef/files/deploychef.init
deleted file mode 100644
index 22f318b..0000000
--- a/meta-openstack/recipes-support/deploychef/files/deploychef.init
+++ /dev/null
@@ -1,26 +0,0 @@
-#!/bin/bash
-#After this script executes, it runs the 'run-openstackchef' script found in
-#/opt/deploychef/ directory. After that, all the 
-#configuration files that were registered with openstackchef class are
-#created using run-time environment variables and default values
-# found in /opt/deploychef/cookbooks/openstack/attributes/default.rb
-deploychef_root=%DEPLOYCHEF_ROOT_DIR%
-LOG_DIR=/var/log/%PACKAGE_NAME%
-LOG_FILE=$LOG_DIR/%PACKAGE_NAME%.log
-script_file=$deploychef_root/run-openstackchef
-chefsolo_success_file="%SYSCONFDIR%/chefsolo.ran"
-if [ ! -f $chefsolo_success_file ]; then
-    if [ -f $script_file ] ; then
-        mkdir -p $LOG_DIR
-        #Remove deploy init script if present
-        rm -f /etc/init.d/deploy 2>/dev/null
-        cd $deploychef_root
-        . $(basename $script_file)
-        if [ $? = 0 ]; then
-            echo "Deploychef successfully created chefsolo configuration files" \
-            > $LOG_FILE
-        else
-            echo "deploychef ERROR: $i failed." > $LOG_FILE 
-        fi
-    fi
-fi
diff --git a/meta-openstack/recipes-support/deploychef/files/run-deploychef b/meta-openstack/recipes-support/deploychef/files/run-deploychef
deleted file mode 100644
index 4fd41d8..0000000
--- a/meta-openstack/recipes-support/deploychef/files/run-deploychef
+++ /dev/null
@@ -1,33 +0,0 @@
-#!/bin/bash
-# run-deploychef
-#
-# Copyright (c) 2014 Wind River Systems, Inc.
-#
-# Permission is hereby granted, free of charge, to any person obtaining a copy
-# of this software and associated documentation files (the "Software"), to deal
-# in the Software without restriction, including without limitation the rights
-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-# copies of the Software, and to permit persons to whom the Software is
-# furnished to do so, subject to the following conditions:
-#
-# The above copyright notice and this permission notice shall be included in
-# all copies or substantial portions of the Software.
-
-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-# THE SOFTWARE.
-#
-#
-# This file is the main script file that reconfigures the stack when any of 
-# the attributes variables change at run-time.
-#
-#Shutdown all registered services
-. ./service-shutdown
-#Re-generate configuration files from template files
-. ./run-openstackchef
-#Run post-install script and then start services
-. ./run-postinsts
diff --git a/meta-openstack/recipes-support/deploychef/files/run-openstackchef b/meta-openstack/recipes-support/deploychef/files/run-openstackchef
deleted file mode 100644
index 18e6a68..0000000
--- a/meta-openstack/recipes-support/deploychef/files/run-openstackchef
+++ /dev/null
@@ -1,30 +0,0 @@
-#!/bin/bash
-# run-openstackchef
-#
-# Copyright (c) 2014 Wind River Systems, Inc.
-#
-# Permission is hereby granted, free of charge, to any person obtaining a copy
-# of this software and associated documentation files (the "Software"), to deal
-# in the Software without restriction, including without limitation the rights
-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-# copies of the Software, and to permit persons to whom the Software is
-# furnished to do so, subject to the following conditions:
-#
-# The above copyright notice and this permission notice shall be included in
-# all copies or substantial portions of the Software.
-
-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-# THE SOFTWARE.
-#
-#
-# This script just runs chefsolo to generate our configuration files
-#
-#
-#Use chefsolo to generate configuration files/scripts base on 
-#templates if templates/default
-chef-solo -f -c config.rb  -j attributes.json
diff --git a/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend b/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend
index 42ceaf8..22dae71 100644
--- a/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend
+++ b/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend
@@ -3,7 +3,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 SRC_URI += "file://postgresql \
             file://postgresql-init"
 
-inherit useradd update-rc.d identity hosts openstackchef
+inherit useradd update-rc.d identity hosts
 
 PACKAGECONFIG[libxml] = "--with-libxml CFLAGS=-I${STAGING_INCDIR}/libxml2,--without-libxml,libxml2,libxml2"
 
@@ -16,25 +16,19 @@ do_install_append() {
     install -d ${D}${sysconfdir}/init.d/
     install -m 0755 ${WORKDIR}/postgresql ${INIT_D_DEST_DIR}/postgresql
     install -m 0755 ${WORKDIR}/postgresql-init ${INIT_D_DEST_DIR}/postgresql-init
-    if [ -z "${OPENSTACKCHEF_ENABLED}" ]; then
-        sed -e "s:%DB_DATADIR%:${DB_DATADIR}:g" -i ${INIT_D_DEST_DIR}/postgresql
-        sed -e "s:%DB_DATADIR%:${DB_DATADIR}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
 
-        sed -e "s:%DB_USER%:${DB_USER}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
-        sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
+    sed -e "s:%DB_DATADIR%:${DB_DATADIR}:g" -i ${INIT_D_DEST_DIR}/postgresql
+    sed -e "s:%DB_DATADIR%:${DB_DATADIR}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
 
-        sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
-        sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
+    sed -e "s:%DB_USER%:${DB_USER}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
+    sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
 
-        sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
-        sed -e "s:%COMPUTE_HOST%:${COMPUTE_HOST}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
-    fi
-}
+    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
+    sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
 
-CHEF_SERVICES_CONF_FILES := "\
-    ${sysconfdir}/init.d/postgresql \
-    ${sysconfdir}/init.d/postgresql-init \
-    "
+    sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
+    sed -e "s:%COMPUTE_HOST%:${COMPUTE_HOST}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
+}
 
 RDEPENDS_${PN} += "postgresql-timezone eglibc-utils update-rc.d"
 USERADD_PACKAGES = "${PN}"
-- 
2.7.4


