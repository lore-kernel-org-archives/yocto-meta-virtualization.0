Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f53.google.com (mail-bk0-f53.google.com
	[209.85.214.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8062E01460
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:19 -0800 (PST)
Received: by mail-bk0-f53.google.com with SMTP id j5so361045bkw.40
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=r1h2uNFWTfy638sN7CYfLYJ/8oC9GTFVNob2iI2wFwY=;
	b=JVqo/qPPHWEIZht9slUCNcKWV7UmV8+Upo/lwz6Ipj2PVHiARifr1rV7W9zJ2xV1hq
	t88lBsiKzMazNykHoRYhkS8o9AgEFYzQKXUKaQbO5BALnsaV3JwFuNwFhZaSJhFBUjq9
	VfNAAMLA74BcVzSBeSeFTn1nrDXqpYyZdpGbH6mUJxgIWUQm4n+OaSwsutfUIGLCev7V
	sfWKTza2fop2gwYKBs1egzGHafhyp6pNarnCxdbiuyz0TFq+GNaLuutOs7dDKfwQnr7Q
	iy6JLrkeTY8I/0H26rNJBJomEzjnJjGv7+FtkUGvVjqw5R1MpXccUqE/bkIbsJNF4NUP
	5s5g==
X-Received: by 10.204.153.27 with SMTP id i27mr791816bkw.116.1355841138963;
	Tue, 18 Dec 2012 06:32:18 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id 18sm1505539bkv.0.2012.12.18.06.32.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 06:32:18 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 4D3A9414F47; Tue, 18 Dec 2012 15:32:01 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 15:31:57 +0100
Message-Id: <1355841118-22361-16-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: raymond.danks@se-eng.com
Subject: [RFC][PATCH 15/16] Added python-quantumclient recipe
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
X-List-Received-Date: Tue, 18 Dec 2012 14:32:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 .../quantumclient/python-quantumclient_git.bb      |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 recipes-cloud/quantumclient/python-quantumclient_git.bb

diff --git a/recipes-cloud/quantumclient/python-quantumclient_git.bb b/recipes-cloud/quantumclient/python-quantumclient_git.bb
new file mode 100644
index 0000000..bb0aae6
--- /dev/null
+++ b/recipes-cloud/quantumclient/python-quantumclient_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "This is the client API library for Quantum."
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+PR = "0"
+
+RDEPENDS_${PN} = "python-pyparsing \
+	   python-simplejson \
+	   python-httplib2 \
+	   python-prettytable \
+	   python-cliff \
+	   "
+
+SRCREV = "bc7ba5e19d4e9039146ca37f77a0b232522cddc8"
+PV = "0.2.1+gitr${SRCREV}"
+SRC_URI = "git://github.com/openstack/python-quantumclient.git;protocol=https"
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+export BUILD_SYS
+export HOST_SYS
+
+inherit setuptools
\ No newline at end of file
-- 
1.7.9.5


