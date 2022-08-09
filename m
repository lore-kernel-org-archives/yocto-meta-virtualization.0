Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE074C3F6B0
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 12:16:37 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.11242.1660047392635816433
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 05:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jeJNV7EA;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 ay36-20020a05600c1e2400b003a4e30d7995so8856946wmb.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=+aR5WKhzOk+ebzoxw96ASPjt4gAAdN8ptAxMN/kVfsQ=;
        b=jeJNV7EAnVSBA3RRaCZYEQOwqB8jTLxlWq9e7iH4RKd2RC7x8l3HqZu7iIkFW+tv6w
         OBQnQrrzRAVRhwqc5FzOOJ0zxpVjbDEAmrJ0rmgzBr1YPoqCEK0jSS72B/5LogXLzX87
         O7zy0+8byhmgO9qOpLFjgluh7tF6eRit5TetkN1LuArtQ3oCQ13kLbgRXGVh5bcY/7pW
         YgYaQNM6MWBPVkHYjwhHaNAxLK0wiA5O6hh0/VmyJAVX/ds+hP9p8onmU2Y0qFT7Jutm
         FHo09tDJLuY+/irnjnQVuVrVNI/VD6d69v6HCDp0aSmoToR9JARy5KM7PcMDCaruS8LE
         q0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=+aR5WKhzOk+ebzoxw96ASPjt4gAAdN8ptAxMN/kVfsQ=;
        b=dv0yA7R1iTlvX/YTePVhg8N6QNdsDslWVQ0js/RYprk/TUYlYOT/lukCd8XJcFrAep
         CKv8FI/FY9AncaUCH48CZJDJ06Lukr6vK1VNHDP1KGrfNXwmo+eNJs4N0q/81Q9rxPDf
         Sr6i+oLT7UZ4ENOFUovVd/haBh9EmiKYPbS8yedrfMDBgP7cV667oOjYvsPXk+piosCd
         fAf6yHmwpdKo8oxLYvoSYoAQ+MdrAqgonIdktlRuCBbrY1YizyJpHDXHKnoLwMhcnJQn
         89wrAKdzxvETuBZU3lPAYOrFxuDLAe47lgwuNMbpe1tO8BJXGmVu7ecXbBXm2PBcfcRl
         YIIQ==
X-Gm-Message-State: ACgBeo2xlyPyxmn9KY7NjLvNAeGj5GTXrngLvh5MpiXz5QKNWewQgVZa
	F1sBeDUHMQQ7zjCCYmuKF8MXC5xV1lc=
X-Google-Smtp-Source: 
 AA6agR5JXa4BBZ0PB4ytcTO8vey+VF7ohvzPS/NNz9WSNa/pQt9FwGPaHLDdFDzQqm9PbtnucwW2ig==
X-Received: by 2002:a05:600c:3ac6:b0:3a5:26c7:c69e with SMTP id
 d6-20020a05600c3ac600b003a526c7c69emr10727062wms.196.1660047390685;
        Tue, 09 Aug 2022 05:16:30 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 n17-20020a7bc5d1000000b003a52969e89csm11178908wmk.4.2022.08.09.05.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 05:16:30 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][kirkstone][master][PATCH 4/4] k3s: install the
 binaries in OE standard places
Date: Tue,  9 Aug 2022 13:16:19 +0100
Message-Id: <20220809121619.32258-4-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809121619.32258-1-jose.quaresma@foundries.io>
References: <20220809121619.32258-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 12:16:37 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7498

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 recipes-containers/k3s/k3s/k3s-agent.service |  4 ++--
 recipes-containers/k3s/k3s/k3s.service       |  4 ++--
 recipes-containers/k3s/k3s_git.bb            | 22 +++++++++-----------
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/recipes-containers/k3s/k3s/k3s-agent.service b/recipes-containers/k3s/k3s/k3s-agent.service
index 9f9016d..0792970 100644
--- a/recipes-containers/k3s/k3s/k3s-agent.service
+++ b/recipes-containers/k3s/k3s/k3s-agent.service
@@ -21,6 +21,6 @@ Restart=always
 RestartSec=5s
 ExecStartPre=-/sbin/modprobe br_netfilter
 ExecStartPre=-/sbin/modprobe overlay
-ExecStart=/usr/local/bin/k3s agent
-ExecStopPost=/usr/local/bin/k3s-clean
+ExecStart=/usr/bin/k3s agent
+ExecStopPost=/usr/bin/k3s-clean
 
diff --git a/recipes-containers/k3s/k3s/k3s.service b/recipes-containers/k3s/k3s/k3s.service
index 33d3ee7..647fc66 100644
--- a/recipes-containers/k3s/k3s/k3s.service
+++ b/recipes-containers/k3s/k3s/k3s.service
@@ -29,9 +29,9 @@ RestartSec=5s
 ExecStartPre=/bin/sh -xc '! systemctl is-enabled --quiet nm-cloud-setup.service'
 ExecStartPre=-/sbin/modprobe br_netfilter
 ExecStartPre=-/sbin/modprobe overlay
