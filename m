Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web09.683.1579130982966232025
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2020 15:29:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=j5KmJp/Z;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch [31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id AE3685C68A7;
	Thu, 16 Jan 2020 00:29:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1579130980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ulTQFgWEtSUxXRPNaNK4BoSqFVcVJoO7bEodiftgTW0=;
	b=j5KmJp/Zv9lcA9q0Ft5H2KbD0yBgPV8zYZXIdXbHRCnskfmu4xithT0w1nlcePCTQwunKG
	9NEf8GIRDbmaqx3nTMZWLK/VFU7RuxFdI1ZelSrC/jMZDe6qLqtCdqVLqr30hK6LSYN4IX
	flC6g2fcWA1dy4aQzwW4X5XEQ/+xg44=
From: "Stefan Agner" <stefan@agner.ch>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan@agner.ch,
	timothy.t.orling@linux.intel.com,
	Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-virtualization][PATCH 2/2] podman: bump to latest release 1.7.0
Date: Wed, 15 Jan 2020 23:29:36 +0000
Message-Id: <20200115232936.23207-2-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115232936.23207-1-stefan@agner.ch>
References: <20200115232936.23207-1-stefan@agner.ch>

From: Stefan Agner <stefan.agner@toradex.com>

Bump to latest podman release 1.7.0. It features improvements to
networking, podman play kube, and systemd unit file integration.
They have also added the podman system reset command, to remove all
existing containers, pods, images, and volumes and reset the system
to its initial state.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/podman/podman_git.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index e73c028..5db9ed2 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -24,7 +24,7 @@ python __anonymous() {
         raise bb.parse.SkipRecipe(msg)
 }
 
-SRCREV = "f3ffda1e08f19e9a6a88484136b5eed76533f21a"
+SRCREV = "b7ce1157b00af09f4a09e39b377aa3abff46ee05"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=master \
 "
@@ -36,15 +36,14 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-PV = "1.6.2+git${SRCREV}"
+PV = "1.7.0+git${SRCREV}"
 
 PACKAGES =+ "${PN}-contrib"
 
 PODMAN_PKG = "github.com/containers/libpod"
-BUILDTAGS ?= "seccomp varlink remoteclient \
+BUILDTAGS ?= "seccomp varlink \
 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-exclude_graphdriver_btrfs exclude_graphdriver_devicemapper \
-containers_image_ostree_stub"
+exclude_graphdriver_btrfs exclude_graphdriver_devicemapper"
 
 # overide LDFLAGS to allow podman to build without: "flag provided but not # defined: -Wl,-O1
 export LDFLAGS=""
-- 
2.17.1

