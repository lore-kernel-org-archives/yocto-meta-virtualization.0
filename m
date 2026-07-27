Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB19C53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 00:21:49 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20887.1785111705398828651
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 26 Jul 2026 17:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UEWoK+Mg;
 spf=pass (domain: konsulko.com, ip: 209.85.214.179, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cedda2ce6fso17802565ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Jul 2026 17:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785111705; x=1785716505; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SBvrunxZRhpovWqdcYRCz11Nw9tX2h96OV+zzoJTfMA=;
        b=UEWoK+Mg/nodanjyG5/5GSu6NQWBmt197C6TbPBsZUUWYJ63H05h2LhHdcf9A86mfS
         iLHMXk3GiniIXvYDd3f30nS0xmuVR8JOlQFCrUGqmdEhYbusyF0UDKcU0ui/aBNesYPS
         Ym9Ynrk11aXnFOw3AR7TigXaRYi8vksRW1xZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785111705; x=1785716505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SBvrunxZRhpovWqdcYRCz11Nw9tX2h96OV+zzoJTfMA=;
        b=K7xRJZIYOELnuZD8NJCX4tAg+PAjZsVHMpq39jAmI5vsqNxVj/2LJeyXt3ByeKPnAK
         gYdz8Q0Cfsa3Py/lIStCt31Zq13NUfS+WCbOMQv59hTCDMR1BvA0zHgN+XVyU5V0T/D4
         riQm1Dm2SUYRbASt2j1VW4PdcjiVYA1Bwc1mqPYvTMLa8jnnNpdJnCjCJ9Y4+43LqEvv
         PVF/7eYPAHOQYvJULq0ycUqHqUjchw+HPIrJLOt5eOkzFucvxqeNis/ALxf50mGOxY9M
         eD5bbktE0/17CtXR4Grlqi+++8Mk7vCW5BUDC9lp3e/MHoBBmA/qkY7Li9CDpTg+d4Ym
         9DqA==
X-Gm-Message-State: AOJu0YxUz0ETFOTokhNlDdtLTLspOsp6F3h0EZ0fKr2UrcDzrHmNU/wc
	mUnJ4yjl0b4S2gQyh3285mg+KAIF5I0dZGUr2v/Cpn5wr/0ktbJDaqFRSiBGa63p9cs1bwoKyJt
	VlfQ6
X-Gm-Gg: AR+sD108uI1MBK2VzXY2cNT6lpuKIPq+2FalI+KZF/l1qRH6KHbtlNmQv/CR8CO+YDb
	u41VccIzyQT/okzB5QAfUwY2yrfu/L8GA8Yt48Zb6pDBhaTRDHNfNEv86l2HFDdOysm8RDsHTDu
	dh2b3c4al9GwIWpReTwS/cXTn9Mqqe0O1ZRbKHSugGRqwOacnYagNW1TQNYi7jgN0d6ULib8aj8
	n487hk1jS0lLdk3Z42YRqUYpXOa+ZZU5/P2IVYZYY16r4OlXMXmeFdI3PfURmKgNTm6ybnPkdsM
	A3tBqtBx5NjmIurCC5RQIgLIMOnUDaPW/D+ZBvBnBAdU59eIXNz6Bl8EmKnyGerbKYy22a/toQ0
	1Y07V9gioO//ZBAYHlVRDiVcCbGkTQzxazZO7xv5BCpUfmwgj5ietmD9w+wR+ORb+WZZOeZPCpA
	/nfTWEmNE3rLVdBBGf7qdycGOpGmTy3Q==
X-Received: by 2002:a17:903:3d06:b0:2c9:c18f:7446 with SMTP id d9443c01a7336-2cfde8473b0mr57921985ad.27.1785111704492;
        Sun, 26 Jul 2026 17:21:44 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:4c93:d927:aa69:60a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc4f4sm25238035ad.39.2026.07.26.17.21.43
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:21:44 -0700 (PDT)
From: tim.orling@konsulko.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH 0/3] Improve reliability of vcontainer-tests
Date: Sun, 26 Jul 2026 17:21:31 -0700
Message-ID: <cover.1785110917.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Jul 2026 00:21:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9986

From: Tim Orling <tim.orling@konsulko.com>

Running the tests locally highlighted some issues -- including
timing issues -- with additional timing sensitivity highlighted
on the Yocto Project autobuilder [1].

The full test suite, without memres passed on local host Debian 13.6 (trixie):

pytest tests/test_vdkr.py -v \
  --vdkr-dir /tmp/vcontainer \
  --oci-image .../build/tmp/deploy/images/qemux86-64/app-container-curl-latest-oci

With these changes, the test suites pass on the Yocto Project
autobuilder [2].

[1] https://autobuilder.yoctoproject.org/valkyrie/#/builders/118/builds/6
[2] https://autobuilder.yoctoproject.org/valkyrie/#/builders/118/builds/7

The following changes since commit a4987f0af6f30883e1dcd52cec66311343241d6f:

  grub-efi: Ensure changes only apply with the selected DISTRO_FEATURES (2026-07-21 12:41:02 +0000)

are available in the Git repository at:

  https://github.com/moto-timo/meta-virtualization contrib/timo/vcontainer-tests
  https://github.com/moto-timo/meta-virtualization/tree/contrib/timo/vcontainer-tests

for you to fetch changes up to 76663da09cf268817d875971c8fd11cf4820ed96:

  tests/conftest.py: memrest_stop timeout=120 (2026-07-26 16:48:47 -0700)

----------------------------------------------------------------

Tim Orling (3):
  vrunner: add /sbin,/usr/sbin to PATH
  vrunner.sh: fix daemon_stop() shutdown reliability
  tests/conftest.py: memrest_stop timeout=120

 recipes-containers/vcontainer/files/vrunner.sh | 11 ++++++++++-
 tests/conftest.py                              |  4 ++--
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.47.3


