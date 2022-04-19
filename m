Return-Path: <michal.orzel@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DB7C4707A
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2094.1650359244723625557
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 02:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michal.orzel@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 355BC1063;
	Tue, 19 Apr 2022 02:07:24 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.11.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84AAE3F5A1;
	Tue, 19 Apr 2022 02:07:22 -0700 (PDT)
From: Michal Orzel <michal.orzel@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	cardoe@gentoo.org,
	bertrand.marquis@arm.com,
	nd@arm.com
Subject: [PATCH v2 1/3] xen: Bump SRCREV of 4.15 recipes to 4.15.2
Date: Tue, 19 Apr 2022 11:07:11 +0200
Message-Id: <20220419090713.134057-2-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220419090713.134057-1-michal.orzel@arm.com>
References: <20220419090713.134057-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7189

Bump SRCREV version of xen recipes to use the latest 4.15 release
which is 4.15.2.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
-none
---
 recipes-extended/xen/xen-tools_4.15.bb | 4 ++--
 recipes-extended/xen/xen_4.15.bb       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-extended/xe=
n/xen-tools_4.15.bb
index 840f162..5592dd7 100644
--- a/recipes-extended/xen/xen-tools_4.15.bb
+++ b/recipes-extended/xen/xen-tools_4.15.bb
@@ -1,5 +1,5 @@
-# xen 4.15.1 release sha
-SRCREV ?=3D "84fa99099b920f7bcde8899e1a9b756078719d7d"
+# xen 4.15.2 release sha
+SRCREV ?=3D "32dcef072fb37d432fd45c7916383472f3fcbc5e"
=20
 XEN_REL ?=3D "4.15"
 XEN_BRANCH ?=3D "stable-${XEN_REL}"
diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/xen_=
4.15.bb
index 1b87ae8..41023b2 100644
--- a/recipes-extended/xen/xen_4.15.bb
+++ b/recipes-extended/xen/xen_4.15.bb
@@ -1,5 +1,5 @@
-# xen 4.15.1 release sha
-SRCREV ?=3D "84fa99099b920f7bcde8899e1a9b756078719d7d"
+# xen 4.15.2 release sha
+SRCREV ?=3D "32dcef072fb37d432fd45c7916383472f3fcbc5e"
=20
 XEN_REL ?=3D "4.15"
 XEN_BRANCH ?=3D "stable-${XEN_REL}"
--=20
2.25.1


