Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5086.1795654084743564978
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 16:48:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SZ8wGaLT;
 spf=pass (domain: konsulko.com, ip: 209.85.210.172, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so3171576b3a.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 16:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795654084; x=1796258884; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zo2OhDlQbfrbL3C5KtN+l5iON5/Kq9iMoHjWyaepWZw=;
        b=SZ8wGaLTkjK0MIJT5+Y85vTjqx730f6BuEoGYVbRFcFDlnsrrac2o5a6eQJjklTNtD
         jYdbMaNBZeFaQ4Zd+ZgZN1pV3k3vLWJ84d9hZfqLum/09RfduaFBm9xMf2Eppt5Ul+PH
         xLpjk3iG9Rl/b049yet23ef8Covmal1+glsDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654084; x=1796258884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zo2OhDlQbfrbL3C5KtN+l5iON5/Kq9iMoHjWyaepWZw=;
        b=liF6aFcNNRbcDt5+EtMjhNKqKN4uOQQzJ99BbTBLJSuEO1x/NNvG5uNgJbwQZiAyM5
         UIcMle9TPGOQSMhdHnn6gT/i8hqhlYTrgqAyKMgJrrdgPmlQOXdt86xch4PwbS309+87
         tvr+eG+5zAVEe82q4THhTvCivGNNiO25QY+Hk5dvrWXtP4YEGGRZiYiR3EljqjEVUKT1
         c1XIxxPgPqxYR1ngc8ziUarueShBqHdRufoXKrqfv7PPzGCcADSjrP1jIh2CsEbO9SL8
         I0jKqdWICbbihEkMOV7ogR5MIMIjAqm0ozsovkrD0Pp+Ho6TlQ0+uGJNmqnJ5GFmsqQd
         hYBQ==
X-Gm-Message-State: APuU4Z8QllbYBD4EVHlc06/hmUkci0P2CZ3Xv2829ZD/H7STTEhFkmY3
	0J//reTJPzr8yTFf7rJ1PH3tYvGVT04JNy/wjyPavHySbi1RsdExOlg76/+D7JWa+anPN8PCxKr
	3VI5EvgU=
X-Gm-Gg: AZFdTZfVQMWgzlL5+x60i+uYmMZ8tQlYOupzfEOGuH0RUQ79R0pWFt8DpQmGV+DrceK
	GGTGb29ic0wUCnfZLBZBcFL3Tqno55CqgYjN2iKv12/pva5+XtZdj95pDX2WxpU9u8wAC5Cobhn
	vPLGpISaAVRDN+XyKY9k+3WaF9+ZiIqwIqKVtMs0nZxfUsdAuxs9UtNv6/PhH9nIlIOQf1FlzzX
	rOaLfpZw59/YRhhySxU4hLcyP6goW60csmek46pWScX2QQXRCO9tz2xe5gdLJXoKAtSdzPFcd6z
	t6GxRCMwRQ/7hlTZ9bOAXLmeUvl4cYGLvA5AV4eb6WIYaP7/XHCLXoAE6zk767hc1SXfoCdsUI0
	pTYIJvm1SBeNSbVr9GPzs/mL7kUvFMvNrWd9B8XU02Gn75S3aUsSpeaWDkD4xIMt6UuPzSmbjFB
	Z/8KUMUQHh01SQRWi1gjhn54ZoP7l8piz3ErCeWpNPVONFiuKvABMADasS1f0AqLjCDrzKqhe59
	Viaxgv9TGiW+Goq7ePEOigkYZOBMzGC5hHzy05f5i+QpAO8Xsv+me8kFi33etF8nLT9ezBE6GAk
	7qychHNnB4Fpx7A1QF9fgj7kU3lWb53D5+x/6Z7cWmp5//scbrpQb+BYazBq+LyWIYXSmlBtWqP
	NOoHoUsAv6YtmV4nviHM7ma1ChzPc5N+LQ+TgaNlt2rHkXRgI6jXRXqV/Op2maJwIojM=
X-Received: by 2002:a05:6a20:244c:b0:3e2:acd2:b94 with SMTP id adf61e73a8af0-4014b564579mr23191912637.35.1795654084043;
        Wed, 25 Nov 2026 16:48:04 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from localhost (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0332bfsm10049301a12.22.2026.11.25.16.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:48:03 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH v2 1/3] image-oci: track multi-layer rootfs directories with pseudo
Date: Wed, 25 Nov 2026 16:47:54 -0800
Message-ID: <20261126004756.89781-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126004756.89781-1-tim.orling@konsulko.com>
References: <20261126004756.89781-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Nov 2026 00:48:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10189
Content-Type: text/plain; charset="utf-8"

oci_install_layer_packages() installs each packages: layer into
${WORKDIR}/oci-layer-rootfs/layer-N-<name> from do_image_oci. Since
oe-core moved to dnf 5.4.7.0, every rpm layer install fails:

  error: cannot open Packages database in
  Failed to load system repo from root ".../oci-layer-rootfs/layer-1-base":
  rpmtsOpenDB failed: Invalid argument

do_image_oci runs under pseudo, so getuid() returns 0 in dnf and rpm,
but the layer rootfs is not in PSEUDO_INCLUDE_PATHS, so pseudo passes
their syscalls through unchanged. When dnf5 loads the system repo,
libsolv calls rpmtsOpenDB(), and rpm's openDatabase() runs
rpmioMkpath(dbhome, 0755, getuid(), getgid()). That creates var/lib/rpm
and then chowns it to 0:0 for real. bitbake runs the task in a user
namespace that maps only the build user's uid (bb.utils.disable_network),
so the kernel rejects a chown to the unmapped uid 0 with EINVAL. rpm
returns before the sqlite rpmdb is created.

dnf4 never showed this: its CLI loads the system repo with
load_system_repo='auto' and ignores the failure, and the next open finds
the directories already present and skips the chown. dnf5 makes the
failure fatal.

Opening the rpmdb is only the first place rpm needs root. With
getuid() == 0 it chowns every file it installs (fsmChown() in
lib/fsm.cc), and every transaction chroots into the install root
(rpmChrootIn() in lib/transaction.cc), as do scriptlets. Both fail
outside pseudo.

Running dnf with PSEUDO_DISABLED=1 instead avoids the chowns, but the
chroot then fails with EPERM and every transaction aborts with "Rpm
transaction failed", leaving all package layers empty (tried on the
containers-library autobuilder target).

