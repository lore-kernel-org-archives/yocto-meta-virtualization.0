Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA2B4E00BA2; Wed,  9 Aug 2017 18:29:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.192.194 listed in dnsbl.sorbs.net]
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83F7BE00C01
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Aug 2017 18:28:58 -0700 (PDT)
Received: by mail-pf0-f194.google.com with SMTP id c65so7662356pfl.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 09 Aug 2017 18:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CrEo7aP17SQJ2OxoMpVud+ilTKTiz2kGNQZa/WaXS3M=;
	b=aLPkxIq3RvvY1dMLbTlbfhrHEAhT2XDo8ee2BiKaw2sYz/1b6Mb9KFtloccnfeKNm/
	w4fBGxXFHNoBMsGwIh9L044PTFKkF6SBJO9lhs5rvMCAtH1Rr/THQiSQv6vsHvsX1Nqg
	M+DSi/+l+Nx62xHDILoDNi+lSz+SwNlg20vXM5zSKQlkmuW1HSWXkG+n0I8pP4NcGNpk
	Hu9DV0lIn1zWaFDgsOlA1nym562otr2erEwpPhHzEYD9q7pa3LdTCwaF0fCMxX8IZ/g9
	T3btFDuqoF5KIpbxqVHpgzCPK1q4k9KixZy51rE6B6gEW92xn+Vr+06RK3r3S/1y2Vi2
	CRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CrEo7aP17SQJ2OxoMpVud+ilTKTiz2kGNQZa/WaXS3M=;
	b=X6/bSyS+JKcnAYTExok1kJkDK2ZkGGNzxe49NgpOe7wMa+Qg4V6LEqxC5nHlDSxx8q
	ykBbF3G2WZovCULqpi+0hEcjn/KnNCaz77cqQRi9lwzpOgPUx+LJ7tEMNtBWf/6wjoAF
	KrGqRHdDXWi6FE1ZT+TZfzTFl0FlE8XP+AU26BJ8X1Bc2OIW8FObhT1VUWRMw2X0RlT4
	2bwsDcmp24R3YHjhKq4GlIJKaDMZDZZA709wNJo+mrv7JgqgeFActOTt08qMMj+TC5U6
	wTm01ht5opumSxDYmPri6IVCTcMPp1GJhhnFFpx+bGvj6Je8z4d3SDuhVsLTNoz8AoY5
	61Ew==
X-Gm-Message-State: AHYfb5iToTraTCG+WESsD6dLKrkTb4F0678iyoxklzcwaLcZcYzsYhHJ
	T+1GtEWTXcJ+YRDFHqY=
X-Received: by 10.98.217.10 with SMTP id s10mr10375848pfg.204.1502328537655;
	Wed, 09 Aug 2017 18:28:57 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	o17sm8642348pgn.52.2017.08.09.18.28.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:28:57 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed,  9 Aug 2017 18:28:42 -0700
Message-Id: <1502328524-4230-2-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502328524-4230-1-git-send-email-christopher.w.clark@gmail.com>
References: <1502328524-4230-1-git-send-email-christopher.w.clark@gmail.com>
Cc: Christopher Clark <christopher.clark6@baesystems.com>, cardoe@gentoo.org
Subject: [PATCH 1/3] xen: Package libxendevicemodel, introduced in Xen 4.9
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
X-List-Received-Date: Thu, 10 Aug 2017 01:29:00 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 6a0f226..274d0df 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -178,6 +178,8 @@ PACKAGES = "\
     ${PN}-libxencall-dev \
     ${PN}-libxenctrl \
     ${PN}-libxenctrl-dev \
+    ${PN}-libxendevicemodel \
+    ${PN}-libxendevicemodel-dev \
     ${PN}-libxenevtchn \
     ${PN}-libxenevtchn-dev \
     ${PN}-libxenforeignmemory \
@@ -283,6 +285,9 @@ FILES_${PN}-libxencall-dev = "${libdir}/libxencall.so"
 FILES_${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
 FILES_${PN}-libxenctrl-dev = "${libdir}/libxenctrl.so"
 
+FILES_${PN}-libxendevicemodel = "${libdir}/libxendevicemodel.so.*"
+FILES_${PN}-libxendevicemodel-dev = "${libdir}/libxendevicemodel.so"
+
 FILES_${PN}-libxenevtchn = "${libdir}/libxenevtchn.so.*"
 FILES_${PN}-libxenevtchn-dev = "${libdir}/libxenevtchn.so"
 
-- 
2.7.4


