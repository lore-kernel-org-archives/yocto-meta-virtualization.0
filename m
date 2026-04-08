Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB671FD5F79
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 10:34:33 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103209.1775644466947997017
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 03:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SnGeuKuX;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso52821335e9.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Apr 2026 03:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775644465; x=1776249265; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5/WFTD3OQH8Pcwf4XaEIKM94AQjlKhhlmAyJbfS13LU=;
        b=SnGeuKuXsQLu8vg9KlPgIdK9viH8sqNn9mETbH03B5CEiAq46S1+xdLPZZK9zb8yMp
         EInbCiXuEI7RcxtLimSrXdT2D5jrX8hrPdb5cfeH/XFYDi6f1cq5mmso/juKLfs/Qmjf
         Dvs71155cFpJ80rf0L21Q7SXe468cJtriboDISe6k2zhlVRBcByo1Bav45f+AWpQk/ti
         Wi9dKQMOvr0rK7WXAQria6zf19LDn1VkWvp0d1OGdyU+CYENzcX3WUu/eWDPACvU7//3
         6J+rKDw2M8K854HdlXxr3g372jKoU3Q/8I/bMec4IGzKdh7vDK94pV8NuoDOtWPQMDmE
         YdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775644465; x=1776249265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/WFTD3OQH8Pcwf4XaEIKM94AQjlKhhlmAyJbfS13LU=;
        b=E6Uo4NJ+HkzJwLWFjraC/3vtxHUuaRmkpxmWVd/GCyckq+F8nNZxCMt9Nv61y2Xlp4
         bvaRYmpxbDNTZyda/PJ2RXLq0DoSl2WYFIL+JH5GlxjoLFpns+W+IKnukFVvFldnRkXI
         6OGWW2/SSqogaADXBGfntFbNKY66s54NNiy1JRk9tjofFjM9rBRVjxZEJYPPD0MaXeri
         shpB8V49gfv1LQUyU8QzakKp6C1hEThxl/5yKzWDWWTbQ6eb1wt73ZT0WrOhmJMk2atv
         moXfr3vdV8wQ98QES/xb6XWLyTRL6eP6Mr0hO2Iq4DAOdoGQBXC+Np8WqRt7low+z7q2
         BdYQ==
X-Gm-Message-State: AOJu0Yw4v+cr3DzNyfFsRT5+p/fMycenBGlodn5u6z+PPpKZ03oWlJh6
	b6BRpQhsH7fvXw1btt86l5sr8y7BP5SNLk06Kw1ZlIiH9D+McfCVj+jX9AjjwQ==
X-Gm-Gg: AeBDies73wFYgzFJ6XGmG78GayK/Hop+QIgD952NKCZtB0p6Qm2IvjdNOSKcoSTwAaB
	GjAZnyZR3SnRiwBof2Lsko2cqmuoLb4MjY1u1bpvIyabzqGyRNZ+EmZytwBYI7HC6suZHaezUux
	RQ5c1gOFb/VnxdRMRiudDG9SEHOO3kPyb/7NVYOatbCuk3DlK5PBAkJwvr0OgFaQXc7Jc0NwhRv
	JFZundfa2gRIZAyUjyoW3cPX1vEJUU6VZdos7l3gz0VIth82L6kLq3iOW6+Ew03eVDh0E7//1dA
	Wv0GUoquj7QEIcz09+fqA3/uVkzioiP+6eB8VI3u51XHmqDUl5kUjmQjcQxfhdagzAxJQrJUHaU
	R3mY47NUSGOMAUIBdRL8LxaGEx1AiuGQ5TqPjzxsJ97DSxzRFoGgaYnlLTVOLsDs8XNRZKjcbNz
	JhVIgfykrMLAPmZd+ZzVkdSVzrIw==
X-Received: by 2002:a05:600c:4ec7:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-488997ee016mr271123205e9.23.1775644465110;
        Wed, 08 Apr 2026 03:34:25 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b0c53a27sm231211495e9.7.2026.04.08.03.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 03:34:24 -0700 (PDT)
From: martin.jansa@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] wic: move to files/wic
Date: Wed,  8 Apr 2026 12:34:20 +0200
Message-ID: <20260408103420.4007266-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Apr 2026 10:34:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9689

From: Martin Jansa <martin.jansa@gmail.com>

To avoid sanity check failure
https://git.openembedded.org/openembedded-core/commit/?id=07e410600c41103098b670f12abe87f64419a624

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 {wic => files/wic}/directdisk-bootloader-xen.cfg | 0
 {wic => files/wic}/directdisk-bootloader-xen.wks | 0
 {wic => files/wic}/directdisk-xen.wks            | 0
 {wic => files/wic}/qemuboot-xen-x86-64.cfg       | 0
 {wic => files/wic}/qemuboot-xen-x86-64.wks       | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename {wic => files/wic}/directdisk-bootloader-xen.cfg (100%)
 rename {wic => files/wic}/directdisk-bootloader-xen.wks (100%)
 rename {wic => files/wic}/directdisk-xen.wks (100%)
 rename {wic => files/wic}/qemuboot-xen-x86-64.cfg (100%)
 rename {wic => files/wic}/qemuboot-xen-x86-64.wks (100%)

diff --git a/wic/directdisk-bootloader-xen.cfg b/files/wic/directdisk-bootloader-xen.cfg
similarity index 100%
rename from wic/directdisk-bootloader-xen.cfg
rename to files/wic/directdisk-bootloader-xen.cfg
diff --git a/wic/directdisk-bootloader-xen.wks b/files/wic/directdisk-bootloader-xen.wks
similarity index 100%
rename from wic/directdisk-bootloader-xen.wks
rename to files/wic/directdisk-bootloader-xen.wks
diff --git a/wic/directdisk-xen.wks b/files/wic/directdisk-xen.wks
similarity index 100%
rename from wic/directdisk-xen.wks
rename to files/wic/directdisk-xen.wks
diff --git a/wic/qemuboot-xen-x86-64.cfg b/files/wic/qemuboot-xen-x86-64.cfg
similarity index 100%
rename from wic/qemuboot-xen-x86-64.cfg
rename to files/wic/qemuboot-xen-x86-64.cfg
diff --git a/wic/qemuboot-xen-x86-64.wks b/files/wic/qemuboot-xen-x86-64.wks
similarity index 100%
rename from wic/qemuboot-xen-x86-64.wks
rename to files/wic/qemuboot-xen-x86-64.wks

