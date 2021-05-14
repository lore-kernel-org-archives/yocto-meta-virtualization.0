Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web08.6634.1620985927509656038
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 May 2021 02:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kJtiRvIj;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id m12so43897531eja.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 May 2021 02:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QVPz13owrRI44Qe5QFCDXZikecurn40ljbEcxeW3vQY=;
        b=kJtiRvIjokwRBDuH5wZNyGAyDpkgNgzy/v1DBYTOyzDv5hitPrzDFtuQR4o7j6LD7j
         kuKRfcPtoUcRyLOdNFpDR0ZhejbWbDL8LRHNZJGCGO8/A6a+O/emQHj07N6w8wBLMeZL
         mFomAcqp6AfaJbhAbEzH9h12z1LxKXXSWzaBNbQc9QM8J5bzk0btGkOLUPbNJ4iJyzaA
         2fiLAc78Z5ysog72ArRDamWSK+v0Hsh+AE/berl1jr589m1u1uiYFJJQZyHTB4DRrm+/
         DMntuHJm7kndhCU/x2brab9XGGgQ92UkZNBued42pRoPeayzW54C9qBoOVgWgXwud4KC
         ViWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QVPz13owrRI44Qe5QFCDXZikecurn40ljbEcxeW3vQY=;
        b=fIhle/e43uwAZEySBTiIUs2RCMLePRzmzHV9FCbo+5j0HO9ENz4/G4f8WEDXT6zlTJ
         WHjWkg83WEMTVPJj0yP42h2bwXqCpDtJzS3nlM0q8wlknZcRjI4QgFs1hrnrNYP+uku3
         h51EYhOs9IG8lH+fNTw881TOdZ1rdADsPxgUyJxIyBHKuQB4Q2SXaFzq8UleacpS3Cc1
         PWcltxA9gqwyNXJGssTCUYkQeXa7GsLTrxNc72gHHv5kJG2EVRyCjZ/f3UyAgSqQxE4T
         dyCHWni5d8FSRs5NVhmkDO5HsCxoY2RASzdqWajHQQeUdPDDX2yvT0aFM82uMjNClPha
         WIrQ==
X-Gm-Message-State: AOAM532nVtw42IIlTC5QlY90iXr1zEifEouoLiTA552Q4V8AdND19m0B
	MKpcfYoh86ts0XVzbl7JV/jfgoTwApA=
X-Google-Smtp-Source: ABdhPJwl8BJbVkZlclxeGVW/6O+guRc1lJ/qHfsLh1+eG6zyeD5t/jB/m40alEf+bGOyYnX5ku+yzw==
X-Received: by 2002:a17:906:2ec6:: with SMTP id s6mr24429199eji.65.1620985926008;
        Fri, 14 May 2021 02:52:06 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id o20sm4082721eds.20.2021.05.14.02.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 02:52:05 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 3/5] ipxe: set PV
Date: Fri, 14 May 2021 11:51:54 +0200
Message-Id: <20210514095156.1562532-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210514095156.1562532-1-Martin.Jansa@gmail.com>
References: <20210514095156.1562532-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  ipxe/gitrAUTOINC+18dc73d27e-r0/git$ git describe --tags
  v1.20.1-1-g18dc73d2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/ipxe/ipxe_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
index 9e98495..ff6154e 100644
--- a/recipes-extended/ipxe/ipxe_git.bb
+++ b/recipes-extended/ipxe/ipxe_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://../COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263
 COMPATIBLE_HOST_class-target = '(x86_64|i.86).*-(linux|freebsd.*)'
 
 SRCREV = "18dc73d27edb55ebe9cb13c58d59af3da3bd374b"
-PV = "gitr${SRCPV}"
+PV = "1.20.1+git${SRCPV}"
 PR = "r0"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-- 
2.30.2

