Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759A1FF8867
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 01:13:33 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2304.1777338810373028025
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 18:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=McXVCHl7;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so7171754a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Apr 2026 18:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777338809; x=1777943609; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FAeusAsmOzZ5g1FW0zak5QOv6xGZ6Hq3LLvF0aR4UAw=;
        b=McXVCHl7oUbbEg1Zv7MdJq4Q/Hvpow6eHTQbvIsPj0VvK9nI7VWT60lb3CsWrMXIqC
         a/UjJuLUB0EptNQjCNeP/IxdigKXXVsVWSvYaNcNhpzZtfv1Nl45iXJJlh1zX74NSKK+
         XKIhkXgbNEBVdjFDgiyeRqARWLpp8AZJirbpsA/aJFojSn97diXZ7JWcbEN9c4Zd+YOo
         9UQuE4d7kgTQA8nN+w7V3riA12AWiUqOD1ScNHXs5PJdKdwTEIrBbQymQvawg57bfWGi
         d6ey1/eo8TzTadCNBWSNEotoJMoN9PIhm7Xsu1QYqfpcH2lvdRFG3K5MIz7NymdeR27v
         Ol/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777338809; x=1777943609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAeusAsmOzZ5g1FW0zak5QOv6xGZ6Hq3LLvF0aR4UAw=;
        b=osh8C/gWFCUPTzWoqgd+zSu1XqjPy9KmKOtqFrB+l5G4U5Rbl98NuTIDxnLYkrYrpQ
         dUxWM73FWA4NuW3wRLqblTAs+6yXV0sgYEsJGe31AmxsHo5KKMBJUBoaZ55Z+5/c++sF
         7VzQim4hkL7c5hRhCXvKbKVbvZaQ/NhxxWEgnxQWyISVCLmxkyiiyN9lsENfW+LLl7zj
         oApuUayc5Aa4eZ1OCSfEliJI5JCbj1tJ1AF6ZCRffxrrHAWlZtqyin9iG8Y4ujX4Se/L
         0fBZIyrOTZLYQeV0nHpGb0yRu0wEnG6oUWxhTOjgtDKqFvulfifk1+9DnVWDVoEj+VlO
         9XKA==
X-Gm-Message-State: AOJu0YxQt/UwoaFgpLjGDXKl2HvJE/DY+Uk6/Wk4pyaW7mNtzgUZrxF5
	w3KXUgZBBgZy8sb4hhczuNZjpYcb0142jt8ZJ2qgjmR3JO82NsJiq9rWS32L//Lt
X-Gm-Gg: AeBDietXn0SAViG8AaWkMxMe3Q3F30YbiYUcuqHuv/ZjYTcjFRETcVIeOzpgvyazUVc
	IMeTpcZejPMlEb6hTmhr0MktiDlzoJyI/ISd+YUUBytOcYrp4fAMWmV212oz/+P3KJcyXEwf5ly
	e49/tgKKmhwqyl0y+0TQ1HlSSS3Y4EtUVZhdogEBikNZmviw1jRvZmZ/9VkiO6f1evap1PPZYdB
	3vPLcS3g7M3+xLJJVCunLb6oNbsKrFnGyNB/1wDN3broVzsWT6jeaxjJlbluSkAv+QYhzG+rayp
	WiDAjzq/LsiSKrFcOcf8H+2UVh/eQtmevDFq7xO43YmmXB/k0LPuHpxeZeFSR8KuC/fhbWPB910
	RTneQX0g0VZrcnIuERKqlQZdgfmcvgsjJBXtqKFJCU2ArI87l8k8Bq1hAJ5f95S5q/SHm3xgQ1L
	JO/6fZH/XBD/oajJTujtDnG1OTvQM+XwyV6aBEZzo+JdUbFXmm6qkhqO3VQMSNzDaO9WvDnnfmi
	fhxPDkJFF5cSyvmrA8Z7gbncM3yr+BrOgmU48ZMTTC3
X-Received: by 2002:a17:90b:2552:b0:35e:b017:da6a with SMTP id 98e67ed59e1d1-36491c55485mr1017215a91.0.1777338809003;
        Mon, 27 Apr 2026 18:13:29 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490035847sm854772a91.7.2026.04.27.18.13.27
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Apr 2026 18:13:28 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [RFC PATCH 0/4] Initial functional vcontainer --config feature for CI auth
Date: Mon, 27 Apr 2026 18:13:10 -0700
Message-ID: <cover.1777337030.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 01:13:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9749

This is an initial attempt to share a new feature for vcontainer which
mounts credentials (e.g. ~/.docker/config.json or podman's auth.json)
into QEMU as a 9p mount. This avoids some ugly hoops we would have to
jump through to pass the credentials with --password-stdin.

This series was heavily reliant on Claude Cowork, and hence is a bit
verbose in places. I chose to share it as is (and as tested) for this
initial RFC.

The tests (test_vcontainer_auth_config.py) all pass in a local Yocto
AutoBuilder test run.

The feature itself was also tested on a local Yocto AutoBuilder
'containers-library' run which successfully pushed a 'python' container
to registry.yocto.io[1] and quay.io/yocto[2] with the "Robot Account" or
equivalent credentials.

Once we agree upon a functional state of this patch series, the changes
for yocto-autobuilder2 and yocto-autobuilder-helper can be shared in a
meaningful way, since they are dependent upon this feature.

[1] https://registry.yocto.io/account/sign-in?globalSearch=library
[2] https://quay.io/repository/yocto/python?tab=tags

Tim Orling (4):
  vcontainer: add --config / VDKR_CONFIG for docker/podman auth
    credentials
  tests: add vcontainer --config / VDKR_CONFIG auth plumbing tests
  vcontainer-initramfs-create.inc: depend on virtual/kernel:do_deploy
  vcontainer-tarball: fix SDK environment script for CI

 .gitignore                                    |   1 +
 recipes-containers/vcontainer/README.md       |  54 ++
 .../vcontainer/files/vcontainer-common.sh     |  18 +
 .../files/vcontainer-init-common.sh           |  54 ++
 .../vcontainer/files/vdkr-init.sh             |  58 ++
 .../vcontainer/files/vpdmn-init.sh            |  61 ++
 .../vcontainer/files/vrunner.sh               | 147 ++++
 .../vcontainer-initramfs-create.inc           |  19 +-
 .../vcontainer/vcontainer-tarball.bb          |  69 +-
 tests/test_vcontainer_auth_config.py          | 642 ++++++++++++++++++
 10 files changed, 1106 insertions(+), 17 deletions(-)
 create mode 100644 tests/test_vcontainer_auth_config.py

-- 
2.50.1 (Apple Git-155)


