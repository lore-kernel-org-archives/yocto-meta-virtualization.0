Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802E1C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:13:41 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156202.1783358018240692336
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2026 10:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IR5eBqgQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8478fe07f65so3365976b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 10:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358018; x=1783962818; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vex0IwJq7/t3LMyTxkbegxtU/8lg96VCn5S6F3Nyx6A=;
        b=IR5eBqgQD5PWyute5m8OrS8wMMmiS18x0CcBFF6Rd5NFFxJ4GYh0XH/D7ykvmoMbRE
         ndjTpHbon3U6v9cElbqkq68vYpCmeCmttdwhWCDn36DrRqsT/fkewrWm2PNKoeinysrT
         4OOLL3/fflq36qsEDL8OSrnEdi7JHgbZRN1AvpPlncJmO8+8yzilVMR2xNr+MGd+tj3w
         6oRh4/EXdXEQivIBnz7Op/1RFm9/qCdBrXqw18XjTVNzQ5CbRxp6JtUgrVNV3Xjir4Cg
         NhlN3MmZx44wDZaDbre7HBXdJsazbRMOifIYBDoF4lxiImObhKln7EdtuNGvFfSIwS9N
         PqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358018; x=1783962818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vex0IwJq7/t3LMyTxkbegxtU/8lg96VCn5S6F3Nyx6A=;
        b=DX+E/cSVNBaCXulcU+oLI1wgmlcRuJwmRL8lSz1DROVZ8eQyYV8e9hb3khYwB+SslF
         EHWVUtU7vPWpcBhM0DLCRtMkFBdQOx0EP7xg1Tz/z30QDJlvc2PK31fhtsVnppXjftD+
         5FFpn9Dcv73fzNhRyWit/NDpYz2ES+g11TmyK1sybmV8MA2lrr1y3B9gUviYXvT88r9K
         yy6f3qx+KQqY+HMt39uzlXdxrxO4VARXBRjTLrEKU7n264zqUKaK44f78owm9o8CP+Ew
         7cCIfyIK5zrbRTTdd5CCwpUwUaGcukgtAOPVmPEuL8rY1fo0KR+thjQhB8dnsdIMLQ7B
         WXnQ==
X-Gm-Message-State: AOJu0YyPwrYl/fs+GJ9MCceCXlTSfu09kOfMnwzkzooIpGvpaEgpfJzN
	/8ttZ7CuGihhFdIJM7j035rYuCkp36xKnCFaK1jAdEYr5mDvofZnzcHAXVpKKg==
X-Gm-Gg: AfdE7cnM6sWL+dkhse+o5YK608a6apqxCC3y+0ETbJheF6U7u8nhKjmbZlTTgOpuTfC
	JflQRKmbaHzD8iySnRfRQX4fmLo9m9YWJs/fVShDc1DfS95OVUWbTHpZ9aglhEL8JdI4L6UImUP
	PaPxUaXh+jE1tbDi4FGM5ns+HFZC46HH1O4YBORjPpcx9THDjISN8X3dcp9fxbhSYgKuKH/nWPN
	37eodFxip/3uMwlnbhoJ6UM1yGJyVIwM6FHH7nK1npx7XOknVlHhuu1XXe8wDl8vvHQ9wX9uUhw
	yivQeWmIFjvB/D1kvRsMGJdQUbFSF8zEwJq9rsEI50ghyWMyclZ1mtR/ve2gKAqnESdIppPtqXl
	s03khrYySROd7GsqTdB3Ccn3M8u5/jxLSTcum2fS9I3A1hI53e4FeESLe8W6dk1Dz6N9TVl6wxe
	nixOf3htwtp0awrWd4kwaJYea1bVYSItNqdEvw4mfM1ZZ0HnL+R+wvHG9H7oNTTEXBANVjpv7q5
	MwkuMJHmDDu
X-Received: by 2002:a05:6a00:4612:b0:845:e34d:f226 with SMTP id d2e1a72fcca58-84826c23f24mr1446308b3a.16.1783358017337;
        Mon, 06 Jul 2026 10:13:37 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bd1078sm4121873b3a.24.2026.07.06.10.13.34
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 10:13:35 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH v2 00/13] Container Improvements
Date: Mon,  6 Jul 2026 10:12:35 -0700
Message-ID: <cover.1783356922.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780104071.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 17:13:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9924

This series:
  * Sets OCI_IMAGE_RUNTIME_UID with ??= weak assignment in
    image-oci to allow container-nonroot-user to set a different
    default
  * Adds a class to create/run containers with a non-root user
  * Adds a class to create non-volatile var log and tmp directories
  * Adds a class to enable 'dev' mode where the container starts as
    the root user
  * Adds new containers:
    - app-container-python
    - app-containter-mosquitto
    - app-container-valkey
    - app-container-nginx
  * Modifies app-container-curl to be more like the upstream
    experience (and more like the above containers)
  * Allows mosquitto and libwebsockets to be parsed for
    vcontainer distro so we can build multiarch containers
    for app-container-mosquitto.
  * Allows meta-webserver/recipes-httpd/nginx to be parsed for
    vcontainer distro so we can build multiarch containers
    for app-container-nginx.
  * Adds a fix for buildbot-venv shadowing for environment-setup-ci
    script

