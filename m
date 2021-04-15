Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4246.1618475858219793514
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 01:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EACCA11FB;
	Thu, 15 Apr 2021 01:37:36 -0700 (PDT)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 605A83F694;
	Thu, 15 Apr 2021 01:37:36 -0700 (PDT)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH v2 2/2] podman: Added kernel modules for iptables error
Date: Thu, 15 Apr 2021 09:37:18 +0100
Message-Id: <20210415083718.19954-2-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415083718.19954-1-nathan.dunne@arm.com>
References: <20210415083718.19954-1-nathan.dunne@arm.com>

From: Nathan Dunne <Nathan.Dunne@arm.com>

Added kernel modules kernel-module-xt-masquerade and
kernel-module-xt-comment to RRECOMMENDS, to avoid iptables
errors with podman

Issue-Id: SCM-2355
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: If806a6802352b2658a695bf5265c1ead82fe3248
---
 recipes-containers/podman/podman_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 62ae024..6fb803e 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -109,5 +109,5 @@ FILES_${PN} += " \
 SYSTEMD_SERVICE_${PN} = "podman.service podman.socket"

 RDEPENDS_${PN} += "conmon virtual/runc iptables cni skopeo"
-RRECOMMENDS_${PN} += "slirp4netns"
+RRECOMMENDS_${PN} += "slirp4netns kernel-module-xt-masquerade kernel-module-xt-comment"
 RCONFLICTS_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'docker', '', d)}"
--
2.17.1

