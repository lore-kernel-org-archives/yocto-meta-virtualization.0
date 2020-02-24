Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.16776.1582521572796874433
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DR8zSPt/;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A21AFE014C6; Sun, 23 Feb 2020 21:19:32 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.215.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9EF40E00D33
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:31 -0800 (PST)
Received: by mail-pg1-f171.google.com with SMTP id a14so4119525pgb.11
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=94toTxN8hQ2nuR/rMwCVMtEmzu/PwaTUOi2X04Go/n4=;
        b=DR8zSPt/O1z6DBpd1SiKILk36VuT7HX99XWSGraOb/o2Q+rasMfyOc1WLG4FUnbf0X
         rBi6odKSbvSeENkMqTQ/x7jUdIf0hLXH+EmaqWu3RZOAba3tGt0lEqGBahMbsEEfubya
         IDgtOQKJ7lbHvSkkoKSVlT16HmQcLIKXFcf0w5dLooKfCS6/0f66tm2LjGw4T14lb2Sl
         7A31JyQcg2cAH+A0Xaw5v2Gnj7OX26yuSi+c7m4VBYbX09iOzvSG4houDQqHltC/xWsg
         0EngejQhWhXWdaMUzUmjZRPjb9/kLDUhgEupQMcHnX6B/gyqXzbKzS/hS4wioFOSevR6
         LNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=94toTxN8hQ2nuR/rMwCVMtEmzu/PwaTUOi2X04Go/n4=;
        b=Sg6S9BOP6xozVZMZr20sUQ/YfEfJBRwMyDlYQJzYmkC9ytn1rqgPrf/kSPlOA4VtLa
         mO8RFqD95buWYPu+VJ7ZBhN4ZxhMRKeZFBlrYY0CE01xaZGcSP6AQvX4kRwmloF9vTPG
         Boafoalps3S4CxtvhAH9aIzt7IZ+xztUcLO0NGfROHlGlNRBjyVQx1eXg6m0JlzMvmuF
         mBTIIChn8OtoV74nDa5DIu2XcgwTt7yBbPpGoT/+20qm8x25QVYO2X2R2Hvjrq446pT3
         yJiF3tLl8esAE0nMOMuds5tkG3twkxZoLTDQk+Io6o3APhpJnjtbLyxfT3/JF7mBHURJ
         enxA==
X-Gm-Message-State: APjAAAXCMu5iiM8bTxnig4oN4A5cBYyD0HIhGo7t90GQiJY2J0VDtqY7
	jIc84ncuhE3lufD2EdyJiixhO4eJ
X-Google-Smtp-Source: APXvYqw0BELRS8vRZtZtlx+OlyxJTU6XsZnxxjNg7GbTeATTMAY4ALjc3VNE5lbS3X1JH8nurUn9QQ==
X-Received: by 2002:a63:2ac5:: with SMTP id q188mr4649700pgq.151.1582521570920;
        Sun, 23 Feb 2020 21:19:30 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:29 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 12/22] xen: add seabios to RRECOMMENDS of xen-tools when HVM-enabled
Date: Sun, 23 Feb 2020 21:18:42 -0800
Message-Id: <20200224051852.21933-13-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Launching HVM guest VMs requires a BIOS firmware binary.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen-tools.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index e012020..5b0a339 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -29,6 +29,7 @@ RDEPENDS_${PN} = "\
 RDEPENDS_${PN}-dev = ""
 
 RRECOMMENDS_${PN} = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'seabios', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKTAP_RRECOMMENDS}', d)} \
     ${PN}-flask \
     ${PN}-hvmloader \
-- 
2.17.1

