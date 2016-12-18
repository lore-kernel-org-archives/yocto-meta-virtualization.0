Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E059AE00E43; Sun, 18 Dec 2016 08:45:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.213.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.196 listed in dnsbl.sorbs.net]
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93908E00C1A
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Dec 2016 08:45:15 -0800 (PST)
Received: by mail-yb0-f196.google.com with SMTP id d59so6579157ybi.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Dec 2016 08:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=8ad/gn9Ud9r7MN7ge058ZZ4v4yqH5F/EmovERWfvQc0=;
	b=MELxq6MELkGHEmiV9y3AKzMdICnJaxnn53gLhIy3JiaRzG9JnPiKXCO5DsN9e83F2X
	QQnKb/V+yknkOO0XVLN0RV3V7ETGUIoMf+StrPai/b+UVeTXdwbCt+EBrtZkIDo4+COr
	X4AdokOCHzqUf+cM/xjqu9qp1prtf9HN4+FgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8ad/gn9Ud9r7MN7ge058ZZ4v4yqH5F/EmovERWfvQc0=;
	b=Q4Ib4XJO10Za86GG+fdnTYAm+3bjfUK+ulp6LBV20XijQbmms+Ho0yTfJFQT0P9cMU
	P+CTLZUPfmSVXe5KCj93PdTUB4iC7FJVp5SkwwbVoZsfivCnA4UiLa7zopi5MQ3+ezsn
	EjsiWIfyJQwOd69Z92iTjq4myjqtXFRbl+Ml9GZq3qijM6Q7UrjY2okRSKVK6MFuTl++
	/msSdwgHWNHI8rfFuS/ddBh5PIEmwmLk1w8Uz715Z+LKiYfWm1NkM+VdRD9GRMjY9NFP
	CNRWlTHG+bGThS6q+gh4Rv9LrJp4e+Opl3ZTgF6DtZNO1Am+i17mHlL96L5Ec1MY7sTE
	hI9Q==
X-Gm-Message-State: AIkVDXJ0e9hdOvySKgmaA990m7pDwoywguoxCKYc7xRXPPTTE7oJ2SxEruIDAwz/uR6M/Q==
X-Received: by 10.37.83.66 with SMTP id h63mr932088ybb.139.1482079514960;
	Sun, 18 Dec 2016 08:45:14 -0800 (PST)
Received: from swanson.attlocal.net
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	g132sm6145667ywc.23.2016.12.18.08.45.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Dec 2016 08:45:14 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Sun, 18 Dec 2016 10:44:54 -0600
Message-Id: <20161218164456.30100-1-cardoe@cardoe.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 1/3] xen: add extra generated file to package
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
X-List-Received-Date: Sun, 18 Dec 2016 16:45:18 -0000

xenstore is no longer launched by xencommons directly. Instead its
launched indirectly via the launch-xenstore script to allow users to
switch between xenstore running in a stubdom or within dom0 easily.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index e911415..429a05a 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -679,6 +679,7 @@ FILES_${PN}-xm = "\
 FILES_${PN}-xencommons += "\
     ${sysconfdir}/default/xencommons \
     ${sysconfdir}/init.d/xencommons \
+    ${sysconfdir}/xen/scripts/launch-xenstore \
     ${systemd_unitdir}/modules-load.d/xen.conf \
     ${systemd_unitdir}/system/proc-xen.mount \
     ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
-- 
2.10.2


