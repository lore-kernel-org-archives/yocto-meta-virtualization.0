Return-Path: <michal.orzel@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC42C352A7
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3538.1649407485746548003
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 01:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michal.orzel@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5225E139F;
	Fri,  8 Apr 2022 01:44:45 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.7.146])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8E4E3F73B;
	Fri,  8 Apr 2022 01:44:43 -0700 (PDT)
From: Michal Orzel <michal.orzel@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com,
	nd@arm.com
Subject: [PATCH 1/3] xen: Bump SRCREV of 4.15 recipes to 4.15.2
Date: Fri,  8 Apr 2022 10:44:18 +0200
Message-Id: <20220408084420.102085-2-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408084420.102085-1-michal.orzel@arm.com>
References: <20220408084420.102085-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Apr 2022 17:09:36 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7131

Bump SRCREV version of xen recipes to use the latest 4.15 release
which is 4.15.2.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
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


