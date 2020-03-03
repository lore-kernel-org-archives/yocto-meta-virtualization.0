Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.1444.1583273499468055255
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Mar 2020 14:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QIzA8wl3;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id e26so4529351wme.5
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Mar 2020 14:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z9i7S6I3dq5Pk5darRafhj4y5wZIDLkxG9UbYMyw+Kw=;
        b=QIzA8wl3WHanobyL0f8Ll6bmpzuAKWpeaQszC8X2F+dUMTE9l/o/U8IB26SmO6FwVB
         FJhIlAOmdX/sa+DTQXyGUBhGdBYs3U7iJrltbj1IqHayAfMLF0BAHkoaR18v9mozAQaQ
         GMZ6j44E5bvcRWJq/5sJUdESQNYwovfN1JBVT2PULmWwJk7qhYjOu0TK9cnytF5pZxui
         cYlal7YiU1r7yDHu2pSc9a6y/Tzk2zR6/CBMslChNTUz7AlGZMcPsso9SjoU39Fnk3Aw
         Zxgzsbw4na4vvgZUUuYGKnvWxExjRQj8Id65mcb4U9dr4xxtWU612Tnq+I50Q1NoJS5m
         Bx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z9i7S6I3dq5Pk5darRafhj4y5wZIDLkxG9UbYMyw+Kw=;
        b=uBg7NjSx4TvxVPU3EID1jZcgXwUrYLRA+p+L9CA8G8y9xsQjHhlHYyrYzoU7AVJckQ
         qMSBMMsCHV3iOxZFmE4n6luqu0Yc+xIHltiCihV0OpykTxf5KOJnKnWAJQCJqxlqVStA
         Dh0k1eqCJPGIBmwaEP6rWtrGxLzQdmY13VpNd6ST1OXGTJ3FO0A0s9xkGhyZC23dHFqg
         HK4WwYygid3AY3WDmzp417Hrw07fL9lwpEo72w2hCPCvBzwkumbwe50Mkip/nhU8L8aM
         G6i1EyJqjG5WlL+SSkdggsCYIoyCU77hRSJ2fqlGFyBj/XADCSus8IzTonAsvG0qydkC
         us1g==
X-Gm-Message-State: ANhLgQ0UztD/tiATyzzqzjMujPtdeRzaha37PBO1iWcNUDRhmdNcUlIH
	bRBhPZctuhQHoFE7FuB7D5x+f5n4
X-Google-Smtp-Source: ADFU+vuSCBuPsC53K46Jkt6yHyc6Ku+S8ZvVJ9E3E5QMYuwmhK0WPIev8XRmQQx5ZdWudozKvuNGIg==
X-Received: by 2002:a1c:155:: with SMTP id 82mr528246wmb.99.1583273497692;
        Tue, 03 Mar 2020 14:11:37 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b14sm26182115wrn.75.2020.03.03.14.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 14:11:36 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 1/2] docker-moby: fix DOCKER_GITCOMMIT
Date: Tue,  3 Mar 2020 23:11:34 +0100
Message-Id: <20200303221135.21336-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* SRCREV_docker isn't defined in docker-moby recipes at all
  so it passes unexpanded ${SRCREV_docker} as noticed in
  error log:

  | ERROR: Execution of 'work/raspberrypi4-oe-linux-gnueabi/docker-moby/19.03.6+git71373c6105e3cbc9702935b96d8ee01214c405e7-r0/temp/run.do_compile.31754' failed with exit code 2:
  |
  | Package devmapper was not found in the pkg-config search path.
  | Perhaps you should add the directory containing `devmapper.pc'
  | to the PKG_CONFIG_PATH environment variable
  | No package 'devmapper' found
  | Removing bundles/
  |
  | ---> Making bundle: dynbinary (in bundles/dynbinary)
  | Building: bundles/dynbinary-daemon/dockerd-19.03.6
  | GOOS="linux" GOARCH="arm" GOARM="7"
  | # runtime/cgo
  | exec: "arm-linux-gnueabihf-gcc": executable file not found in $PATH
  | WARNING: work/raspberrypi4-oe-linux-gnueabi/docker-moby/19.03.6+git71373c6105e3cbc9702935b96d8ee01214c405e7-r0/temp/run.do_compile.31754:1 exit 2 from 'VERSION="19.03.6" DOCKER_GITCOMMIT="${SRCREV_docker}" ./hack/make.sh dynbinary'
  | ERROR: Task (meta-virtualization/recipes-containers/docker/docker-moby.bb:do_compile) failed with exit code '1'

  this build issue is somehow caused by recent upgrade:
  http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=f770151b3ff0938bea4972abdd1ee7f6cbc3a074
  and this build error is not fixed by this change, but
  see 2nd to last line which shows
  DOCKER_GITCOMMIT="${SRCREV_docker}"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/docker/docker-moby.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker/docker-moby.bb b/recipes-containers/docker/docker-moby.bb
index b29c4b3..a8c5946 100644
--- a/recipes-containers/docker/docker-moby.bb
+++ b/recipes-containers/docker/docker-moby.bb
@@ -101,14 +101,14 @@ do_compile() {
 	# this is the unsupported built structure
 	# that doesn't rely on an existing docker
 	# to build this:
-	VERSION="${DOCKER_VERSION}" DOCKER_GITCOMMIT="${SRCREV_docker}" ./hack/make.sh dynbinary
+	VERSION="${DOCKER_VERSION}" DOCKER_GITCOMMIT="${SRCREV_moby}" ./hack/make.sh dynbinary
 
         # build the cli
 	cd ${S}/src/import/.gopath/src/github.com/docker/cli
 	export CFLAGS=""
 	export LDFLAGS=""
 	export DOCKER_VERSION=${DOCKER_VERSION}
-	VERSION="${DOCKER_VERSION}" DOCKER_GITCOMMIT="${SRCREV_docker}" make dynbinary
+	VERSION="${DOCKER_VERSION}" DOCKER_GITCOMMIT="${SRCREV_moby}" make dynbinary
 
 	# build the proxy
 	cd ${S}/src/import/.gopath/src/github.com/docker/libnetwork
-- 
2.20.1

