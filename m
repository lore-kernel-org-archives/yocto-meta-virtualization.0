Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f41.google.com (mail-bk0-f41.google.com
	[209.85.214.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B711EE0073D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:14 -0800 (PST)
Received: by mail-bk0-f41.google.com with SMTP id jg9so370126bkc.28
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=QB++lJputq1xWBpkhhyt6BHeKkJieUAbZD+UG5dCoII=;
	b=nmiG5c3moyspZhHe98irx8+Q/lpjlBRMPniCeT3GYrOiXAXzwTPIMt9PQtTmWD8BzP
	UGrEm1zunuFeiDg/sQ967BqEEv19GOGiHNLo8HpyIWFnityruKyuO7H99ZJ1LzZVS8Pc
	un6CIddyVb8rHMqm7J2uPxVyrCUYIOTeQzMATaRCbpx2GgOg846P6GTRlhgusZXH234t
	HgRUE9jygOZmA0m9L4OeRtgJVr5zs90L5iUq/kGhC5cFyU4fUVacyV9gwUFz7xttrBdB
	/dLLQ57qsUzsWQgGmQtioARQrDY4160uH21S6Y8exMW/JQjLG5QvjXxJtRhC9dQQFeKt
	C8KQ==
X-Received: by 10.204.148.19 with SMTP id n19mr804229bkv.131.1355841133098;
	Tue, 18 Dec 2012 06:32:13 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id m20sm1503842bkw.4.2012.12.18.06.32.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 06:32:12 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 29065400DD7; Tue, 18 Dec 2012 15:32:01 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 15:31:45 +0100
Message-Id: <1355841118-22361-4-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: raymond.danks@se-eng.com
Subject: [RFC][PATCH 03/16] Added python-cmd2 recipe
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
X-List-Received-Date: Tue, 18 Dec 2012 14:32:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 recipes-python/cmd2/python-cmd2_0.6.4.bb |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 recipes-python/cmd2/python-cmd2_0.6.4.bb

diff --git a/recipes-python/cmd2/python-cmd2_0.6.4.bb b/recipes-python/cmd2/python-cmd2_0.6.4.bb
new file mode 100644
index 0000000..a10c185
--- /dev/null
+++ b/recipes-python/cmd2/python-cmd2_0.6.4.bb
@@ -0,0 +1,20 @@
+SUMMARY = "cmd2"
+DESCRIPTION = "Extra features for standard library's cmd module"
+SRCNAME = "cmd2"
+HOMEPAGE = "http://packages.python.org/cmd2/"
+LICENSE = "MIT"
+
+DEPENDS += "python-pyparsing"
+RDEPENDS_${PN} += "python-pyparsing"
+
+LIC_FILES_CHKSUM = "file://setup.py;beginline=21;endline=21;md5=25c0f7ede01b1eab41daf880e5791f05"
+
+PR = "r0"
+
+SRC_URI = "http://pypi.python.org/packages/source/c/cmd2/cmd2-0.6.4.tar.gz \
+	"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI[md5sum] = "60a07255bbcb4342888b1574f46e56ea"
+SRC_URI[sha256sum] = "ff52cb800d931bbd0ce4b05bac0b024cf34ec3a04f66eadcb7d3f7dda42429ba"
+inherit setuptools
\ No newline at end of file
-- 
1.7.9.5


