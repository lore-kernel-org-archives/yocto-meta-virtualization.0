Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6259.1794000186362513101
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Nov 2026 13:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=DSm3RpKc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202611062123038bbc38b4ce00020783-jrtvwf@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202611062123038bbc38b4ce00020783
        for <meta-virtualization@lists.yoctoproject.org>;
        Fri, 06 Nov 2026 22:23:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=zDaTiw+njzKfzy1U5wAeDdeUVA9rMZn7LXM7I7+dAbM=;
 b=DSm3RpKcv4/LL15EgUMKYHKCCcRFvQXFoOLNwqldgI2LhgiBEETWIU+EDyOCO3+8nknAwS
 hsQbFlFWWxrm1WvcdJZNIhc5jxprXENnkn3FIfLsebzPZhB2O7ggmZ1xeJKbuDgaPersARzT
 FCc2diQIOo+/BNIRZbTEIqK++yoE8fvhmtb/hZ8h7UtYpHmMOUMGPtSLglD+o13Kg250Tx1X
 mNATx+WDXYzBQkOpqQuaCebRTc6Zv9pE8bsbOj2MI2Q3yQIpvTZnDDgfwT3rdDHNXeKlLGUL
 sb745TdTPRpO8lYpobV28hkHfR7fUR0aiTjG8zB48y6Xk+Pixt8cKekg==;
From: Peter Marko <peter.marko@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][wrynose][PATCH] podman: set status of several CVEs
Date: Fri,  6 Nov 2026 22:22:18 +0100
Message-ID: <20261106212218.441914-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Nov 2026 21:23:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10162
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

These CVEs are showing up in CVE reports as open due to sbom-cve-check
tooling not being able to make decision.

All statements are based on Debian CVE tracker links/comments.
The 4th one also additionally by checking commit marked as "unaffected"
in [1] which updated buildah to 1.27.6 while we already have 1.43.4.

* CVE-2019-10214: no-version-ranges (no unaffected tags in DB)
* CVE-2022-2738: no-version-ranges (only RedHat package versions in DB)
* CVE-2022-2739: no-version-ranges (only RedHat package versions in DB)
* CVE-2025-4953: no-version-ranges (unaffected version is git hash)

[1] https://github.com/CVEProject/cvelistV5/blob/main/cves/2025/4xxx/CVE-2025-4953.json

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/podman/podman_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 0fbd4cfd..0728a816 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -31,9 +31,13 @@ GO_IMPORT = "import"
 PV = "5.8.3-dev"
 
 CVE_STATUS[CVE-2019-10152] = "fixed-version: fixed since v1.4.0"
+CVE_STATUS[CVE-2019-10214] = "fixed-version: fixed since v3.0.0"
 CVE_STATUS[CVE-2020-1726] = "fixed-version: fixed since v1.8.1"
+CVE_STATUS[CVE-2022-2738] = "not-applicable-platform: RedHat specific issue"
+CVE_STATUS[CVE-2022-2739] = "not-applicable-platform: RedHat specific issue"
 CVE_STATUS[CVE-2022-2989] = "fixed-version: fixed since v4.3.0"
 CVE_STATUS[CVE-2023-0778] = "fixed-version: fixed since v4.5.0"
+CVE_STATUS[CVE-2025-4953] = "fixed-version: fixed in used buildah version"
 
 PACKAGES =+ "${PN}-contrib"
 
