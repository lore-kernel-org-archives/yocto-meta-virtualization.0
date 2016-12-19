Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9AC23E00563; Mon, 19 Dec 2016 12:10:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B508E004E5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Dec 2016 12:10:39 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBJKAcKl015814
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Dec 2016 12:10:38 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Dec 2016 12:10:37 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 19 Dec 2016 15:10:37 -0500
Message-ID: <1482178237-20876-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [[m-c-s][PATCH] housekeeping: drop usage of bb.data.getVar()
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
X-List-Received-Date: Mon, 19 Dec 2016 20:10:42 -0000
Content-Type: text/plain

Similar to oe-core commit 2864ff6a4b3c3f9b3bbb6d2597243cc5d3715939 the
bb.data.getVar() have been deprecated for enough time now that it has
been removed. We need to switch to the new getVar() to get things
working again.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/classes/monitor.bbclass            | 22 +++++++++---------
 meta-openstack/classes/openstackchef_inc.bbclass  | 28 +++++++++++------------
 meta-openstack/recipes-devtools/erlang/erlang.inc |  2 +-
 3 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/meta-openstack/classes/monitor.bbclass b/meta-openstack/classes/monitor.bbclass
index a959f09..e916137 100644
--- a/meta-openstack/classes/monitor.bbclass
+++ b/meta-openstack/classes/monitor.bbclass
@@ -12,7 +12,7 @@ addtask monitor_clean before do_clean
 def copy_check_files(d, check_var_name, src, dest):
     import shutil
 
-    mon_checks = bb.data.getVar(check_var_name, d, 1)
+    mon_checks = d.getVar(check_var_name, 1)
     if mon_checks != None:
         if not os.path.exists(dest):
             os.makedirs(dest)
@@ -29,9 +29,9 @@ python do_monitor_install() {
         bb.debug(1, 'OpenStack monitoring feature is disabled, skipping do_monitor_install')
         return
 
-    mon_dir = bb.data.getVar('MONITOR_STAGING_DIR', d, 1)
-    mon_services_dir = bb.data.getVar('MONITOR_STAGING_SERVICES_DIR', d, 1)
-    mon_checks_dir = bb.data.getVar('MONITOR_STAGING_CHECKS_DIR', d, 1)
+    mon_dir = d.getVar('MONITOR_STAGING_DIR', 1)
+    mon_services_dir = d.getVar('MONITOR_STAGING_SERVICES_DIR', 1)
+    mon_checks_dir = d.getVar('MONITOR_STAGING_CHECKS_DIR', 1)
     if not os.path.exists(mon_dir):
         os.makedirs(mon_dir)
     if not os.path.exists(mon_services_dir):
@@ -41,13 +41,13 @@ python do_monitor_install() {
     workdir = d.getVar('WORKDIR', True)
 
     # Process monitor SERVICE catagory
-    mon_service_pkgs = bb.data.getVar('MONITOR_SERVICE_PACKAGES', d, 1)
+    mon_service_pkgs = d.getVar('MONITOR_SERVICE_PACKAGES', 1)
     if mon_service_pkgs != None:
         for pkg in mon_service_pkgs.split():
             f_name = os.path.join(mon_services_dir, pkg + '.service')
             if os.path.exists(f_name):
                 os.remove(f_name)
-            data = bb.data.getVar('MONITOR_SERVICE_' + pkg, d, 1)
+            data = d.getVar('MONITOR_SERVICE_' + pkg, 1)
             if data != None:
                 f = open(f_name, 'w')
                 f.write(d.getVar('MONITOR_SERVICE_' + pkg))
@@ -62,14 +62,14 @@ python do_monitor_install() {
 python do_monitor_clean() {
     import shutil
 
-    mon_dir = bb.data.getVar('MONITOR_STAGING_DIR', d, 1)
-    mon_services_dir = bb.data.getVar('MONITOR_STAGING_SERVICES_DIR', d, 1)
-    mon_checks_dir = bb.data.getVar('MONITOR_STAGING_CHECKS_DIR', d, 1)
+    mon_dir = d.getVar('MONITOR_STAGING_DIR', 1)
+    mon_services_dir = d.getVar('MONITOR_STAGING_SERVICES_DIR', 1)
+    mon_checks_dir = d.getVar('MONITOR_STAGING_CHECKS_DIR', 1)
     if not os.path.exists(mon_dir):
         return
 
     # Clean up monitor SERVICE catagory
-    mon_service_pkgs = bb.data.getVar('MONITOR_SERVICE_PACKAGES', d, 1)
+    mon_service_pkgs = d.getVar('MONITOR_SERVICE_PACKAGES', 1)
     if mon_service_pkgs != None and os.path.exists(mon_services_dir):
         for pkg in mon_service_pkgs.split():
             f_name = os.path.join(mon_services_dir, pkg + '.service')
@@ -80,7 +80,7 @@ python do_monitor_clean() {
     packages = (d.getVar('PACKAGES', True) or "").split()
     if len(packages) >= 1 and os.path.exists(mon_checks_dir):
         for pkg in packages:
-            if bb.data.getVar('MONITOR_CHECKS_' + pkg, d, 1) != None:
+            if d.getVar('MONITOR_CHECKS_' + pkg, 1) != None:
                 shutil.rmtree(mon_checks_dir + "/" + pkg, True)
 }
 
diff --git a/meta-openstack/classes/openstackchef_inc.bbclass b/meta-openstack/classes/openstackchef_inc.bbclass
index 048fce6..91adb41 100644
--- a/meta-openstack/classes/openstackchef_inc.bbclass
+++ b/meta-openstack/classes/openstackchef_inc.bbclass
@@ -184,12 +184,12 @@ def deploychef_make_startup_shutdown_list(d):
 
     import os
     if d.getVar('INITSCRIPT_PACKAGES') or d.getVar('INITSCRIPT_NAME'):
-        #script_list = bb.data.getVar('INITSCRIPT_PACKAGES', d , 1)
+        #script_list = d.getVar('INITSCRIPT_PACKAGES', 1)
         script_list = d.getVar('INITSCRIPT_PACKAGES', True) or \ 
          d.getVar('INITSCRIPT_NAME', True)  #Some package do not define INITSCRIPT_PACKAGES
         msg="list of start/stop services: %s" % str(script_list)
         bb.debug(2, msg)
-        base_dir = bb.data.getVar('CHEF_TEMPLATE_BASE', d, 1 )
+        base_dir = d.getVar('CHEF_TEMPLATE_BASE', 1 )
         if not os.path.exists(base_dir):
             os.mkdir(base_dir)
         startup_file = os.path.join(base_dir, d.getVar('SRCNAME', True) +'-startup-list')
@@ -311,15 +311,15 @@ def deploychef_make_substitutions(d, sub_dict, attr_filename, sed_filename):
             hFile.close()
             if False:
                 msg = "Cannot read/write to attributes file %s as expected:%s"\
-                % (attr_filename, bb.data.getVar('FILE', d))
+                % (attr_filename, d.getVar('FILE'))
                 bb.build.FuncFailed(msg)
         else:
             msg = "The substitution dictionary variable sub_dict is not set  %s as expected "\
-            % bb.data.getVar('FILE')
+            % d.getVar('FILE')
             bb.error(msg)
     else:
         msg = "Null file names passsed to function %s %s "\
-        % (bb.data.getVar('FUNC',d), bb.data.getVar('FILE', d))
+        % (d.getVar('FUNC'), d.getVar('FILE'))
         bb.error(msg)
 
 
@@ -338,7 +338,7 @@ def deploychef_make_templates( d, conf_tuple=tuple()):
 
     if len(conf_tuple):
         import os, ast
-        base_dir = bb.data.getVar('CHEF_TEMPLATE_BASE', d, 1 )
+        base_dir = d.getVar('CHEF_TEMPLATE_BASE', 1 )
         attr_file = os.path.join(base_dir, d.getVar('SRCNAME', True) + '-attributes.rb')
         msg ="Default attributes saved to %s" % attr_file
         if os.path.exists(attr_file):
@@ -357,9 +357,9 @@ def deploychef_make_templates( d, conf_tuple=tuple()):
                 
                 #Make the necessary susbstitutions using the default
                 #substitutiin dictionary
-                sub_dict = bb.data.getVar('CHEF_SERVICES_DEFAULT_CONF_SUBS', d , 1)
+                sub_dict = d.getVar('CHEF_SERVICES_DEFAULT_CONF_SUBS', 1)
                 msg = "The variable %s is not set in %s as a dictionary as expected "\
-                % ('CHEF_SERVICES_DEFAULT_CONF_SUBS', bb.data.getVar('FILE', d))
+                % ('CHEF_SERVICES_DEFAULT_CONF_SUBS', d.getVar('FILE'))
                 if sub_dict:
                     #Safely retrieve our python data structure
                     sub_dict = ast.literal_eval(sub_dict)
@@ -371,11 +371,11 @@ def deploychef_make_templates( d, conf_tuple=tuple()):
                     raise bb.build.FuncFailed(msg)
                 #Make the necessary susbstitutions using auxilliary dictionary
                 #if provided by inheriting class
-                sub_dict = bb.data.getVar('CHEF_SERVICES_CONF_SUBS', d , 1)
+                sub_dict = d.getVar('CHEF_SERVICES_CONF_SUBS', 1)
                 if sub_dict:
                     sub_dict = ast.literal_eval(sub_dict)
                     msg = "The variable %s is not set in %s as a dictionary as expected "\
-                    % ('CHEF_SERVICES_CONF_SUB', bb.data.getVar('FILE', d))
+                    % ('CHEF_SERVICES_CONF_SUB', d.getVar('FILE'))
                     if type(sub_dict) is dict:
                         pass
                         deploychef_make_substitutions(d, sub_dict, attr_file, file_name)
@@ -530,11 +530,11 @@ def deploychef_postinst_substitutions(d, sub_dict, postinst):
                 hFile.close()
         else:
             msg = "The substitution dictionary variable sub_dict is not set  %s as expected "\
-            % bb.data.getVar('FILE')
+            % d.getVar('FILE')
             bb.build.FuncFailed(msg)
     else:
         msg = "Null string passsed to function %s %s "\
-        % (bb.data.getVar('FUNC',d), bb.data.getVar('FILE', d))
+        % (d.getVar('FUNC'), d.getVar('FILE'))
         bb.build.FuncFailed(msg)
     return postinst
 
@@ -565,9 +565,9 @@ def deploychef_update_package_postinsts(d):
             overrides = d.getVar("OVERRIDES", True)
             msg = "%s The override variable is %s :\n %s " % (pkg, overrides, postinst)
             bb.note(msg)
-            sub_dict = bb.data.getVar('CHEF_SERVICES_DEFAULT_CONF_SUBS', d , 1)
+            sub_dict = d.getVar('CHEF_SERVICES_DEFAULT_CONF_SUBS', 1)
             msg = "The variable %s is not set in %s as a dictionary as expected "\
-            % ('CHEF_SERVICES_DEFAULT_CONF_SUBS', bb.data.getVar('FILE', d))
+            % ('CHEF_SERVICES_DEFAULT_CONF_SUBS', d.getVar('FILE'))
             if sub_dict:
                 import ast
                 #Safely retrieve our python data structure
diff --git a/meta-openstack/recipes-devtools/erlang/erlang.inc b/meta-openstack/recipes-devtools/erlang/erlang.inc
index 8a7bd5a..37446d7 100644
--- a/meta-openstack/recipes-devtools/erlang/erlang.inc
+++ b/meta-openstack/recipes-devtools/erlang/erlang.inc
@@ -6,7 +6,7 @@ PRIORITY = "optional"
 LICENSE = "ErlPL-1.1"
 LIC_FILES_CHKSUM = "file://EPLICENCE;md5=09f9063ea35bc5bd124df2fda1d9d2c7"
 
-UPSTREAM_VERSION = "${@bb.data.getVar('PV', d, 1).replace('.', '-')}"
+UPSTREAM_VERSION = "${@d.getVar('PV', 1).replace('.', '-')}"
 
 SRC_URI = "http://erlang.org/download/otp_src_${UPSTREAM_VERSION}.tar.gz \
     file://erlang-fix-build-issue-in-Yocto.patch \
-- 
2.7.4


