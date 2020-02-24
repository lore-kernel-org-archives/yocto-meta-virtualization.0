Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.17137.1582521576419860431
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fP+FuMEC;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A1B5E01483; Sun, 23 Feb 2020 21:19:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.215.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2029DE00804
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:35 -0800 (PST)
Received: by mail-pg1-f194.google.com with SMTP id w21so4495745pgl.9
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IwWxianQo2M0t0arJeHbT2no/XUmw8g/iVn9SvYKghU=;
        b=fP+FuMECurN05U/Fdt/4r+8JMhuK+1XUjdr6cPkpRZazms6yph0ON7BS1ulMBYtMNJ
         xZmkvjV1J0ESgjtiMAqn5Fb2TuNhdXfJ0OvQgPopO4Qx2Zm/YQxeBxIGDfbS92Hpqn4q
         ljpkhpyh+fS63fGP3QWtle8KUOJlAd0sqjqDVmHZH9pVfFl26j1tHli7H80FxLyGyP2D
         QmmUKHvXpExmNdeuChiJ1+8fsypVL+CUs0cSZvUkxE0yFdwCU5Ws54aFxTGIeOhUXo72
         et1VzwUbjaiJypRK9YzgptRKYlkPgFeusN8DAQtV5J4CO5LQjhLQdDmJq/XSQMyIusFW
         H3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IwWxianQo2M0t0arJeHbT2no/XUmw8g/iVn9SvYKghU=;
        b=FgEnZ+ozbqQBNenHAFfW6hU/9T0P+dyAUFMqUdRFqosFgHP1ImcvbdQp20bAtxfHiU
         QahgFziBWcp7dvZNrV9hEQeVF2Xo0xlI/tABaB+YTISoB9PmagthW+mGnz/IrT68SHGx
         hUjCFB0eb4KssDDaAl9KLKHOVarm4+siE7ZoqDUXoDGHiIqUbnalRMPGPmDnvdrOLh87
         cY6ofMYSmrzNv4LB7xpBpQQcxk7K1O50N1kyeIZKxg7ZaPZnDrQIrm1GMAqkGNXngKTd
         YH6nxiR+UsAigDwxuDSh5HoZwLw+/OwSwosbU5+euBZQqs3T9lm6PU+uBA6gbIf4neik
         wZpQ==
X-Gm-Message-State: APjAAAV4biDL+WPUS0/YHwkhtYTUX+uBpY9hyRKtU2Jzc6RkxqZjx6dg
	iI4o+Z7kvvOZk5t9KbPJ4ZTkuzjV
X-Google-Smtp-Source: APXvYqxAMiipxZJkjZkTcqTUt6Rh6JiwnxvGP5YpFBtKYzoPTo3mI7y2TvyF2t/DrQhz/aev+6igSw==
X-Received: by 2002:a65:4647:: with SMTP id k7mr51752214pgr.11.1582521574145;
        Sun, 23 Feb 2020 21:19:34 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:33 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 14/22] xen-tools: change globbing to fix syntax highlighting
Date: Sun, 23 Feb 2020 21:18:44 -0800
Message-Id: <20200224051852.21933-15-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

A text editor can interpret /* as the beginning of a comment
and then fail to find the matching */ it expects as a terminator.
This causes it to mishighlight the rest of the file. Avoid this
by using a different matching pattern.

Fixes an annoyance when editing the file. No functional change intended.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen-tools.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 5b0a339..e166c74 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -197,7 +197,7 @@ FILES_${PN}-dbg += "\
     ${libdir}/fs/zfs/.debug \
     ${libdir}/fs/reiserfs/.debug \
     ${libdir}/fs/iso9660/.debug \
-    ${libdir}/fs/*/.debug \
+    ${libdir}/fs/**/.debug \
     ${sbindir}/.debug \
     ${libdir}exec/.debug \
     ${libdir}/xen/libexec/.debug \
@@ -346,8 +346,8 @@ FILES_${PN}-libfsimage-dev = " \
     "
 
 FILES_${PN}-fsimage = " \
-    ${libdir}/fs/*/*fsimage.so \
-    ${libdir}/xenfsimage/*/fsimage.so \
+    ${libdir}/fs/**/[a-z]*fsimage.so \
+    ${libdir}/xenfsimage/**/fsimage.so \
     "
 
 FILES_${PN}-init-xenstore-dom = "${libdir}/xen/bin/init-xenstore-domain"
-- 
2.17.1

