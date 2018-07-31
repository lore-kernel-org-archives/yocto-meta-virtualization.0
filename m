Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3BEFE00D4A; Tue, 31 Jul 2018 12:36:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.210.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18AB1E00CA9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Jul 2018 12:36:23 -0700 (PDT)
Received: by mail-pf1-f196.google.com with SMTP id p12-v6so1489632pfh.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Jul 2018 12:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VcKX+Xtj3DfFtogc+/18y3G679MkizoY4Gi3VKtMyAo=;
	b=GS2Aa5vlkHWHdnvvey+b/RPREj5eabMp8L5oPqxS9bJcxqYuhyUwpvRkxE6c2jMMdE
	XDEqPld4diHidoBvBy7KdVhpxU8lAHWa4mjsv9v5ZfVXYWcpU6kwYm/TMQAhw7JnNm/P
	hJyV8Pg5xMmkkc/fXu8X7+G1SA0hnojYZO490LL3L5t8FlurpEwy/CznLLgQX87HqU8D
	LiOyhbsYeyAyasokZxf/QTbEypjgV9L17P4cXfS80ELk1qf1nZnbArgDRN6ufM79DEiT
	f+ps0ZMwfmGWYShMNjpp7MQTjCc+Oun/yjYB3W1DeNZfRfgG6CUUt2qaxNa5DGSozR7k
	vqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VcKX+Xtj3DfFtogc+/18y3G679MkizoY4Gi3VKtMyAo=;
	b=Pn9LHeI0lKGlecfSr8J5yfGxOg84C13XAZ1tYG7sk41sob03PvSq3QHoJexy9xBGFF
	+fFh+Tw/cV1301RtocQx55ozEzEp08Vicsjr0gI0KlYp+EABLaqgAY/KNuwAjh5G+fzK
	zVDzEqi5l/bvLTDSYTJvBRkI6GWfg363IBvOadgTSPvzjn0NhEwKJvc3pNYQsUlZFu1S
	cr+7EzRLK9IGVQzTJZmxdlrJ7IqP0xN3y8esweaLPksu8ZkMe6aJHAToAaA+7QRvuLJm
	Np8SAD30l+7lQ5SpmxciFxQKiUQAnLej7Uhf6puaC9c+Ui5LRzsfpVzGLbISrgUXwIyt
	0Hdg==
X-Gm-Message-State: AOUpUlFSVofvJAYtOEkEC8s44NPOOH9zS/DPO1WuuEKtLfverdv4NZIa
	+WvnzeEVsnCFv4vsX8bNdYlOpDcv
X-Google-Smtp-Source: AAOMgpcLihfnh9yN3KJMJ9LRcGdnLEBHRYsX28v8RqK8j74hVtOD5IcCPs8vKDyuvhu8mxgxq8oPQA==
X-Received: by 2002:a63:5e45:: with SMTP id
	s66-v6mr21600467pgb.151.1533065782712; 
	Tue, 31 Jul 2018 12:36:22 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	64-v6sm24758626pfi.89.2018.07.31.12.36.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jul 2018 12:36:21 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Tue, 31 Jul 2018 12:35:50 -0700
Message-Id: <1533065750-25786-10-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
References: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH v2 9/9] xen: Update git recipe to build latest upstream staging branch
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
X-List-Received-Date: Tue, 31 Jul 2018 19:36:49 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index e10d669..da1eea6 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,9 +1,10 @@
 require xen.inc
 
-SRCREV ?= "9a6cc4f5c14b3d7542b7523f88a1b65464733d3a"
+SRCREV ?= "2b50cdbc444c637575580dcfa6c9525a84d5cc62"
 
-XEN_REL ?= "4.7"
-XEN_BRANCH ?= "staging-${XEN_REL}"
+XEN_REL = "4.12"
+XEN_BRANCH = "staging"
+FLASK_POLICY_FILE = "xenpolicy-${XEN_REL}-unstable"
 
 PV = "${XEN_REL}+git${SRCPV}"
 
-- 
2.7.4


