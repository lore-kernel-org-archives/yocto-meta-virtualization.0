Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f51.google.com (mail-bk0-f51.google.com
	[209.85.214.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1C2FE0144D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:16 -0800 (PST)
Received: by mail-bk0-f51.google.com with SMTP id ik5so369049bkc.38
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=W+MVPemCtAEWryzIhLpn6waeM8rkSXjdjugvpltAUaw=;
	b=gSs938d3LXV+jFJQ44coYzAbnv84EFVlOeBNxF3ou8kzuVCrdMcsuqF8w8D2buLutB
	yOgXk9KZHBea6IuSi9XWj4D59+wD14YAYMcHx/gkSPANatMkuGhQzPKsO8P9XVgwJXXy
	WwUCHDOteXzChPMdIxrbL1Qw38agyaIgN8n1nRqD0cvh2AEblW8sSKDDxxtfetKF0/wu
	bPwB1UN/uOaxV+jKTyzb/e6l72nRJSzwhgw2a93d5asareWTdJ2Nru0q/sZjePuaJwzc
	ngiIWx4BayWSyuXljAYeotXomojPYw8KckZ8/7qfwtLIiJ8i9lSAVifs76E0Uoech7Vr
	noJg==
X-Received: by 10.204.5.69 with SMTP id 5mr823361bku.26.1355841135677;
	Tue, 18 Dec 2012 06:32:15 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id u3sm1501668bkw.9.2012.12.18.06.32.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 06:32:14 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 3CEE5414F40; Tue, 18 Dec 2012 15:32:01 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 15:31:50 +0100
Message-Id: <1355841118-22361-9-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: raymond.danks@se-eng.com
Subject: [RFC][PATCH 08/16] Added python-prettytable recipe
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
X-List-Received-Date: Tue, 18 Dec 2012 14:32:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 .../prettytable/python-prettytable_0.6.1.bb        |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 recipes-python/prettytable/python-prettytable_0.6.1.bb

diff --git a/recipes-python/prettytable/python-prettytable_0.6.1.bb b/recipes-python/prettytable/python-prettytable_0.6.1.bb
new file mode 100644
index 0000000..4debf5a
--- /dev/null
+++ b/recipes-python/prettytable/python-prettytable_0.6.1.bb
@@ -0,0 +1,18 @@
+SUMMARY="Pretty tables"
+DESCRIPTION = "Print pretty tables in python"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+PR = "0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b4f4350335a7117793dfac5e839c125f"
+SRC_URI = "http://pypi.python.org/packages/source/P/PrettyTable/prettytable-${PV}.zip"
+
+SRC_URI[md5sum] = "2ac002f4f944f9468b0df8b4de9e8967"
+SRC_URI[sha256sum] = "3f4c48d80af6d40d5a76dd1650dece386349d6df8b7b096fc8ec39fec21ceba7"
+
+S = "${WORKDIR}/prettytable-${PV}"
+
+export BUILD_SYS
+export HOST_SYS
+
+inherit setuptools
-- 
1.7.9.5


