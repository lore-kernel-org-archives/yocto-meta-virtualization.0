Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 63CBBE00C95; Fri, 18 Mar 2016 13:50:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0484EE00C87
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Mar 2016 13:50:14 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2IKoDCb018472
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Mar 2016 13:50:13 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 18 Mar 2016 13:50:13 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 18 Mar 2016 16:50:10 -0400
Message-ID: <1458334211-26727-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1458334211-26727-1-git-send-email-mark.asselstine@windriver.com>
References: <1458334211-26727-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 2/3] openstackchef: add missing parameter to getVar
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
X-List-Received-Date: Fri, 18 Mar 2016 20:50:18 -0000
Content-Type: text/plain

Builds are failing with:

File: 'openstackchef_inc.bbclass', lineno: 624, function: deploychef_add_file_to_FILES_PN
0620:    pkg_files = "FILES_%s" %  pkg
0621:    ldata.setVar("OVERRIDES", "%s:%s" % (pkg_files, overrides))
0622:    bb.data.update_data(ldata)
0623:
*** 0624:    dest_base = d.getVar('CHEF_TEMPLATE_BASE')
0625:    pkg_imagedir = d.getVar('CHEF_ROOTFS_BASE', True)
0626:    #Add the packages image base directory if it does not already exist
0627:    if re.search(pkg_imagedir, files) == None:
0628:        #All the directory and all files in it
Exception: TypeError: getVar() takes at least 3 arguments (2 given)

Add the required parameter to fix the build. Chef is planned to be
removed from this layer in the near future, so this change is not
tested.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/classes/openstackchef_inc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/classes/openstackchef_inc.bbclass b/meta-openstack/classes/openstackchef_inc.bbclass
index 9574008..b8757be 100644
--- a/meta-openstack/classes/openstackchef_inc.bbclass
+++ b/meta-openstack/classes/openstackchef_inc.bbclass
@@ -621,7 +621,7 @@ def deploychef_add_file_to_FILES_PN(d, conf_file=None):
     ldata.setVar("OVERRIDES", "%s:%s" % (pkg_files, overrides))
     bb.data.update_data(ldata)
 
-    dest_base = d.getVar('CHEF_TEMPLATE_BASE')
+    dest_base = d.getVar('CHEF_TEMPLATE_BASE', True)
     pkg_imagedir = d.getVar('CHEF_ROOTFS_BASE', True)
     #Add the packages image base directory if it does not already exist
     if re.search(pkg_imagedir, files) == None:
-- 
2.1.4


