Return-Path: <akuster@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14A9BE0076C; Mon, 30 Jun 2014 14:48:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.47 listed in list.dnswl.org]
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 843C5E006EE
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 14:48:28 -0700 (PDT)
Received: by mail-pa0-f47.google.com with SMTP id kq14so9328139pab.20
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 14:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bNP2raMxMwA2HWnvEtDBWGforqoG8Hg9CAbc2bDAn2I=;
	b=h7ot28gSK8tITp2JTctBtE/j/BTgthQwBf7cIgmJVztz0py4iFMGWyNTVyXBuIGIuH
	GIEpZR5SOnVXFnoMfaKBEddman/ciO98bnSsh8xf2dVqQQq3GjlUl2/w6cQq0Lv0dOR3
	7GgQi45hoytm2x7WNwosZrpFKpzhKyvbKX87TrRHn0rZzofgi9PRqAdMjPwDBAS6hab6
	RKSMK18WQJ8DatXIv9C3iM9sxifwgx8YzMLSnR/3r5i+mEhU+bXPJnPFzPbkoR4py/ji
	eqsTdgFhzqhLoi1DG1s1V27zsZ06HX388zZGRcAF24OTiJMvhOlOfHL9+f4+Z+wS1GUh
	wGDw==
X-Gm-Message-State: ALoCoQljncMdC+sibGw6tlUfjQK7H140+OrcHG2LvDWcNl8T2dCK7z1yYw3UnV3tWJ3dHSWBAtZ/
X-Received: by 10.68.211.233 with SMTP id nf9mr55174837pbc.29.1404164908579;
	Mon, 30 Jun 2014 14:48:28 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	ir10sm29325691pbc.59.2014.06.30.14.48.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Jun 2014 14:48:27 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 30 Jun 2014 14:48:15 -0700
Message-Id: <1404164895-19815-8-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1404164895-19815-1-git-send-email-akuster@mvista.com>
References: <1404164895-19815-1-git-send-email-akuster@mvista.com>
Cc: bruce.ashfield@windriver.com
Subject: [PATCH 7/7] [meta-openstack] linux-yocto_3.4: remove PRINC reference
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
X-List-Received-Date: Mon, 30 Jun 2014 21:48:32 -0000

replace PRINC with PR .= ".1"

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-openstack/recipes-kernel/linux/linux-yocto_3.4.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_3.4.bbappend b/meta-openstack/recipes-kernel/linux/linux-yocto_3.4.bbappend
index 6df4c0f..0453786 100644
--- a/meta-openstack/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ b/meta-openstack/recipes-kernel/linux/linux-yocto_3.4.bbappend
@@ -1,5 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PRINC := "${@int(PRINC) + 1}"
+PR .= ".1"
 
 SRC_URI += "file://iptables-nat.scc \
 	file://enable-veth.cfg \
-- 
1.9.1


