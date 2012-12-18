Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f52.google.com (mail-bk0-f52.google.com
	[209.85.214.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9447EE01454
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:17 -0800 (PST)
Received: by mail-bk0-f52.google.com with SMTP id w5so363627bku.39
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=qwSj0t7P19pYUUl9AQD6AXYLcTU5jcHyWXvKDzqak0I=;
	b=tVPIJJVIwc8O90F1jwv0EimJCsQjx5jpItDe9KX22fY5AfVyBowywhWK5Qk9XufSJi
	Jqg7X9vYFnPyVjnHE2rluRp2grxMWsMG5UAJ51v39OGkaoAQ16dMZlN8XHXd1IzpmE8f
	T2PbjWb6hhOMu/VUPPyk7xKQB93hmkwPy2W4E9q9++BXWmNFrzb7/TaWWP5lPhL2fZ4R
	eQdXO/pmGGGJLLthQAOfArQXHuwLI6C5aSexl13uopxgzIggPAHLM7YGEle94UXxpwjn
	ijQ4nst57SpVrAacV06t2IzS8rpO9eKNoY3jWdxBPVrIPgNYurf/WdvaKzmyAHMUTCpF
	qZNw==
X-Received: by 10.204.152.28 with SMTP id e28mr863683bkw.3.1355841136599;
	Tue, 18 Dec 2012 06:32:16 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id o7sm1500454bkv.13.2012.12.18.06.32.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 06:32:15 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 4B058414F46; Tue, 18 Dec 2012 15:32:01 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 15:31:56 +0100
Message-Id: <1355841118-22361-15-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: raymond.danks@se-eng.com
Subject: [RFC][PATCH 14/16] Added python-glanceclient recipe
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
X-List-Received-Date: Tue, 18 Dec 2012 14:32:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 .../glanceclient/python-glanceclient_git.bb        |   26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 recipes-cloud/glanceclient/python-glanceclient_git.bb

diff --git a/recipes-cloud/glanceclient/python-glanceclient_git.bb b/recipes-cloud/glanceclient/python-glanceclient_git.bb
new file mode 100644
index 0000000..d9c7472
--- /dev/null
+++ b/recipes-cloud/glanceclient/python-glanceclient_git.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "This is a client library for Glance built on the OpenStack \
+	    Images API. It provides a Python API (the ``glanceclient`` module) \
+	     and a command-line tool (glance)."
+SECTION = "devel/python"
+SRCNAME = "glanceclient"
+LICENSE = "Apache-2"
+PR = "0"
+
+DEPENDS = "gmp"
+RDEPENDS_${PN} = "gmp \
+	python-warlock \
+	python-pyopenssl \
+	python-keystoneclient \
+	python-prettytable \
+	"
+
+FILES_${PN} += "${datadir}/${SRCNAME}"
+
+SRCREV = "c057fe47d6889912b7675aa54102509cd464171a"
+PV = "0.7.0+gitr${SRCREV}"
+SRC_URI = "git://github.com/openstack/python-glanceclient.git;protocol=https"
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+inherit setuptools
-- 
1.7.9.5


