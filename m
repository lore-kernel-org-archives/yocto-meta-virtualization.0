Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.1388.1583273501046551250
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Mar 2020 14:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nwu3BZTt;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id y17so6450707wrn.6
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Mar 2020 14:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4bGMyFwOc6i2Kl+OirThWhX3jlbRWoT0Zp8J2bPg3UA=;
        b=Nwu3BZTtkRqd8qUaJ618Dq+wUR+ndDo2fMGlEyhCIrjpsJ+WSORaO1ZyGiM59XjIHl
         lm9AbLsE9Ap42DfqKIETuRJOviQUmQPaMGhPEAgPenGPEpD0qoR58yqQoP26PwHldCNT
         jYTVFBjKkm00TR27xsXqT8FhsqDhI+NA3RHcpWonNv7ywnnWMQHXgioCOcwC0cvnVCwb
         yqK9/7jqft6koiNGQgHpwOHFzNOaa/leBFqRPt/7MEYicVSs03deA2T3SscPqaJZIqVJ
         +N30CYwbLe3DMdcM1hzkvIN/fiJVvc5Ko+NrI4UuyAPlLDTrv/xCkUfMFwR+zqdpbf7C
         VVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4bGMyFwOc6i2Kl+OirThWhX3jlbRWoT0Zp8J2bPg3UA=;
        b=fgb4StPyJhOVozltliqxOli9bzsC3k4/pL3d6FfvSPc5otsXr+rzRFw+CpJeUsIAnL
         P7XH+uJngqNSIv2aoRlB7Fs8madXgwcdMMPtiy1yxgymthNxjtRI8Dc5kC8TPnDyclrb
         HMijEMvZjVXtJeiEVGfUh3umqgpuz7e80Z3W2mWT99pFrnTYIbntJeIm6oUJGZLGxtPU
         8BnUGHqM77RZqhfiQxC0GpLhfnRHlpMYxuE+0vMJefqZbJHqU6pKBKhQF8l/TdsL+2F8
         72LtmXtDVjRN9gh4Cg9SPFRR/OTzFPlEjMHbqOdOKte70Vtv+dpzzn9tDsNotGNOyFMt
         STFg==
X-Gm-Message-State: ANhLgQ2eW/A4KDl14mtOU82mEdE3TkRdludGJCI69jNQGliSz5wcpuZU
	bymsGdQQC9nAcazPR6JRKEUlqdXM
X-Google-Smtp-Source: ADFU+vtbwSgTBCgYc3t08gy7BGKwXLKWJ56vsOffkhi4novtpB0hFgJXl9eMvOS41u4W7RmCmOX4xg==
X-Received: by 2002:adf:fdc2:: with SMTP id i2mr177105wrs.166.1583273499187;
        Tue, 03 Mar 2020 14:11:39 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c2sm669612wma.39.2020.03.03.14.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 14:11:38 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 2/2] docker-moby: fix build
Date: Tue,  3 Mar 2020 23:11:35 +0100
Message-Id: <20200303221135.21336-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303221135.21336-1-Martin.Jansa@gmail.com>
References: <20200303221135.21336-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* apply similar patch to what was applied to docker-ce in:
  http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/recipes-containers/docker?id=e7787cb01be91d3798594687a475d5b085f29ede
  it's very similar, but needs to be separate .patch file, because the
  path to make/.binary is different in docker-ce and docker-moby.

  since the recent upgrade:
  http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=f770151b3ff0938bea4972abdd1ee7f6cbc3a074
  docker-moby needs the same change or fails like this:

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

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/docker/docker-moby.bb      |  1 +
 ...dcoded-CC-on-cross-compile-docker-ce.patch | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 recipes-containers/docker/docker-moby/0001-imporve-hardcoded-CC-on-cross-compile-docker-ce.patch

diff --git a/recipes-containers/docker/docker-moby.bb b/recipes-containers/docker/docker-moby.bb
index a8c5946..39bc263 100644
--- a/recipes-containers/docker/docker-moby.bb
+++ b/recipes-containers/docker/docker-moby.bb
@@ -44,6 +44,7 @@ SRC_URI = "\
 	git://github.com/docker/cli;branch=19.03;name=cli;destsuffix=git/cli \
 	file://docker.init \
 	file://0001-libnetwork-use-GO-instead-of-go.patch \
+        file://0001-imporve-hardcoded-CC-on-cross-compile-docker-ce.patch \
 	"
 
 require docker.inc
diff --git a/recipes-containers/docker/docker-moby/0001-imporve-hardcoded-CC-on-cross-compile-docker-ce.patch b/recipes-containers/docker/docker-moby/0001-imporve-hardcoded-CC-on-cross-compile-docker-ce.patch
new file mode 100644
index 0000000..766425a
--- /dev/null
+++ b/recipes-containers/docker/docker-moby/0001-imporve-hardcoded-CC-on-cross-compile-docker-ce.patch
@@ -0,0 +1,61 @@
+From 1263fdb50a540e9db742694b7cee08284ad986d0 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 17 Jul 2019 17:34:04 +0800
+Subject: [PATCH] imporve hardcoded CC on cross compile
+
+Since commit applied in moby [61a3285 Support cross-compile for arm]
+it hardcoded var-CC to support cross-compile for arm
+
+Correct it with "${parameter:-word}" format, it is helpful for user
+define toolchains
+
+(Use Default Values.  If parameter is unset or null, the expansion of
+word is substituted.  Otherwise, the value of parameter is substituted.)
+
+Upstream-Status: Submitted [https://github.com/moby/moby/pull/39546]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ components/engine/hack/make/.binary | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/import/hack/make/.binary b/src/import/hack/make/.binary
+index 53de6749e5..66f4ca05f3 100644
+--- a/src/import/hack/make/.binary
++++ b/src/import/hack/make/.binary
+@@ -44,27 +44,27 @@ if [ "$(go env GOOS)/$(go env GOARCH)" != "$(go env GOHOSTOS)/$(go env GOHOSTARC
+ 	# must be cross-compiling!
+ 	case "$(go env GOOS)/$(go env GOARCH)" in
+ 		windows/amd64)
+-			export CC=x86_64-w64-mingw32-gcc
++			export CC="${CC:-x86_64-w64-mingw32-gcc}"
+ 			export CGO_ENABLED=1
+ 			;;
+ 		linux/arm)
+ 			case "${GOARM}" in
+ 			5|"")
+-				export CC=arm-linux-gnueabi-gcc
++				export CC="${CC:-arm-linux-gnueabi-gcc}"
+ 				export CGO_ENABLED=1
+ 				;;
+ 			7)
+-				export CC=arm-linux-gnueabihf-gcc
++				export CC="${CC:-arm-linux-gnueabihf-gcc}"
+ 				export CGO_ENABLED=1
+ 				;;
+ 			esac
+ 			;;
+ 		linux/arm64)
+-			export CC=aarch64-linux-gnu-gcc
++			export CC="${CC:-aarch64-linux-gnu-gcc}"
+ 			export CGO_ENABLED=1
+ 			;;
+ 		linux/amd64)
+-			export CC=x86_64-linux-gnu-gcc
++			export CC="${CC:-x86_64-linux-gnu-gcc}"
+ 			export CGO_ENABLED=1
+ 			;;
+ 	esac
+-- 
+2.23.0
+
-- 
2.20.1

