Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E552DE00AF0; Thu, 19 Jan 2017 11:33:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6EC91E009BA
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Jan 2017 11:33:18 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0JJX9qM011022
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 Jan 2017 11:33:09 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 19 Jan 2017 11:33:08 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>,
	<huangqy.fnst@cn.fujitsu.com>
Date: Thu, 19 Jan 2017 14:33:05 -0500
Message-ID: <1484854386-3400-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484854386-3400-1-git-send-email-mark.asselstine@windriver.com>
References: <1484854386-3400-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] python-sqlalchemy: Add 1.1.5
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
X-List-Received-Date: Thu, 19 Jan 2017 19:33:22 -0000
Content-Type: text/plain

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

1) Copy the v1.0.9 bb to create python-sqlalchemy v1.1.5.
2) License checksum changed,since the copyright years were updated.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-devtools/python/python-sqlalchemy_1.1.5.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 recipes-devtools/python/python-sqlalchemy_1.1.5.bb

diff --git a/recipes-devtools/python/python-sqlalchemy_1.1.5.bb b/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
new file mode 100644
index 0000000..63caeb4
--- /dev/null
+++ b/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
+application developers the full power and flexibility of SQL"
+HOMEPAGE = "http://www.sqlalchemy.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
+RDEPENDS_${PN} += "python-numbers"
+
+SRCNAME = "SQLAlchemy"
+SRC_URI = "https://pypi.python.org/packages/da/04/8048a5075d6e29235bbd6f1ea092a38dbe2630c670e73d4aa923a4e5521c/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "50685d97dca4b91945ae6309d03ab8c9"
+SRC_URI[sha256sum] = "68fb40049690e567ebda7b270176f5abf0d53d9fbd515fec4e43326f601119b6"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
2.7.4