The resulting containers were tested with simple command line
usage compared to Docker provided equivalents to ensure the
same expected behavior.

Changes in v2:

  There were a fair number of changes in v2 in reponse to review
  comments and observations during testing.

  * image-oci.bbclass:
    - set OCI_IMAGE_RUNTIME_UID with ??= to allow other classes
      to override
  * container-nonroot-user.bbclass:
    - set EXTRA_USERS_PARAMS with +=
    - added comments to clarify the PYEOF Python heredoc behavior
    - added logic to detect $image_name/index.json and fail if not
      found
  * container-volatile-fixup.bbclass: avoid repeating the same
    rootfs postfunc by adding a helper class
  * container-dev-mode.bbclass: avoid repeating the same logic
    to run container as root user in '-dev' mode
  * app-container-python (and other container image recipes):
    - drop now redundant IMAGE_INSTALL lines
    - simplify by inheriting container-volatile-fixup
    - inherit container-dev-mode
  * app-container-mosquitto:
    - verify '-dev' mode switches from root user to mosquitto user
    - verify "production" mode runs as 'nonroot' user
    - fix bbmask to allow mosquitto and required libwebsockets
  * app-container-valkey:
    - added tini and container-entrypoint.sh, like upstream containers
  * app-container-nginx:
    - fixup 'nonroot' user ownership of NONROOT_OWNED_DIRS
    - fix bbmask to allow nginx (but not other recipes-httpd)
  * fix for older distro hosts where the 'websockets' Python library is
    not new enough (>10.0) and on the AutoBuilder needs to use 'buildtools'.
    The PATH in environment-setup-ci now plays properly with such a set up
    by no longer added /usr/bin and /bin before existing $PATH.

Successful build https://autobuilder.yoctoproject.org/valkyrie/#/builders/117/builds/25

Tim Orling (13):
  image-oci: set OCI_IMAGE_RUNTIME_UID with ??=
  classes: add container-nonroot-user.bbclass
  classes: add container-volatile-fixup.bbclass
  classes: add container-dev-mode.bbclass
  recipes-containers/images: add app-container-python
  recipes-containers/images: add app-container-mosquitto
  vcontainer-bbmask.inc: allow 'mosquitto', 'libwebsockets'
  recipes-containers/images: add app-container-valkey
  recipes-containers/images: add app-container-nginx
  vcontainer-bbmask.inc: allow meta-webserver/recipes-httpd/nginx
  app-container-curl: use multilayer mode; container-nonroot-user
  container-image-multiarch: add helper recipe
  vcontainer-tarball: fix buildbot-venv shadowing

 classes/container-dev-mode.bbclass            |  34 ++++
 classes/container-nonroot-user.bbclass        | 155 ++++++++++++++++++
 classes/container-volatile-fixup.bbclass      |   6 +
 classes/image-oci.bbclass                     |   3 +-
 conf/distro/include/vcontainer-bbmask.inc     |   6 +-
 conf/layer.conf                               |   1 +
 .../images/app-container-curl.bb              |  39 +++++
 .../images/app-container-mosquitto.bb         |  43 +++++
 .../images/app-container-nginx.bb             |  62 +++++++
 .../images/app-container-python.bb            |  45 +++++
 .../images/app-container-valkey.bb            |  71 ++++++++
 .../container-entrypoint.sh                   |  18 ++
 .../images/container-image-multiarch.bb       |  31 ++++
 .../vcontainer/vcontainer-tarball.bb          |   4 +-
 recipes-demo/images/app-container-curl.bb     |  46 ------
 15 files changed, 512 insertions(+), 52 deletions(-)
 create mode 100644 classes/container-dev-mode.bbclass
 create mode 100644 classes/container-nonroot-user.bbclass
 create mode 100644 classes/container-volatile-fixup.bbclass
 create mode 100644 recipes-containers/images/app-container-curl.bb
 create mode 100644 recipes-containers/images/app-container-mosquitto.bb
 create mode 100644 recipes-containers/images/app-container-nginx.bb
 create mode 100644 recipes-containers/images/app-container-python.bb
 create mode 100644 recipes-containers/images/app-container-valkey.bb
 create mode 100644 recipes-containers/images/app-container-valkey/container-entrypoint.sh
 create mode 100644 recipes-containers/images/container-image-multiarch.bb
 delete mode 100644 recipes-demo/images/app-container-curl.bb

This series can be found at 
https://github.com/moto-timo/meta-virtualization/tree/container-improvements-v2

-- 
2.54.0