-ExecStart=/usr/local/bin/k3s server
+ExecStart=/usr/bin/k3s server
 # Avoid any delay due to this service when the system is rebooting or shutting
 # down by using the k3s-killall.sh script to kill all of the running k3s
 # services and containers
 ExecStopPost=/bin/sh -c "if systemctl is-system-running | grep -i \
-                           'stopping'; then /usr/local/bin/k3s-killall.sh; fi"
+                           'stopping'; then /usr/bin/k3s-killall.sh; fi"
diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
index 7f9f549..f8595df 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -37,7 +37,6 @@ GO_BUILD_LDFLAGS = "-X github.com/rancher/k3s/pkg/version.Version=${PV} \
                     -X github.com/rancher/k3s/pkg/version.GitCommit=${@d.getVar('SRCREV_k3s', d, 1)[:8]} \
                     -w -s \
                    "
-BIN_PREFIX ?= "${exec_prefix}/local"
 
 inherit features_check
 REQUIRED_DISTRO_FEATURES ?= "seccomp"
@@ -634,20 +633,20 @@ do_compile() {
 }
 
 do_install() {
-        install -d "${D}${BIN_PREFIX}/bin"
-        install -m 755 "${S}/src/import/dist/artifacts/k3s" "${D}${BIN_PREFIX}/bin"
-        ln -sr "${D}/${BIN_PREFIX}/bin/k3s" "${D}${BIN_PREFIX}/bin/crictl"
+        install -d "${D}${bindir}"
+        install -m 755 "${S}/src/import/dist/artifacts/k3s" "${D}${bindir}"
+        ln -sr "${D}${bindir}/k3s" "${D}${bindir}/crictl"
         # We want to use the containerd provided ctr
-        # ln -sr "${D}/${BIN_PREFIX}/bin/k3s" "${D}${BIN_PREFIX}/bin/ctr"
-        ln -sr "${D}/${BIN_PREFIX}/bin/k3s" "${D}${BIN_PREFIX}/bin/kubectl"
-        install -m 755 "${WORKDIR}/k3s-clean" "${D}${BIN_PREFIX}/bin"
-        install -m 755 "${WORKDIR}/k3s-killall.sh" "${D}${BIN_PREFIX}/bin"
+        # ln -sr "${D}${bindir}/k3s" "${D}${bindir}/ctr"
+        ln -sr "${D}${bindir}/k3s" "${D}${bindir}/kubectl"
+        install -m 755 "${WORKDIR}/k3s-clean" "${D}${bindir}"
+        install -m 755 "${WORKDIR}/k3s-killall.sh" "${D}${bindir}"
 
         if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
                 install -D -m 0644 "${WORKDIR}/k3s.service" "${D}${systemd_system_unitdir}/k3s.service"
                 install -D -m 0644 "${WORKDIR}/k3s-agent.service" "${D}${systemd_system_unitdir}/k3s-agent.service"
-                sed -i "s#\(Exec\)\(.*\)=\(.*\)\(k3s\)#\1\2=${BIN_PREFIX}/bin/\4#g" "${D}${systemd_system_unitdir}/k3s.service" "${D}${systemd_system_unitdir}/k3s-agent.service"
-                install -m 755 "${WORKDIR}/k3s-agent" "${D}${BIN_PREFIX}/bin"
+                sed -i "s#\(Exec\)\(.*\)=\(.*\)\(k3s\)#\1\2=${bindir}/\4#g" "${D}${systemd_system_unitdir}/k3s.service" "${D}${systemd_system_unitdir}/k3s-agent.service"
+                install -m 755 "${WORKDIR}/k3s-agent" "${D}${bindir}"
         fi
 }
 
@@ -658,8 +657,7 @@ SYSTEMD_SERVICE:${PN}-server = "${@bb.utils.contains('DISTRO_FEATURES','systemd'
 SYSTEMD_SERVICE:${PN}-agent = "${@bb.utils.contains('DISTRO_FEATURES','systemd','k3s-agent.service','',d)}"
 SYSTEMD_AUTO_ENABLE:${PN}-agent = "disable"
 
-FILES:${PN}-agent = "${BIN_PREFIX}/bin/k3s-agent"
-FILES:${PN} += "${BIN_PREFIX}/bin/*"
+FILES:${PN}-agent = "${bindir}/k3s-agent"
 
 RDEPENDS:${PN} = "k3s-cni conntrack-tools coreutils findutils iptables iproute2 ipset virtual-containerd"
 RDEPENDS:${PN}-server = "${PN}"
-- 
2.37.1


