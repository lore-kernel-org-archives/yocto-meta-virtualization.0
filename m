Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.10203.1621424865927600559
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 May 2021 04:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FiGtATEG;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id di13so14995315edb.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 May 2021 04:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9xvZ7Y3JH5hVFKbKOAZLbUI7gdBHXwNpISI5Se2Pmko=;
        b=FiGtATEGmr4XyIzMKduFjCmqza+NPr57i298EFYlw+qpTmlCtRCcldStgic65yaThF
         djeGCVfwwVUGs8UGn5lzPuqKy1AN9dE43wKkJ81NYfIjdgtR0yJN4X++R37mPCWw5Fem
         sjzrIeggVzt8dQyWsCU2v0zLjb+7IsNfNifRH5AZ634+JRnG98vWk93eqErENAlSdvdi
         g56zSNzjlCVLHp9u5iILkPwDXo0LjxbTyNk3fymZRoBOvtonk9D5qBbB8mKvuiKkrEZA
         ayfNo3C7Mznh4RbYJV5QIUZFVfv7lPETPsoMxPwNGAlyTBxCquGGoz7bnaB96+7TriFX
         osGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9xvZ7Y3JH5hVFKbKOAZLbUI7gdBHXwNpISI5Se2Pmko=;
        b=EItC5X4kFhIAFKUntSrtqsq3BH77LFNei2qoFdQUCqxlzPrsIbKCly/unbLxYRlMAc
         4RxMOHYXWzwrgK+e+F/etsGPreOKq02+N5ZtzRGfE8Ysm/GM14DvWfXxuwhANB1wc+0p
         QiTVqudw+z4SC/+1ON3qwNZpzJMByjUxW33d2Dy0NSeNMgdDySFjFwr8dTUTi0Rd94jb
         WDPpBS9Gf6hfFqyDMtTES6WLpwFh0Lha8HAbMWjj0BKX642sThm+RRQaCKKyJFsW8P1i
         IOYFnkIEVDxZa3WmasKNHatscZtr/wMzaH7qa6vLqS9EFVz9ZTUqQ7IZZJD4pblBtufO
         x4Lg==
X-Gm-Message-State: AOAM53369FdeUwfurt2mV1oBwRwAGOTEkzvKaiU3kry0xQ+0ie4b9bnQ
	n3p9rviJlI9ZH+kQdUFkkJENSiBkMII=
X-Google-Smtp-Source: ABdhPJx73nIWR+rlzODy/ruqZRJ2PK/y4OhBo01nWmjp4ZjJOMmD+4xs4uANvitphgIyMvzXzGUHmQ==
X-Received: by 2002:aa7:cd8b:: with SMTP id x11mr13954905edv.87.1621424864429;
        Wed, 19 May 2021 04:47:44 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id lz15sm9807157ejb.27.2021.05.19.04.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 04:47:44 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] libvirt: fix do_install with usrmerge
Date: Wed, 19 May 2021 13:47:40 +0200
Message-Id: <20210519114740.152144-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* meson build uses these paths:
  ./src/meson.build:    systemd_unit_dir = prefix / 'lib' / 'systemd' / 'system'
  ./tools/meson.build:    install_dir: prefix / 'lib' / 'systemd' / 'system',

  with usrmerge it fails with:
  sed: can't read TOPDIR/tmp-glibc/work/core2-64-oe-linux/libvirt/7.2.0-r0/image//usr/lib/systemd/system/libvirtd.service: No such file or directory
  because systemd_unitdir and systemd_system_unitdir are different
  with and without usrmerge in DISTRO_FEATURES:

  env.libvirt-without-usrmerge:export systemd_unitdir="/lib/systemd"
  env.libvirt-with-usrmerge:export systemd_unitdir="/usr/lib/systemd"

  env.libvirt-without-usrmerge:export systemd_system_unitdir="/lib/systemd/system"
  env.libvirt-with-usrmerge:export systemd_system_unitdir="/usr/lib/systemd/system"

* set -Dinit_script to none when systemd isn't used instead of
  deleting the files in do_install_append

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/libvirt/libvirt_7.2.0.bb | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
index b569953..19662a7 100644
--- a/recipes-extended/libvirt/libvirt_7.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
@@ -65,7 +65,7 @@ FILES_${PN}-libvirtd = " \
 	${sysconfdir}/libvirt/libvirtd.conf \
         /usr/lib/sysctl.d/60-libvirtd.conf \
 	${sbindir}/libvirtd \
-	${systemd_unitdir}/system/* \
+	${systemd_system_unitdir} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', '${libexecdir}/libvirt-guests.sh', d)} \
 	${@bb.utils.contains('PACKAGECONFIG', 'gnutls', '${sysconfdir}/pki/libvirt/* ${sysconfdir}/pki/CA/*', '', d)} \
         "
@@ -199,17 +199,21 @@ do_install_append() {
 	fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-            mkdir -p ${D}/lib
-            mv ${D}/usr/lib/systemd ${D}/lib
+            if [ "${systemd_system_unitdir}" != "${prefix}/lib/systemd/system" ] ; then
+                # ./src/meson.build:    systemd_unit_dir = prefix / 'lib' / 'systemd' / 'system'
+                # ./tools/meson.build:    install_dir: prefix / 'lib' / 'systemd' / 'system',
+                mkdir -p ${D}${systemd_system_unitdir}
+                mv ${D}${prefix}/lib/systemd/system/* ${D}${systemd_system_unitdir}
+                rmdir ${D}${prefix}/lib/systemd/system ${D}${prefix}/lib/systemd
+            fi
+
 	    # This variable is used by libvirtd.service to start libvirtd in the right mode
 	    sed -i '/#LIBVIRTD_ARGS="--listen"/a LIBVIRTD_ARGS="--listen --daemon"' ${D}/${sysconfdir}/sysconfig/libvirtd
 
 	    # We can't use 'notify' when we don't support 'sd_notify' dbus capabilities.
 	    sed -i -e 's/Type=notify/Type=forking/' \
 	           -e '/Type=forking/a PIDFile=/run/libvirtd.pid' \
-		   ${D}/${systemd_unitdir}/system/libvirtd.service
-	else
-	    rm -rf ${D}/usr/lib/systemd
+		   ${D}/${systemd_system_unitdir}/libvirtd.service
 	fi
 
 	# The /run/libvirt directories created by the Makefile are 
@@ -302,7 +306,7 @@ do_install_append() {
 }
 
 EXTRA_OEMESON += " \
-    -Dinit_script=systemd \
+    -Dinit_script=${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','none', d)} \
     -Drunstatedir=/run \
     -Dtests=enabled \
     "
-- 
2.30.2

