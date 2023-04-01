Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06B5C761AF
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 23:38:14 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.34962.1680392289391337047
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 01 Apr 2023 16:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=gJnP+HpB;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id ew6so103725853edb.7
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 01 Apr 2023 16:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680392287; x=1682984287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YOwJadN8pD3tDmt+kAWRwuEzNmw+7s3grL25oZ90KRw=;
        b=gJnP+HpBHJuFNSZlCklWw5yUVRneipLQq3mr1nC6yNn4n9YU9z+hXhaZ5QXOz7bJbQ
         /MamJPMjyLiVAnkS/OVUTIWMpegrdXxPBDERNSn54xeHvW0rUiOBx584rLN0xIUpzy5c
         TciJBtPx3D3HxOiXGTVwUZWORvsiXIgsIzcd8vrejQqZ/crJqgLeNt6XwdbuH7Tr7Wjh
         r472JV27F0YhiFBlUaiTY7bD0CSQGCjNs7NT76yxjJq5Zfk6myH/pNPM1FKeceXugNFj
         ND+RPGAjCC1RhNyeKS5EGoOil9iMWOCEklwZhN4Og418xJD6ukMSmtLtWvbTSylP9IBk
         Qirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680392287; x=1682984287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOwJadN8pD3tDmt+kAWRwuEzNmw+7s3grL25oZ90KRw=;
        b=bxACpvKdY5ufRWIFCNWnXeAzd4MBBDyikH0LnjESW+Cm/YhB3t1fOGzjWID3VWIOFP
         PzH7jhCzlIS0HA3zEUnKvGn7ll/U8oAeUQ4o6NrDX0lTHOpVHdPsFgZD/KS55qFkfRFe
         PwW7B4q4h7OS9olPgTBikLJ/fhVeCxuLg+Mkm/GF5JZk+THFWhHuHsiL3PLacW2J9G8x
         Dwn3nMaXAJXtqgcRIaAGtDBAPyaNFw6HlwOwMkiGPzsf+mysD71pvzHDC4mUfZ4ofGEo
         I3/0/HZglK9W9OM4v9rZPe+iPAfuklo8QubKCxKMUEX0kgxi3c+4R8NwWrayH4WM7zew
         vjVg==
X-Gm-Message-State: AAQBX9epGESsCpsrCuNeDPSAVMpUE4yd5ffUd8AAC8jcPFicJ4WstLMx
	OPkM3OEkagiNA2dIour46iSnY69V4SY=
X-Google-Smtp-Source: AKy350ZnoIpnihQdwfauSkv2elWNGs0biOaYnptbBX39BCJ+7cwszjBmgF2Pv6eqWQ85To1ysyciHQ==
X-Received: by 2002:a17:906:fb08:b0:8b1:2d0e:281 with SMTP id lz8-20020a170906fb0800b008b12d0e0281mr33020134ejb.18.1680392287304;
        Sat, 01 Apr 2023 16:38:07 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u19-20020a17090657d300b00905a1abecbfsm2577198ejr.47.2023.04.01.16.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 16:38:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] aardvark-dns, netavark: add seccomp to REQUIRED_DISTRO_FEATURES
Date: Sun,  2 Apr 2023 01:38:00 +0200
Message-Id: <20230401233800.3053681-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 01 Apr 2023 23:38:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7978

* because of runtime dependency on slirp4netns

* fixes:
ERROR: Nothing RPROVIDES 'slirp4netns' (but meta-virtualization/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb RDEPENDS on or otherwise requires it)
slirp4netns was skipped: missing required distro feature 'seccomp' (not in DISTRO_FEATURES)
NOTE: Runtime target 'slirp4netns' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['slirp4netns']
NOTE: Runtime target 'aardvark-dns' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['aardvark-dns', 'slirp4netns']
NOTE: Runtime target 'netavark-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['netavark-dev', 'aardvark-dns', 'slirp4netns']
NOTE: Runtime target 'netavark' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['netavark', 'aardvark-dns', 'slirp4netns']
NOTE: Runtime target 'aardvark-dns-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['aardvark-dns-dev', 'slirp4netns']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/aardvark-dns/aardvark-dns.inc | 4 ++++
 recipes-containers/netavark/netavark.inc         | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/recipes-containers/aardvark-dns/aardvark-dns.inc b/recipes-containers/aardvark-dns/aardvark-dns.inc
index 70c94dd..8c74439 100644
--- a/recipes-containers/aardvark-dns/aardvark-dns.inc
+++ b/recipes-containers/aardvark-dns/aardvark-dns.inc
@@ -16,6 +16,10 @@ do_install_ptest () {
 	cp -r ${S}/test ${D}${PTEST_PATH}
 }
 
+# Rdepends on slirp4netns
+inherit features_check
+REQUIRED_DISTRO_FEATURES ?= "seccomp"
+
 RDEPENDS:${PN}-ptest += " \
     bats \
     bash \
diff --git a/recipes-containers/netavark/netavark.inc b/recipes-containers/netavark/netavark.inc
index 1127adb..c15bbea 100644
--- a/recipes-containers/netavark/netavark.inc
+++ b/recipes-containers/netavark/netavark.inc
@@ -8,6 +8,9 @@ PACKAGECONFIG ?= "aardvark-dns"
 # netavark will be functional without it.
 PACKAGECONFIG[aardvark-dns]= " , , , aardvark-dns"
 
+# Rdepends on aardvark-dns which rdepends on slirp4netns
+inherit features_check
+REQUIRED_DISTRO_FEATURES ?= "seccomp"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.40.0


