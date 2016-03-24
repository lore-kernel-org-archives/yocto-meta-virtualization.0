Return-Path: <straka.derek@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ABD1AE00C3B; Thu, 24 Mar 2016 08:31:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5303DE00AF4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 08:31:47 -0700 (PDT)
Received: by mail-qk0-f193.google.com with SMTP id u128so2181553qkh.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 08:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LQSMuhc7JrPfjhjG6IQVvtqcr/7H4J68wcMNAydXTZM=;
	b=RPOV4JlZSU4wolBnY2jTCakkhs07DjyRyMbQVhId6a0tKKlEczgmdboTOYEyQ4XMqj
	mdgSqoCyS9o484QgOYGYpe/25p5VgkTV077HU+SVRZfR+s+DsK5QtIFBSiz3A/cfa5Q3
	5LR8+QIg4xHXfwcphotMcOkRUqwCv+glCLCtkr682KI4mCBkE8+wzvuv1AQAeIamx8Q5
	KHIiL4R+2GPAanLCrhyVaclvFCJHQlFdijzq39f4KQ/gjpN6ijStCa2lxIJvp09Ca2BU
	z6tAwXTxFi6Ior3VM6n7FyS8khsfw6+25q/nPORE31cu/REWUMkAO5WqflkJnU1el7oQ
	eUxQ==
X-Gm-Message-State: AD7BkJIK7j5HhUNpqGFW+UgZsaN3Na8XFs8YGZfkgjS9lN1LhZ7EIHr4z41jCEVo2IDJkw==
X-Received: by 10.55.79.5 with SMTP id d5mr11385106qkb.30.1458833507242;
	Thu, 24 Mar 2016 08:31:47 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	a11sm3473110qge.43.2016.03.24.08.31.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Mar 2016 08:31:46 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: meta-virtualization@yoctoproject.org
Date: Thu, 24 Mar 2016 11:31:29 -0400
Message-Id: <1458833491-7717-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458833491-7717-1-git-send-email-derek@asterius.io>
References: <1458833491-7717-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH 2/4] xen: add the ability to configure the name of the policy
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
X-List-Received-Date: Thu, 24 Mar 2016 15:31:50 -0000

When using non-release versions, the policy files may have a different name (xenpolicy-${PV}-unstable).  Allow the policy file name to be configured by the xen recipe.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 recipes-extended/xen/xen.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index bc5ff85..77740cf 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -17,6 +17,8 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)} \
     "
 
+FLASK_POLICY_FILE ?= "xenpolicy-${PV}"
+
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
 PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
@@ -343,7 +345,7 @@ FILES_${PN}-devd = "\
     "
 
 FILES_${PN}-flask = "\
-    /boot/xenpolicy-${PV} \
+    /boot/${FLASK_POLICY_FILE} \
     "
 
 FILES_${PN}-flask-tools = "\
-- 
1.9.1


