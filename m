Return-Path: <stanley.stanton@taitcommunications.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BD4D60CFA
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 22:32:55 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.6921.1731969170263413673
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 14:32:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@taitcommunications.com header.s=google header.b=cPfEFC/8;
 spf=pass (domain: taitcommunications.com, ip: 209.85.210.177, mailfrom: stanley.stanton@taitcommunications.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e702c0ac2so280036b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Nov 2024 14:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=taitcommunications.com; s=google; t=1731969169; x=1732573969; darn=lists.yoctoproject.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gV0HMMB3zGZjlh9vdYx4fnCVU3bdmnfato5fBh0g8Ng=;
        b=cPfEFC/8VXh7jLP5C+3ebpsYjhdUUyBU6zYfAvlKMreVtu9NlLblml9L7UYDqiQ7Kh
         wKoaWV4Nin0UFgl3hwHUZyHql+1XQ1lbD/L3jumLt47h05HSDuRtlopVcip0EBUna34W
         Xj/4tJ6x+STTEeDvauqgxpyHv92hKqko++Ye3BcI/t/WtG5dyzQC9zylJDOPa4B2+Ayo
         PPLv/o12Wq2ewowH9ilJo7wWqjSggx33cf7Cposfl++cYYh7MkupuVPyFg+HEiZAxSFP
         C+8oqdwwU5QxiGFDC9phBC6FKun8nSD7Ygg1XoutMRGUojBsE6QJezL7PfbXEcWK9qW5
         2meQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731969169; x=1732573969;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gV0HMMB3zGZjlh9vdYx4fnCVU3bdmnfato5fBh0g8Ng=;
        b=JpoCP1Ezbekp4G+FSwws3iPfbkiGN/ndEbRNVfj4Nj+5DmbQkWnJs199Y5seO2D3ZN
         208bVrxWvJFE+cYLIDl7LXnQhJAafjo2m0r3+RWO7aaqpaz4CHJxGPm7WtOOUOT8rDtE
         8LrwGjJ0VqhmFP5cCl7nqDrAxdku43Y6Vq3VYUjesM5umOGi5WGdfFt+PyhxIA/2leDy
         tRP+Pjiw3OZi7aW1oDI0q8aYfPRociEcvn3GOM2Bvoo7NuWP/yFmglw5vhg8owrhl86k
         VnxXS53+ayZ/zihaoVbyiYEbEEnD7OJa120F4C6ucb1Zj7RYmviT6JsgMgcV4hGsBNqk
         DoVQ==
X-Gm-Message-State: AOJu0YxCdKg6VrEXFK23iPDPRlPE9k3w/79mhERSDANlkeHaqVFB8LTr
	w+a65raxoMr/fZ9/feGtGvx00g3qVhX7XKn5/R6Vs3QoML3rg9p3D4soEt7Uqy9Tox2ix7JaBln
	8aZEosqeh+dKKgFspNgnA3dYJIRDrjGHuFUqJekvfSAePejc7mgvt4bFvA830Tqp6SSp97DNUDQ
	TZ/81jS98w
X-Google-Smtp-Source: AGHT+IEyRIvxzoNiS5aFr8SE9TF7U29/o8j+gsfJDInsG7xpeY6+ZVzGihrfpesgleRVmJO9NvcOyw==
X-Received: by 2002:a17:903:244b:b0:20b:99cd:c27e with SMTP id d9443c01a7336-211d0d63d22mr76367255ad.3.1731969169349;
        Mon, 18 Nov 2024 14:32:49 -0800 (PST)
Received: from WS4976.taitradio.net ([202.37.96.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f46322sm61611315ad.174.2024.11.18.14.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 14:32:49 -0800 (PST)
From: Stanley Stanton <stanley.stanton@taitcommunications.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Stanley Stanton <stanley.stanton@taitcommunications.com>
Subject: [PATCH] xen.inc: python 3.12: fix datetime deprecation warning
Date: Tue, 19 Nov 2024 11:32:40 +1300
Message-ID: <20241118223240.2479834-1-stanley.stanton@taitcommunications.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Nov 2024 22:32:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8972

Datetime.UTC seems is a wrapper for datetime.timezone.utc,
which is available on both python 3.10, and python 3.12 (Ubuntu 24.04)
so, opt to use that instead.

Signed-off-by: Stanley Stanton <stanley.stanton@taitcommunications.com>
---
 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index dcd281b5..63790f73 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -151,7 +151,7 @@ def get_build_time_vars(d):
     source_date_epoch = d.getVar('SOURCE_DATE_EPOCH')
     if source_date_epoch is not None:
         import datetime
-        utc_datetime = datetime.datetime.utcfromtimestamp(float(source_date_epoch))
+        utc_datetime =  datetime.datetime.fromtimestamp(float(source_date_epoch), datetime.timezone.utc)
         return " XEN_BUILD_DATE=" + utc_datetime.strftime("%Y-%m-%d") + \
                " XEN_BUILD_TIME=" + utc_datetime.strftime("%H:%M:%S")
     return ""
-- 
2.43.0


-- 

This communication is confidential. We only send and receive email on the
basis of the terms set out at www.taitcommunications.com/email_disclaimer 
<http://www.taitcommunications.com/email_disclaimer>


