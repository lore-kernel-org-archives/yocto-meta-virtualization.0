Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1E4B0E009C2; Thu, 16 Apr 2015 23:56:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D619E0085D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Apr 2015 23:55:59 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3H6txlJ013636
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Apr 2015 23:55:59 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 16 Apr 2015 23:56:08 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 17 Apr 2015 14:56:03 +0800
Message-ID: <1429253763-2474-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] package_regex_openstack: fix for openstack core components
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
X-List-Received-Date: Fri, 17 Apr 2015 06:56:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The bitbake git fetcher ignores non-released branches/tags
like beta and rc, but we may want to update the openstack
milestones like 2015.1.0.b2, add the GITTAGREGEX_BETA to
allow this.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../conf/distro/include/package_regex_openstack.inc           | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-openstack/conf/distro/include/package_regex_openstack.inc b/meta-openstack/conf/distro/include/package_regex_openstack.inc
index b72b2d1..6afe5ea 100644
--- a/meta-openstack/conf/distro/include/package_regex_openstack.inc
+++ b/meta-openstack/conf/distro/include/package_regex_openstack.inc
@@ -40,3 +40,14 @@ GITTAGREGEX_pn-python-glanceclient = "${GITTAGREGEX_COMMON}"
 GITTAGREGEX_pn-python-keystoneclient = "${GITTAGREGEX_COMMON}"
 GITTAGREGEX_pn-python-neutronclient = "(?P<pver>\d+\.\d+\.(\d\.?)+)"
 GITTAGREGEX_pn-python-novaclient = "${GITTAGREGEX_COMMON}"
+
+GITTAGREGEX_BETA = "(?P<pver>\d+\.\d+(\.\d+(b\d)?)?)"
+GITTAGREGEX_pn-python-barbican = "${GITTAGREGEX_BETA}"
+GITTAGREGEX_pn-python-ceilometer = "${GITTAGREGEX_BETA}"
+GITTAGREGEX_pn-python-cinder = "${GITTAGREGEX_BETA}"
+GITTAGREGEX_pn-python-glance = "${GITTAGREGEX_BETA}"
+GITTAGREGEX_pn-python-heat = "${GITTAGREGEX_BETA}"
+GITTAGREGEX_pn-python-horizon = "${GITTAGREGEX_BETA}"
+GITTAGREGEX_pn-python-keystone = "${GITTAGREGEX_BETA}"
+GITTAGREGEX_pn-python-neutron = "${GITTAGREGEX_BETA}"
+GITTAGREGEX_pn-python-nova = "${GITTAGREGEX_BETA}"
-- 
1.9.1


