Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CA45E00A92; Fri, 22 Jan 2016 20:58:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D06FCE009EA
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Jan 2016 20:58:10 -0800 (PST)
Received: by mail-yk0-f179.google.com with SMTP id a85so109694817ykb.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Jan 2016 20:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Vt/fMafKRchTSRFWgIc4r/XEGl3QHKPQdiHgdM7RMmo=;
	b=AQ479liImmPot9yzR07seNwvKoyVkP7P6YyJEHIGUoypY3totMmdFGRV7bToqMBab+
	LtTXZV7TVpG7S172IvAnNsMAI49vodbcO+7dflG105AQ+PEIQyVGrn7WCjk+bq5b8y6h
	k+jirnesp6ohmB7+DM4Sw05p4P+MpUPdimpx1G+IAwJ9F5bqw/axlREMZJClDwznC566
	xxFb+DBpA0/B3zCFQVTT/k5wrM6xkvsItpuDLCCjr7ZVfmjtm5+6amx61K3Wdhy2/LVB
	JQ+bSeaVQ7VRt/AJaMpmm0RCd4lZP18Jks6w56UBlZDSsWC2jDibXa5E33t0+Iff/Feu
	hgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Vt/fMafKRchTSRFWgIc4r/XEGl3QHKPQdiHgdM7RMmo=;
	b=YLC88Mh52Sx9BIIUyL7kqadDalSj1998JeDQa/aswf3ZYEqgjIEo5naGCJw88yNYEc
	zddhSuU4RmgnELUbY0qdDFenbgutx/o5Tb0wty7GQuV74HgAth0GEpDmdvrWKSfMQDuy
	XfgWNaHWCvpdLE7oIy6jzBKJ/MpUkLLHFVStehNtPbdm56psCJkjlQ5M1nlSAAX5NTT/
	mo6qPZxmjWYtiGgSn9ZOaRNyxCQtcyaLCCn2e3xjudmtx7Bibo7C5s0LA0/5etM4X43r
	BHKiqTQk/jW0TnlK0X3j3Ny4bK4N4PkpMn2fXU6iNWY7S8213k16+OJ0l2uatJ+KN/q5
	FoBA==
X-Gm-Message-State: AG10YOTHuC4eelfzx5JI4a5tbOAuowi7l98U+upHEWnbYxKX8Q41x40IBGT7te22yeyg9A==
X-Received: by 10.129.90.214 with SMTP id o205mr2107767ywb.340.1453525089419; 
	Fri, 22 Jan 2016 20:58:09 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	v63sm6447656ywf.40.2016.01.22.20.58.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 20:58:08 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 22 Jan 2016 22:57:47 -0600
Message-Id: <1453525067-2109-1-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
Subject: [PATCH] xen-image-minimal: if DISTRO_FEATURES is missing xen error
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
X-List-Received-Date: Sat, 23 Jan 2016 04:58:14 -0000

It can be confusing to users why things are failing with missing kernel
dependencies when you don't have 'xen' in your DISTRO_FEATURES. This
should provide them with some better info.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---

The result of this change is the following output:

| DEBUG: Executing shell function do_check_xen_state
| ERROR: DISTRO_FEATURES does not contain 'xen'
| WARNING: exit code 1 from a shell command.

---
 recipes-extended/images/xen-image-minimal.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index 26b6d06..b8c2002 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -20,6 +20,14 @@ LICENSE = "MIT"
 
 inherit core-image
 
+do_check_xen_state() {
+    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' yes', 'no', d)}" = "no" ]; then
+        die "DISTRO_FEATURES does not contain 'xen'"
+    fi
+}
+
+addtask check_xen_state before do_rootfs
+
 syslinux_iso_populate_append() {
 	install -m 0444 ${STAGING_DATADIR}/syslinux/libcom32.c32 ${ISODIR}${ISOLINUXDIR}
 	install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32 ${ISODIR}${ISOLINUXDIR}
-- 
2.4.10


