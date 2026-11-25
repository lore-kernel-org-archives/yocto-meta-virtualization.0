Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3556.1795647522362951627
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 14:58:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=j8CzVDdH;
 spf=pass (domain: konsulko.com, ip: 209.85.216.42, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso5962629a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 14:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795647522; x=1796252322; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IH33APK6JeKKQoob0MIslT36c1y+dKW3FxODWljJ7xQ=;
        b=j8CzVDdHvxOdI293af+N8roo9wK7TKjdQj1TmxD6gfgBTNgcm0SHWhC5m7un/AQMbz
         hW/kQFDvbtQYVB8zcqsb3YxrG2ABRFphI83fj5azCL7M62CeddnxIq/9oV9AD423uv8o
         yu6I0fIaNXmGpxLLT+3xvdPTLYflnIiaX8ykw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795647522; x=1796252322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IH33APK6JeKKQoob0MIslT36c1y+dKW3FxODWljJ7xQ=;
        b=lfsEZ+phtDloJGVFmZze9lyQh4VRH25yqhN0pwvE15bi7SuhAXPP6ksiXwV76qVJ/o
         jcAUwiJaww4MNOy6VIjnlyRBKtWa/EbGM6rtPflN+jCBM+2mfQsuDeQa6F+AjaQ1E7w3
         X7hbmYfnAVygFghR//1HIOYC5OtV1a13724pdX9uH1uk0bnxwL5PWnA1rQVtxHCxKuE3
         /1WifNicblwuGIDrcClRC2eMR89/RGnQpmPBfsN0i3VXpx+d50nFC60ZSOLi8hplyGOD
         wjonPb1fsFCo6jDmkLRRbs3ORZtNhv6c3iHz8l2h1TJiaVCP0II7D2HNhdunMs6gBloR
         J78Q==
X-Gm-Message-State: APuU4Z/1BoZJbQsO+aKgxCpy7hKL2qMBUM2fVjsyR3NUv5SuM9160xRv
	zmSmBENSTHDnKoUM0j3HqvfB8HKYcuxj9Ya7P7mbs+A7NrujNv5TXt+vRLpXu1SIorzh+Ob7K2H
	rAhwhRZ8=
X-Gm-Gg: AZFdTZd+3XIGEV/apzqxi5rmfcURC5GkuXaUDIuob8jhvuNLIflIEomrFovr98dGa4h
	r1cWXuMuI07PXNmCI1EmwRdRZFMViSEqjZJ9LIZzLh8gRjzMLibPQEIthk4w7UbljLtg25rp8KL
	ayafIkTbtT4lplcF4SJXQNaMNPDLR2LqHM/1xx0djwo+uoNS5SycCEgYtCNVHPhzhTIIvdm53aV
	xaEIDA2eSCSb6gdD5KvBTMAwtYzd3LYzDODvM5pNVMX6V1XdCXQ6MWRTHdrhA9Rr1TGhO9M3Mqw
	MKUiZQEoR/sXcJu/TL76+BUAvIDLd6yCnZgdroSfPPGGRKPbb8XeeF7eO1HI8Y/xNK+ne5rNaru
	cr+SVvE6iH7fHbg3W8fS5ZYlYxawvyzImVSwOHF9HaKAhyqScNtj3u+B7HBwchtYcaZfYYytu3P
	KUF26Hq2VvlxT83Q/oqXR6B57cNYILQm0kAISRkSII3DIWq5I+QrVQOBa5m9woRlwMCRE2KzaKg
	k0f3g7K7Om5BmdyfpYKH+nNsGTEj4NSP08MWfV2DQORU+rRe6wVvZAaf0pMecRZfchB1GyE/GjN
	JzNj43mKDbPii2I87HcfM/0TK3VPhdcD5QgfJoPv62nh1rcHoGVUM8MWknoyd8aZLI09qv+JXaV
	Vx6Qzm/b8zhvIMm0Q9p4vsNDvnNljesq6wkHAuBAZ0liSs9g35G1Fgr5T/53RVJza2A==
X-Received: by 2002:a17:90a:d2cf:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b41c8e0507mr12143248a91.8.1795647521580;
        Wed, 25 Nov 2026 14:58:41 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from localhost (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm31962760a91.5.2026.11.25.14.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:58:41 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH v2 1/2] xen-rpi-u-boot-scr: fix UNPACKDIR
Date: Wed, 25 Nov 2026 14:57:08 -0800
Message-ID: <20261125225836.83743-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 22:58:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10186
Content-Type: text/plain; charset="utf-8"

Since oe-core:
f19ea21c8eb "bitbake.conf: set UNPACKDIR to just 'sources' and not 'sources-unpack'"
UNPACKDIR defaults to ${WORKDIR}/sources, so we can drop the redundant definition.

Since oe-core:
46480a5e66 "insane/do_qa_unpack: add checks that ensure S is set correctly"
S = "${UNPACKDIR}" is needed.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
v2: resend so the author is tim.orling@konsulko.com (v1 arrived as ticotimo@gmail.com)

 .../recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
index 3f83c7f8..e25963ad 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
@@ -24,8 +24,7 @@ do_compile() {
 
 inherit kernel-arch deploy nopackages
 
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
+S = "${UNPACKDIR}"
 
 do_deploy() {
     install -d ${DEPLOYDIR}
-- 
2.56.1

