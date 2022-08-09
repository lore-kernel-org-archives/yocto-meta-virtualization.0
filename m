Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1A1C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 16:34:38 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.14141.1660062874449110914
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 09:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fUN5VIqX;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id p10so14899414wru.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 09:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=8+rzSoqxCZpH9AHZJpcC3y1+mgbymWbpI6YCYtW9YjI=;
        b=fUN5VIqXqOasvLBkKP0ehpMCzN/cI/28avqxG2F2r1ByPvYRo9ec5yCCsvNQlkw+j6
         xmXBnh7phYHN/AeItAPz7HIXtqlic3a0kXxFcIp8yxqUj2eWOkPC5QiAHL/jJLeaSVod
         uAk4qHFDTQAC8kd5b22hC+u8+lCsOUolZ+i0xEt01f/YtKic92dFjxQvoEjdUCTVXqLX
         /rBhywm1ZGsXk67NbmP2+xtKT9HhAD1u+ld4tHOuN8C+8hwkRd8jQrt5ky+IaEohVOjL
         0whVbIeYJ94Qs2D4Zi7NryIVNU6h4w+uGFZ20ux2kPXQGnQrMy4c2KDmFZ1nzPWOs7Vv
         k2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=8+rzSoqxCZpH9AHZJpcC3y1+mgbymWbpI6YCYtW9YjI=;
        b=3PPeBCiqf5TMFFB89JI6zzQ4HJpexLOKVi9JEaTXb34TNuwWLCbKMfOZpvgbSlz8Yi
         cn1enI8YPgHz+VxQvANsEYytEFI4UuBbUDiSbVXrDeQcpHbmuEC7SK5HZpxXn4Us9Tpv
         ZIjsrJyUhOA0s7HdLKs+2oKKXHWrHgT5IQ30ui2oo8qXiomyzwCClKYBTaKPSEERW19c
         ic2clS1Z6zrenO9MWBtU10Bc4Qcws2388ri9pbG+jVoVm0lMboEebpzOMHzt83jvZP9v
         GV5/6WeCVjsl8bGQraVjgCsTmfY6u960sGn7bePjm79P7Otr0dsNHiVvs7jkJnzgAc2I
         VZmA==
X-Gm-Message-State: ACgBeo1QAvksRteMaFoyuzsYnmVAKP0P+aGTeeicN0QY2zhLT28Cw1nW
	8IL6WpcSUAmXCjXorVi4xZ8GDJkm5ng=
X-Google-Smtp-Source: 
 AA6agR6NrMmwPXguf2xiB179W/mS1YdU0d1yk9S274C9OnJaZk0Q17KowsWDruvXxzQZsY4HurBVJQ==
X-Received: by 2002:a05:6000:186b:b0:220:5bf8:a5e8 with SMTP id
 d11-20020a056000186b00b002205bf8a5e8mr14791927wri.328.1660062872480;
        Tue, 09 Aug 2022 09:34:32 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 b6-20020a5d6346000000b0022063e5228bsm13978116wrw.93.2022.08.09.09.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 09:34:31 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][kirkstone][master][PATCH] k3s: install the
 binaries in OE standard places
Date: Tue,  9 Aug 2022 17:34:19 +0100
Message-Id: <20220809163419.54694-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 16:34:38 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7509

This will change the instalation path from "${exec_prefix}/local/bin"
to "${bindir}", that in OE-core moves the binaries from the
"/usr/local/bin" to the default "/usr/bin" path.
Update the systemd services as well with the new "${bindir}" path.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 recipes-containers/k3s/k3s/k3s-agent.service |  4 ++--
 recipes-containers/k3s/k3s/k3s.service       |  4 ++--
 recipes-containers/k3s/k3s_git.bb            | 21 +++++++++-----------
 3 files changed, 13 insertions(+), 16 deletions(-)

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
index 7f9f549..a4973fe 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -37,7 +37,6 @@ GO_BUILD_LDFLAGS = "-X github.com/rancher/k3s/pkg/version.Version=${PV} \
                     -X github.com/rancher/k3s/pkg/version.GitCommit=${@d.getVar('SRCREV_k3s', d, 1)[:8]} \
                     -w -s \
                    "
-BIN_PREFIX ?= "${exec_prefix}/local"
 
 inherit features_check
 REQUIRED_DISTRO_FEATURES ?= "seccomp"
@@ -634,20 +633,19 @@ do_compile() {
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
+                install -m 755 "${WORKDIR}/k3s-agent" "${D}${bindir}"
         fi
 }
 
@@ -658,8 +656,7 @@ SYSTEMD_SERVICE:${PN}-server = "${@bb.utils.contains('DISTRO_FEATURES','systemd'
 SYSTEMD_SERVICE:${PN}-agent = "${@bb.utils.contains('DISTRO_FEATURES','systemd','k3s-agent.service','',d)}"
 SYSTEMD_AUTO_ENABLE:${PN}-agent = "disable"
 
-FILES:${PN}-agent = "${BIN_PREFIX}/bin/k3s-agent"
-FILES:${PN} += "${BIN_PREFIX}/bin/*"
+FILES:${PN}-agent = "${bindir}/k3s-agent"
 
 RDEPENDS:${PN} = "k3s-cni conntrack-tools coreutils findutils iptables iproute2 ipset virtual-containerd"
 RDEPENDS:${PN}-server = "${PN}"
-- 
2.37.1


