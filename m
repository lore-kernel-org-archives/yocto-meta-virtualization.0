Return-Path: <stanley.stanton@taitcommunications.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F6AD60D1A
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 03:50:07 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.13070.1731988202428788965
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 19:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@taitcommunications.com header.s=google header.b=VpMgpNQY;
 spf=pass (domain: taitcommunications.com, ip: 209.85.216.43, mailfrom: stanley.stanton@taitcommunications.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ea704b1c2bso211356a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Nov 2024 19:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=taitcommunications.com; s=google; t=1731988201; x=1732593001; darn=lists.yoctoproject.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=g6QHx9TqD8D8kvxB6AZxAO0LQ9x4pChv00myPI+oDIY=;
        b=VpMgpNQYCIbaczsINYFm1LVmgOg7ZlcqwsQwZY06/59Ha9twURrzcqXDzTTE2ESL0L
         +9o18HLPQLwTe0ovtR3CV6Hex/uUQWMsTDT5Yj2eQuTXoIiwmJLAdoe2NTKYhp+rKFRJ
         cQH9TNot6HpyX4K8Yoi2NF9YODDlsyehcIAfRxVeccGkNhByDMTAnaUM2yqCy61UWRaX
         HvGPhXkwEbpBbmXJW9Z76LOhliqMHNBU7kpsL9Zz9/dZ9Ae08aShWMvUSp9sMniOERE7
         usD8izRaekYItIJwNyxU5jUl1pP9+yFF44k3U971DMp/jcs8NuGjYh44pVeCdCxhM474
         AxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731988201; x=1732593001;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6QHx9TqD8D8kvxB6AZxAO0LQ9x4pChv00myPI+oDIY=;
        b=XVq8u7dUN+z3YJ6+VY3aoJ0wppJ0o+STTlnqShZdMnZlQKoocFxfm/oPpGE/jKe29C
         Jdn3DCI50lI9MT10XsJkZTQm1m/MyVXiOvKTid9iy+r+EDw95oIc4NxGdxYF/h1re951
         1iT22U5ZUAmqdPRzghRPHTzypvswWPRX4tXkJuC9ewrLF+DopBSgCI+TQfcgTpgH84c9
         TGfV60Gp3eMg9ar7p1uMtu2URAvBkhRcIAmhiJ4iaYnZrVU2iPceK21nYJKyeCw9dS+x
         iTNCyJte1TekQrHm9RNZsrQQifD95B9tTbO95yZm0Bh108/AArmGkGxUvJzyJVWjXCsw
         TQrg==
X-Gm-Message-State: AOJu0Yz4DBN2D+Nzi98tgRhXhE/hxDfSmkdhOxB2pGY9HBSi39QuVpdX
	DxUSAteukIhjuglQ5u7V3UVD/ockZ/HXquYbsHu6sTTLeAVFjq+aAM8KdRemO9KuvDcx96DrIDk
	PfUG9MKeEKMHvx1n9FNVDiIgbUg8cBncZLXUhvMWlznhHib08e+rEC9F5hvofaK74eHIH8qOQcv
	fsIWh25+lK
X-Gm-Gg: ASbGncsQ4WCY9O9aIrrr0QUs4PgiF0qspPBKDd3qCzx7xMsjJ2LXUo3mhfih0wQ/5lu
	nE14S3DyMzMlce8kzw5dA7CHE3v2HBkMo3ivEya0eI0fQZQ6Owf0emKrfluEyxsDdez9XpjnrMZ
	nlT8aSvuVstNeyybErMt4eSVx6TpCVYBwCRv9H06doDBXYOZRRz6v+Li+rArBuHsVKufInccrwE
	zdoSXf1cxph6Yi8hKfy+YUX4tHcvSBnf06DqyK2vq4iooVYgDhaSWEsBjcZEzJV9a9JDwja+xjC
	5eY0nw==
X-Google-Smtp-Source: AGHT+IElA8BdKY0XHGzHvOVl2LtKCG28SPKe7XxFPsWdCtnJNZAuN/kphaBi09MVn6CuJVUH0aavKw==
X-Received: by 2002:a17:903:244a:b0:20b:80e6:bce6 with SMTP id d9443c01a7336-211d0d6e93bmr84127265ad.4.1731988201453;
        Mon, 18 Nov 2024 19:50:01 -0800 (PST)
Received: from WS4976.taitradio.net ([202.37.96.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f46322sm64417875ad.174.2024.11.18.19.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 19:50:01 -0800 (PST)
From: Stanley Stanton <stanley.stanton@taitcommunications.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Stanley Stanton <stanley.stanton@taitcommunications.com>
Subject: [PATCH v2] xen.inc: python 3.12: fix datetime deprecation warning
Date: Tue, 19 Nov 2024 16:48:17 +1300
Message-ID: <20241119034817.3051733-1-stanley.stanton@taitcommunications.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CADkTA4Mc5RRPd_vJ5Bt4KDrCyvfB_H4EGwojXY+SAN8F--puqg@mail.gmail.com>
References: <CADkTA4Mc5RRPd_vJ5Bt4KDrCyvfB_H4EGwojXY+SAN8F--puqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Nov 2024 03:50:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8976

Parsing xen.inc with a host distro that provides python 3.12 (such as Ubuntu
24.04) generates the following deprecation warning:

DeprecationWarning: datetime.datetime.utcfromtimestamp() is deprecated and scheduled for removal in a future version.
Use timezone-aware objects to represent datetimes in UTC: datetime.datetime.fromtimestamp(timestamp, datetime.UTC)

This warning comes from the use of datetime.datetime.utcfromtimestamp()
in get_build_time_vars.

datetime.UTC seems to be a getter wrapper for datetime.timezone.utc,
which is already available on older host distro python versions
(I have tested only with python 3.10 provided by Ubuntu 22.04)
so, opt to use that instead to prevent a breaking change.

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


