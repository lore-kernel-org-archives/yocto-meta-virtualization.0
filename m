Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6260.1794000186363079113
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Nov 2026 13:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=QmIpHL+P;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202611062123030878267f2500020794-xfh9sa@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202611062123030878267f2500020794
        for <meta-virtualization@lists.yoctoproject.org>;
        Fri, 06 Nov 2026 22:23:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=XZLbG3cc5rPj64et0YxQXxLNLGtTkc8xu69EgqHyVK8=;
 b=QmIpHL+PgCwQe4kTTSbkDZf1/FGWIYkUf1t2rcibNaQG9Q9zF7lMSW/Z0pCSdPZvXhlhtX
 eK1tFOcOcvlVO3KCHJ+YBZJBlH/7HSpG7BBv9AIN6GF13MqyUX3GXEuBnaaGgQPw/hzrRxH3
 r/YVyh07rDstfBm9jcm2lG4ZnvNi8eYw4/iNaWFQsNl4eKOIb40ej6rJblbxKJ6UDuBjCgpQ
 uq3VUDTYq0UnFgofoBFu2OYw8TA/vmIvpuyLJ0do35aTEVYH5E+CvU2Cuas8MOEf4kTsshYh
 4chPwzA0mVvIPVaE6hhFvw2RBADnQpaXtri7O3Q/9X+z+ZWPym2/T62A==;
From: Peter Marko <peter.marko@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][blacksail][PATCH] podman: set status of several CVEs
Date: Fri,  6 Nov 2026 22:22:35 +0100
Message-ID: <20261106212235.441977-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Nov 2026 21:23:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10161
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
index 161d0c6a..707ede83 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -32,9 +32,13 @@ PV = "6.2.0-dev"
 CVE_PRODUCT = "podman_project:podman libpod_project:libpod"
 
 CVE_STATUS[CVE-2019-10152] = "fixed-version: fixed since v1.4.0"
+CVE_STATUS[CVE-2019-10214] = "fixed-version: fixed since v3.0.0"
 CVE_STATUS[CVE-2020-1726] = "fixed-version: fixed since v1.8.1"
+CVE_STATUS[CVE-2022-2738] = "not-applicable-platform: RedHat specific issue"
+CVE_STATUS[CVE-2022-2739] = "not-applicable-platform: RedHat specific issue"
 CVE_STATUS[CVE-2022-2989] = "fixed-version: fixed since v4.3.0"
 CVE_STATUS[CVE-2023-0778] = "fixed-version: fixed since v4.5.0"
+CVE_STATUS[CVE-2025-4953] = "fixed-version: fixed in used buildah version"
 
 PACKAGES =+ "${PN}-contrib"
 
