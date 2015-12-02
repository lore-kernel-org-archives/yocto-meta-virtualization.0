Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C6A67E00A4C; Wed,  2 Dec 2015 08:33:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id CFF5FE00A04
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:07 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:06 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:18 +0100
Message-ID: <1449073966-29707-13-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 12/40] python-wrapt: add recipe
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
X-List-Received-Date: Wed, 02 Dec 2015 16:33:50 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-openstack/recipes-devtools/python/python-wrapt_1.10.5.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-wrapt_1.10.5.bb

diff --git a/meta-openstack/recipes-devtools/python/python-wrapt_1.10.5.bb b/meta-openstack/recipes-devtools/python/python-wrapt_1.10.5.bb
new file mode 100644
index 0000000..5a8d0e7
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-wrapt_1.10.5.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "A Python module for decorators, wrappers and monkey patching."
+HOMEPAGE = "https://pypi.python.org/pypi/wrapt/"
+SECTION = "devel/python"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=848d45ec255e411c0ff82b034a49d8a0"
+
+SRC_URI[md5sum] = "79732bbc096235704e7523d3bacd202c"
+SRC_URI[sha256sum] = "99cbb4e3a3ea964df0cb1437261fc1198616ec872e7b501622f3f7f92fcd0833"
+
+inherit pypi
+
-- 
2.1.0


