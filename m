Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447CBE64A8A
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 12:48:04 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.18415.1733230080177660008
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2024 04:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jzIfChLO;
 spf=pass (domain: mvista.com, ip: 209.85.215.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fcc00285a9so2385827a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Dec 2024 04:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1733230079; x=1733834879; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3tZBkjk1jvobLD7c8UlVDKXMYfdifEQnQX4V/JrgdJs=;
        b=jzIfChLOXJpxA439kn2U91cAH3sv5YoL+F04WFH0Psuxq2UyNINsOck0vNtYelLnBT
         9U/6KrSBBVGyLZRLIsRWAJJV1tMh/xV1jRFsqqEAyRhueyg4G2vsbYILyyncFlf0y4Xj
         1FwZrtuV4AqAaV2vmGSf/3HTQ3jly2xtQ92Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733230079; x=1733834879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tZBkjk1jvobLD7c8UlVDKXMYfdifEQnQX4V/JrgdJs=;
        b=Wlp1Cr5WRqoiSahoKzTURsxZuo+kI2r9Jn75WerxjPaCWpgvpmtg89mVpiCfGP2p3Y
         i/j0mQVaVV/6DS9gtCYA80baf+2HVwDCIdezIg1qOzAmGoZMWJGKoauPqnhz0nYXU9+g
         ZWTBB/w3Ho1P5ReEOHUWSGsdNrg+CRKwms8JEiQiSMksMYS1b555QFCXkxohjHokHko1
         Q2oYai1vzhPVTQheTNqP6/9NOp7UR9vCAKfmS+vKOY8T8IrmHqNXuL6eq9i75dakYqts
         vmk1qKYjU+XQJ+rAB7GY60t3HpT3cCRVJYDRq8RFfUa7bLUR1mpRW0zhPG1p1XPXR7Be
         Useg==
X-Gm-Message-State: AOJu0YyCmGJdXQPc2X9xc1OkMRCPOy3q9ku8O9yd17SGB5E1+oICoNiB
	P+OHa4HmuztpaPVEI8XpqPdj/pW6Il/7OfgQKh2+oox2+HBYj3ytv52asEGby0P8vxTxvx+GFS3
	Q
X-Gm-Gg: ASbGnctNZG0aYKoNpmuggxGVU4R2JSt1drWdFYb/Dp/ef8jW/PP4EqAZIgZ7zvxfjc4
	OYu+HmUPzcUCx2XXgNmENFkJ2UKx5+q8G2iORHND94AinHufyPAnCTHSHhcDWfT7OJpigp+LjOr
	4itul/6GgE0oGPTWtx/dhrH0EwpybpnWwScah5iG7CeaDmw9/5ZfkcxzbS/Fsph610+Nc7Cg2Lk
	q21Kbz6YGKWw8JxrHRUY8CgSrOWsAgM+yfTmmiWQ3oyjrxjOGA8dmGcBNi74w==
X-Google-Smtp-Source: AGHT+IF87kR0+dW9ITTKTCqG7Dfd09VKHn/VGjfo8dWo1BaVkyxpIoORxIWUvAuoh5U3cPrrcUuHfw==
X-Received: by 2002:a05:6a21:3a96:b0:1e0:c8d9:3382 with SMTP id adf61e73a8af0-1e16542c06amr2449051637.45.1733230079231;
        Tue, 03 Dec 2024 04:47:59 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.198.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee5844ad98sm8035071a91.46.2024.12.03.04.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:47:58 -0800 (PST)
From: vanusuri@mvista.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-virtualization][m-c-s][master][PATCH] libvirt: Add missing "_" to bbappend
Date: Tue,  3 Dec 2024 18:17:48 +0530
Message-Id: <20241203124748.3731353-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Dec 2024 12:48:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9035

From: Vijay Anusuri <vanusuri@mvista.com>

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libvirt/{libvirt%.bbappend => libvirt_%.bbappend}             | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-extended/libvirt/{libvirt%.bbappend => libvirt_%.bbappend} (100%)

diff --git a/meta-openstack/recipes-extended/libvirt/libvirt%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_%.bbappend
similarity index 100%
rename from meta-openstack/recipes-extended/libvirt/libvirt%.bbappend
rename to meta-openstack/recipes-extended/libvirt/libvirt_%.bbappend
-- 
2.25.1


