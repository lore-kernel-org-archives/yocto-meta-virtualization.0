Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35E53E00D86; Fri,  4 Sep 2015 08:15:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	TVD_SPACE_RATIO,TVD_SPACE_RATIO_MINFP autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
	*  2.7 TVD_SPACE_RATIO_MINFP TVD_SPACE_RATIO_MINFP
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 853A0E00D84
	for <meta-virtualization@yoctoproject.org>;
	Fri,  4 Sep 2015 08:15:42 -0700 (PDT)
Received: from iapetus.enea.se (172.16.141.154) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2; Fri, 4 Sep 2015
	17:15:37 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 4 Sep 2015 17:15:36 +0200
Message-ID: <1441379737-16799-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][kilo][PATCH 1/2] python-sqlparse: add recipe
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
X-List-Received-Date: Fri, 04 Sep 2015 15:15:47 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../recipes-devtools/python/python-sqlparse_0.1.16.bb       | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb

diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb b/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
new file mode 100644
index 0000000..acfc3cb
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "sqlparse is a non-validating SQL parser module."
+HOMEPAGE = "https://github.com/andialbrecht/sqlparse"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=13ec2f893997ca1f516b55496e019a81"
+
+SRC_URI[md5sum] = "370962a307ebaaa70a28b6b0ccb53980"
+SRC_URI[sha256sum] = "678c6c36ca4b01405177da8b84eecf92ec92c9f6c762396c965bb5d305f20f81"
+
+export BUILD_SYS
+export HOST_SYS
+
+inherit pypi
-- 
2.1.0


