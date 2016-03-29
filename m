Return-Path: <straka.derek@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26C05E00B46; Tue, 29 Mar 2016 05:47:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A298EE00B46
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 05:47:05 -0700 (PDT)
Received: by mail-qg0-f67.google.com with SMTP id y89so1429720qge.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 05:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LQSMuhc7JrPfjhjG6IQVvtqcr/7H4J68wcMNAydXTZM=;
	b=cZ9nGl4iXZ3mPF2vzEF/kfdNOm6IcBhG0z89TQUnTr8Oj+VnigyvjxEYiJTel4J5ut
	h8biQzoyuQ82gB1tQ7T3/NI/Rc0QDvfa2jnc28Gk2Y8j3I3ycZv6blvTLlZ0qnw37GUQ
	JKuMcrhl3VH3oS80zjTB+zSzYJBJGjjFGNfPXehSDca+mF4SkpFS1jRqa3/36dshGfRG
	uLBvt6/ajhPoJv45T6gQyNYhxcsbe6E2Y5K42+udaffkC49A6dY1WoTXgpJA32OUeBKd
	j/tpkbNlsV3EL2Ppmp5/XNgmKIJ6CThtel6tM2H41Kxq2XI+dYOjKQQtJk6OVvOigPKG
	5K9Q==
X-Gm-Message-State: AD7BkJK/bLQ+kHnix6Gl82rNTUnSKKNdhHdJYfYEXTS8xWd8g4KyFLgU4D45by3S4hM9zA==
X-Received: by 10.140.85.133 with SMTP id n5mr2446308qgd.32.1459255624577;
	Tue, 29 Mar 2016 05:47:04 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	i46sm13864021qgd.19.2016.03.29.05.47.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Mar 2016 05:47:03 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: meta-virtualization@yoctoproject.org
Date: Tue, 29 Mar 2016 08:46:38 -0400
Message-Id: <1459255600-14043-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459255600-14043-1-git-send-email-derek@asterius.io>
References: <1459255600-14043-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCHv2 2/4] xen: add the ability to configure the name of the policy
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
X-List-Received-Date: Tue, 29 Mar 2016 12:47:08 -0000

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


