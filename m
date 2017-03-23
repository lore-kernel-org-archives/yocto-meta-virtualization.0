Return-Path: <iurii.mykhalskyi@globallogic.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C589E00AAB; Thu, 23 Mar 2017 07:44:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.41 listed in list.dnswl.org]
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC7D1E00777
	for <meta-virtualization@yoctoproject.org>;
	Thu, 23 Mar 2017 07:44:28 -0700 (PDT)
Received: by mail-wm0-f41.google.com with SMTP id t189so65249145wmt.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 23 Mar 2017 07:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=z0zDjJ/WtH2fGJhKkV8TlIoT0yAyQRoO/RlxKAXUJfY=;
	b=dEVO9spnRaDO0SHN+MhY7lEr0YOy5iOnd4u9Z24WhmfPXpxANLbj8Y32OtyB+FnQVh
	MDR/0z+VoET0kGQh509fRWQSL6nM+2MlAeFKGGedTbb+/LyljUg0IBiRpDABJ6oi3fBI
	eb5HYceCgurlB9BiZ9jknDIF+8RGeZJOLyzmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z0zDjJ/WtH2fGJhKkV8TlIoT0yAyQRoO/RlxKAXUJfY=;
	b=DpHfdaBz+FVwTRDxFyNMXDSW5NOqvuIZmHLrOuf3QKPFH7bS/NjfxuixyGvzxw/QLr
	ThuF2QYLaB7EXlD2y02qFb2eRVLapI9oTmJ4jkpkWau0NUsP4Fj9oqhhuKAWvgCs9rc1
	O0MY/OeiUg3SUhAmtLHtjksimEHqjlR6N9ENlUiIJYu2KURO6FHLqZVQie2zWzLRQ4B+
	Pbj11Lpk/352faioHtlsT2sCSa5Y2v+D+vEYUAloxfX+T1qt3SFkL9WnjefT+gZAf/s2
	SCFhQg6nN7kQTv/SYj0pEmh3DAx4mg4isdbsRqH6++RoW7KJcR2biZw6gxzowyjbuTk4
	ysWg==
X-Gm-Message-State: AFeK/H3wEoUYX/uz6kPRIKcpiIXxj8ZBDOBePAQa61Q8sxTei9ADOMyW3Dc6Oxz5XUmqRuRW
X-Received: by 10.28.156.140 with SMTP id f134mr3168318wme.40.1490280267141;
	Thu, 23 Mar 2017 07:44:27 -0700 (PDT)
Received: from kbp1-lhp-f55441.synapse.com
	([2001:67c:2e5c:2011:f538:2e2c:dd8d:1e29])
	by smtp.gmail.com with ESMTPSA id
	o22sm6119136wro.13.2017.03.23.07.44.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Mar 2017 07:44:26 -0700 (PDT)
From: Iurii Mykhalskyi <iurii.mykhalskyi@globallogic.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 23 Mar 2017 16:44:17 +0200
Message-Id: <1490280257-11855-1-git-send-email-iurii.mykhalskyi@globallogic.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] xen: Fix mistype error in xen-watchdog systemd service
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
X-List-Received-Date: Thu, 23 Mar 2017 14:44:32 -0000

Due to error in naming this service will not be autoenabled in
systems with systemd init manager

Signed-off-by: Iurii Mykhalskyi <iurii.mykhalskyi@globallogic.com>
---
 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 0084274..a28d474 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -720,7 +720,7 @@ INITSCRIPT_PARAMS_${PN}-devd = "defaults 82"
 
 # systemd packages
 SYSTEMD_PACKAGES = "${PN}-xen-watchdog ${PN}-xencommons ${PN}-xendomains"
-SYSTEMD_SERVICE_${PN}-watchdog = "xen-watchdog.service"
+SYSTEMD_SERVICE_${PN}-xen-watchdog = "xen-watchdog.service"
 SYSTEMD_SERVICE_${PN}-xencommons = " \
     proc-xen.mount \
     var-lib-xenstored.mount \
-- 
2.7.4


