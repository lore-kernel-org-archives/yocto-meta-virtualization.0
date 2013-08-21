Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3338E00406
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2013 07:16:38 -0700 (PDT)
Received: by mail-la0-f49.google.com with SMTP id ev20so387419lab.36
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2013 07:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=hkEcQ6kjRCOo9tFz/EohxxcuwyCs01sxSfc5M5lam5g=;
	b=EjyvryzpeuELtm+W1qZSI+kXvCfH7yiQaQs1cpMAdPF5I+q8MxJJavIfg9Ecb5aiRy
	fcseo141l5yjy7uUytZptFqdyACckZmgPZa+cSw3SeEIjVXfh8Pc/jzjY1vZjQIVdM+F
	Z8POuw7KDQ6DoxPJs8VC6R36EcO0U0J1f9OWj6y140MuZ90Sh9npnOUUj68zQdit14rC
	R7HUJZD0abm5O/3VwH7m0wP9nFBFtEBGvkcqBraSUszwAWZAMk3QKIySlTQUsdPHnNL5
	qBLH52cmPjOoCNJ33z67IqpEXwF8T1pb1wur5SYcRsVcJPnnDFnw3Y9SWd7K65hCIawk
	3aZw==
X-Received: by 10.112.132.193 with SMTP id ow1mr1600358lbb.40.1377094595769;
	Wed, 21 Aug 2013 07:16:35 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id ay4sm3263950lbb.2.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 21 Aug 2013 07:16:34 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id E27344002CF; Wed, 21 Aug 2013 16:16:27 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 21 Aug 2013 16:16:13 +0200
Message-Id: <1377094573-30072-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] Fixed Q&A error for OpenFlow recipe
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
X-List-Received-Date: Wed, 21 Aug 2013 14:16:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 recipes-networking/openflow/openflow_1.0.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/recipes-networking/openflow/openflow_1.0.bb b/recipes-networking/openflow/openflow_1.0.bb
index 3663e50..20a2bc9 100644
--- a/recipes-networking/openflow/openflow_1.0.bb
+++ b/recipes-networking/openflow/openflow_1.0.bb
@@ -1,4 +1,4 @@
-SUMMARY = "OpelFlow"
+SUMMARY = "OpenFlow"
 DESCRIPTION = "Provide a generic framework for handling devices in userspace."
 HOMEPAGE = "http://www.openflow.org"
 SECTION = "networking"
@@ -21,4 +21,9 @@ PACKAGECONFIG[libssl] = "--enable-ssl,--disable-ssl, openssl, libssl"
 
 S = "${WORKDIR}/git"
 
-inherit autotools
\ No newline at end of file
+inherit autotools
+
+do_install_append() {
+	# Remove /var/run as it is created on startup
+        rm -rf ${D}${localstatedir}/run
+}
-- 
1.8.3.2