So the layer rootfs needs pseudo for the same reason ${WORKDIR}/rootfs
does for do_rootfs. Add it to PSEUDO_INCLUDE_PATHS, as image.bbclass
does for MULTILIB_TEMP_ROOTFS. The ownership pseudo records there does
not reach the image: the layer is copied into the bundle with
--no-owner --no-group, and umoci records ownership itself.

To reproduce, build a multi-layer rpm image, for example:

  inherit image image-oci
  IMAGE_INSTALL = "base-files"
  IMAGE_PKGTYPE = "rpm"
  OCI_LAYER_MODE = "multi"
  OCI_LAYERS = "base:packages:base-files+coreutils"

Without this change, log.do_image_oci shows the error above, demoted to
"OCI: Package installation had issues", and the layer is empty.

The EINVAL can be shown on its own with:

  unshare --user --net --map-current-user sh -c 'touch f && chown 0:0 f'

Tested with the containers-library autobuilder target (aarch64 and
x86-64).

[YOCTO #16531]

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 classes/image-oci.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
index 141cd2a8..d4c3096a 100644
--- a/classes/image-oci.bbclass
+++ b/classes/image-oci.bbclass
@@ -69,6 +69,8 @@ do_image_oci[depends] += "jq-native:do_populate_sysroot"
 # Package manager native tools for multi-layer mode with package installation
 OCI_PM_DEPENDS = "${@oci_get_pm_depends(d)}"
 do_image_oci[depends] += "${OCI_PM_DEPENDS}"
+# rpm installs layers as fake root (chown, chroot), so pseudo must track them
+PSEUDO_INCLUDE_PATHS .= ",${WORKDIR}/oci-layer-rootfs"
 
 def oci_pkg_type(d):
     """Resolve IMAGE_PKGTYPE with a single, documented default.
-- 
2.56.1

