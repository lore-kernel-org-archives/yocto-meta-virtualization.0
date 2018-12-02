Return-Path: <open.source@oleksandr-kravchuk.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 17372E00C1E; Sun,  2 Dec 2018 13:55:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0156E00BB7
	for <meta-virtualization@yoctoproject.org>;
	Sun,  2 Dec 2018 13:55:18 -0800 (PST)
Received: by mail-ed1-f68.google.com with SMTP id f9so2632096eds.10
	for <meta-virtualization@yoctoproject.org>;
	Sun, 02 Dec 2018 13:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=HkXeLaj6Alrs/tTMsMwviCRcT5i1MwVU89bWZpLjh7w=;
	b=0VRTGDZRFi7k0wmCDjmDiFQxT8lD96UctHFg3cn3PNqtX9uz3mCtsm3K9KY1fvmQ9b
	SzSPe8R/jiS2WRzWpQbqVZK37MzX2GAskOYbLBhf3ZDnnniSFosmsiJBVuAJLaX/RAzy
	5yNBriL6d7wg7xVuZdFp3UrMg8ADUKDuCJ2zzjUoZfuuJg0llBQoDsKRMo9rlVmX/nWD
	vn5bGtN9/KdOuqPhUQexOssKFJ1efbBfipe0Ftxxm3SoR0FC+WHJU6lhnSWcAhPZ45jS
	46vIycIlHl495d1WTf1jLGJJefH5PfIk8qcOCqbDzbEfUIuosY/Lzq95xJF/DHyad9H0
	T0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HkXeLaj6Alrs/tTMsMwviCRcT5i1MwVU89bWZpLjh7w=;
	b=JQ6u7yfG6T3fuEScKTPEPi1SK/dtvlVDmGFYcKZTIVueEzjXgm2r8X7VDTMmNpMjxx
	5f9MolKsJ8NQ2+dQH5D6jxw7O/FS1OuBowFXIBtx+MoBWTTlbe4LnM0ysMxX9hZ5Av6M
	DQZ6R/4jGwJn5GIe+7m65EOm2RNSTF/8k90V0j1Mz7YsXleHhc1khKlR5GeM2BoRlB9Z
	2OAzKkSHV4VxrRUhcK+3eHFR/x6fx5yiCTglpHFtNlSOzuElE1WgR6RXXGk3AQsAixHO
	qSqGRsuEHBvT0LAgiHx2IFJEThVSODmih6vccYx/BCXNJjynkZ4XBu03FZTjpLVxQPGv
	zHAQ==
X-Gm-Message-State: AA+aEWZx51qVyTx6Zgm/ZTq0OkIZHWgYRHLQxCkfbDUPmBs1v6RwZqaj
	7m/8R83QXDIsIEvnVqjID8uxAOzZw9M=
X-Google-Smtp-Source: AFSGD/VlwEF/Fmd0FYOV2kxTFxT+QqU+2OpMUTlrTUJM79atxFd/7u0wxqb8Tt7rTaC1+UsXAYoZvQ==
X-Received: by 2002:a17:906:228d:: with SMTP id
	p13-v6mr11006009eja.159.1543787717410; 
	Sun, 02 Dec 2018 13:55:17 -0800 (PST)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	gg9-v6sm1903736ejb.66.2018.12.02.13.55.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Dec 2018 13:55:16 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: meta-virtualization@yoctoproject.org
Date: Sun,  2 Dec 2018 22:55:15 +0100
Message-Id: <20181202215515.14864-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] README: add optional dependency on meta-cloud-services
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
X-List-Received-Date: Sun, 02 Dec 2018 21:55:20 -0000

Ceph package depends on libibverbs, which is provided by the
meta-cloud-services layer.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 README | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/README b/README
index 810f263..7c08db4 100644
--- a/README
+++ b/README
@@ -59,6 +59,12 @@ branch: master
 revision: HEAD
 prio: default
 
+Required for Ceph:
+URI: git://git.yoctoproject.org/meta-cloud-services
+branch: master
+revision: HEAD
+prio: default
+
 Maintenance
 -----------
 
-- 
2.17.1


