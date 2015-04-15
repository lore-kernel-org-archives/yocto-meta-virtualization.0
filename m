Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 31742E009C7; Tue, 14 Apr 2015 22:58:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2941E00830
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Apr 2015 22:58:31 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3F5wUgH027073
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Apr 2015 22:58:30 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 14 Apr 2015 22:58:36 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 15 Apr 2015 13:58:24 +0800
Message-ID: <415624bd113f425dbf66905234fd71324cd9232a.1429074850.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1429074850.git.jackie.huang@windriver.com>
References: <cover.1429074850.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/14] Add helper meta data to find upstream versions correctly
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
X-List-Received-Date: Wed, 15 Apr 2015 05:58:38 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This is referred to:
meta-yocto/conf/distro/include/package_regex.inc

And is used by the auto-upgrade-helper utility:
http://git.yoctoproject.org/cgit/cgit.cgi/auto-upgrade-helper/

It helps generate upgrades automatically for recipes based
on new versions being published upstream.

The initial list includes *client recipes in meta-openstack.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../distro/include/package_regex_openstack.inc     | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-openstack/conf/distro/include/package_regex_openstack.inc

diff --git a/meta-openstack/conf/distro/include/package_regex_openstack.inc b/meta-openstack/conf/distro/include/package_regex_openstack.inc
new file mode 100644
index 0000000..b72b2d1
--- /dev/null
+++ b/meta-openstack/conf/distro/include/package_regex_openstack.inc
@@ -0,0 +1,42 @@
+# package_regex_openstack.inc - This file contains data that tracks
+# upstream project associated with a given recipe. This list is needed
+# for recipes that version information can not be automagically discovered.
+# As we automate this checking, this file will slowly be reduced.
+#
+# This data is used by the auto-upgrade-helper, to use it, you could
+# add the following to your conf/local.conf:
+#   --------------- snip ---------------
+#   INHERIT =+ "distrodata"
+#   require conf/distro/include/package_regex_openstack.inc
+#   --------------- snip ---------------
+#
+# Fore more details about auto-upgrade-help, please refer to:
+#   http://git.yoctoproject.org/cgit/cgit.cgi/auto-upgrade-helper/tree/README
+#
+# The format is as a bitbake variable override for each recipe
+#
+#       REGEX_URI_pn-<recipe name> = "recipe_url"
+#	 - This is the url used by the package checking system to
+#	   get the latest version of the package
+#       REGEX_pn-<recipe name> = "package_regex"
+#	 - This is the regex the package checking system uses to
+#	   parse the page found at REGEX_URI_pn-<recipe name>
+#
+
+COMMON_REGEX = "(?P<pver>(\d+[\.-_]*)+)"
+
+# PyPI sites
+REGEX_URI_pn-python-cephclient = "https://pypi.python.org/pypi/python-cephclient/"
+REGEX_pn-python-cephclient = "/python-cephclient/${COMMON_REGEX}"
+REGEX_URI_pn-python-hp3parclient = "https://pypi.python.org/pypi/hp3parclient/"
+REGEX_pn-python-hp3parclient = "/hp3parclient/${COMMON_REGEX}"
+REGEX_URI_pn-python-openstackclient = "https://pypi.python.org/pypi/python-openstackclient/"
+REGEX_pn-python-openstackclient = "/python-openstackclient/${COMMON_REGEX}"
+
+# GIT
+GITTAGREGEX_COMMON = "(?P<pver>\d+\.\d+\.(\d\.?)*)"
+
+GITTAGREGEX_pn-python-glanceclient = "${GITTAGREGEX_COMMON}"
+GITTAGREGEX_pn-python-keystoneclient = "${GITTAGREGEX_COMMON}"
+GITTAGREGEX_pn-python-neutronclient = "(?P<pver>\d+\.\d+\.(\d\.?)+)"
+GITTAGREGEX_pn-python-novaclient = "${GITTAGREGEX_COMMON}"
-- 
1.9.1


