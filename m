Return-Path: <akuster@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D599DE00723; Mon, 30 Jun 2014 14:48:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.192.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0B24E006CD
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 14:48:26 -0700 (PDT)
Received: by mail-pd0-f182.google.com with SMTP id y13so8965135pdi.27
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 14:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EO5uKC81wikzo5Y5zwm5l7FAi9hrKUudfhBTfiL7F7g=;
	b=XyMHPW5yPI4Dp2ZeUC9sU5TQC+b02XcWaDEdqQIKb3i5DnuajbFw4JQAF51FES8oQe
	GHkF09qKG167K1Hovv33AxmFqKZvK3B2aJoXVs76GcjH224CZdl25xUKhYhoud+2izbf
	KjcKIopva60lDIyZEH0cnufNIfhNJFyYGZ3JwahQUpVZSzYNyNW2z+5mnHWzmp9mADgm
	w9vW5twcI034hjx7Qz7iV+PBFHdO830wRbut9WaX+kpTL5LqO0BafaZc10nXwIfj0qf7
	1xxrMKqS8Ilw49+5tXIijG6bTRfUSo0QA7CEBGm1iCtonzAz3yKE9SGHvjadgT+vhMVM
	Tr0A==
X-Gm-Message-State: ALoCoQkgIkNJ+RaSCaezvg69j0LzoBuWX5vOBtglhT9ydnfN96cnTSr2cITqpucT7driCVOkw1WA
X-Received: by 10.68.110.3 with SMTP id hw3mr55140132pbb.144.1404164906049;
	Mon, 30 Jun 2014 14:48:26 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	ir10sm29325691pbc.59.2014.06.30.14.48.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Jun 2014 14:48:25 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 30 Jun 2014 14:48:13 -0700
Message-Id: <1404164895-19815-6-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1404164895-19815-1-git-send-email-akuster@mvista.com>
References: <1404164895-19815-1-git-send-email-akuster@mvista.com>
Cc: bruce.ashfield@windriver.com
Subject: [PATCH 5/7] [meta-openstack] linux-yocto_3.10: remove PRINC reference
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
X-List-Received-Date: Mon, 30 Jun 2014 21:48:30 -0000

replace PRINC with PR .= ".1"

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-openstack/recipes-kernel/linux/linux-yocto_3.10.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_3.10.bbappend b/meta-openstack/recipes-kernel/linux/linux-yocto_3.10.bbappend
index 2d7c60f..98e4d9c 100644
--- a/meta-openstack/recipes-kernel/linux/linux-yocto_3.10.bbappend
+++ b/meta-openstack/recipes-kernel/linux/linux-yocto_3.10.bbappend
@@ -1,5 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PRINC := "${@int(PRINC) + 1}"
+
+PR .= ".1"
 
 SRC_URI += "file://iscsi-tcp.scc \
 	file://enable-iscsi-tcp.cfg \
-- 
1.9.1


