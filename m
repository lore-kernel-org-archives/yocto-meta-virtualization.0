Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.174.1582676211954095809
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aeIxZoga;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CE20CE016E9; Tue, 25 Feb 2020 16:16:51 -0800 (PST)
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
	*      [209.85.214.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F75BE016B5
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:51 -0800 (PST)
Received: by mail-pl1-f194.google.com with SMTP id ay11so527110plb.0
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IwWxianQo2M0t0arJeHbT2no/XUmw8g/iVn9SvYKghU=;
        b=aeIxZogax+qrK0Ip2z4qktYybvTcylGbYvu3VJVYc3eWFIY750mzMErrJJeu27uPpM
         FvlIWLwbYPTOERd3NY0uQEzbymae8DVYJv6fbgL5MQ4jjwJPqYCA4wBNC/uvnhSrY2gB
         27xfO6n++lTz7LrqTO8H7M8dYUjqwtMnii9QzA4NOloVz/eZHAe+Q1DjZRw7beACRlYM
         m8GWwxF5T++gLjaSNzZ3RNxXW4kVNaZfgwc8B3YQhy1qH3hkUefyQl4KEp99Zv5GX8Gp
         py3HhWakPWTpVu7QBajIUhWdHbncOkbxTlsRjJdxfk1a2iatZ+M+sCHhqMvs/kAB0Lh3
         SQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IwWxianQo2M0t0arJeHbT2no/XUmw8g/iVn9SvYKghU=;
        b=NVeNhwCqbAo5sBPFXSddQXPD7i3oDiXenfhSakyW5bvUl4Ef6ucVk5tMCkGVCmmN2k
         rV1DI9t4MLOKlasi19NnX2XejjhcESb73LI7sEJ1i6+19le274rNZ+L6HY+WFekeJLIo
         x6xDkDULq7vpgyKaYJEMFhRH2+6Nq0iqVNzVJJ2nYB4vXH1RkDqprPBkX0fwFtlfuHTd
         rJxMjOnV7WGZ/LqsDSTY9gpfrp+ZeCEMeya7mWUSj+2/UvyPn4ExfIeJpNluPxwimnqp
         bM342L8wwm6UuuuotGIA5q6/v6Uo5hrT9xvwOxOw3n93/11hhuLJh5zo+I4RLFLZR+1V
         a6AA==
X-Gm-Message-State: APjAAAWE2fxSX2ikqiHCHiN6+AzsH56XR5wokXfcmnFH1vAmE5obJOm5
	/hdka3fdjOvQ3Visbqe+wXFi09Oz
X-Google-Smtp-Source: APXvYqwJ/ftf2V7/5B/C2ZKtNaL7hoUcry5XLPLC1RtBDtVXDRVSf9xZeB2wTC7BUCCy66MXgcgQRw==
X-Received: by 2002:a17:902:161:: with SMTP id 88mr1146833plb.129.1582676210714;
        Tue, 25 Feb 2020 16:16:50 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:16:49 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 14/22] xen-tools: change globbing to fix syntax highlighting
Date: Tue, 25 Feb 2020 16:15:58 -0800
Message-Id: <20200226001606.14750-15-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>

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

