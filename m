Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5D3C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 14:29:07 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.10375.1717079345427889653
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 May 2024 07:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OJTHSFp9;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a63359aaaa6so110970466b.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 May 2024 07:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717079344; x=1717684144; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AaSqhOQ5rNRPL6mLH4xpQq3hjGarYCGEy56CaCfpxxc=;
        b=OJTHSFp9jgxMFdMZwaJPuIP0Eadh3X5132pfs0Gl+FDQILRHUmWY+n7TD52HjKkV8e
         NSjmZ4XFo0j5I6s8fiyuUGBYUhrPSb3kamrgmfAtporbTIiUENJs+s3BubOYMAvnaYoz
         8OVPwPpO0HJqt/rO6qWdSd1RqKvXSgG8n2fFSfthdeCE+2vTunm6+QJu1InJeSti8rXM
         Gl0GeAl12g8/AHSn39u3IQg/KGOpe7q7fpcGc8aZOY3wbaCKVOYPyL/3reUkWe5SqsYB
         P99U36ocQl44oMU0qxXGWwtj9v/mgtyZtIyTI4ZKO+jFh7D3KON7pg8oNP5ci9DstCoq
         UUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717079344; x=1717684144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AaSqhOQ5rNRPL6mLH4xpQq3hjGarYCGEy56CaCfpxxc=;
        b=g6frz2aHlK6/VZ8XymczqsLol5B97ed4rmW4vznAyTQ0xmXFdOmh/p4ag0O6t+cFHz
         F2zTKPWNOWaAjtzg0zIY7yFQQ/CD/aHGurY0izxA+oCTFz4iSq+EaJ6jdZir9TYQaWib
         AGZT0dmnd6gT9j9c2tFcVx1nQLiibTHb2TzByYRgn4QEkgSSrNZjpiaF2PuR2ll9ex12
         kfdIwOjWnp/zXD0CyEJbM9jjq7fL6plryDpnx5X10+MhRjmFSWPUfvcvTQn75rHEm/h6
         zd7cEp5WkfDpYIj2tOho/GOSwFMecRrxB1/Yk1H6dtqYcvcOHLZIk/TZgh7RSa8cZV0g
         3SsA==
X-Gm-Message-State: AOJu0Yzl8a5bKw5oqAntES0SMEPmggKOkH2CWVKKPwsBMATM0dxGqv3q
	PEFbJhjjh1J0AybyhcGU73rtl4xTyqqdXMVcnV7OhyZZqJWpwIUJ5Q5iDQ==
X-Google-Smtp-Source: AGHT+IFo3SRwqaK26nJs1jiD3vqs49waNFSGZz10hGATtLrWT1Rqbt32pMfidIHpK0Ind1x3A/GoHg==
X-Received: by 2002:a17:906:fb9b:b0:a5a:1b81:627d with SMTP id a640c23a62f3a-a65e8f7b55emr148024366b.41.1717079343042;
        Thu, 30 May 2024 07:29:03 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a672bfbdcfesm14289666b.73.2024.05.30.07.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 07:29:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Hieu Van Nguyen <hieu2.nguyen@lge.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [master-next][PATCH v2] libvirt: convert more WORKDIR references to UNPACKDIR
Date: Thu, 30 May 2024 16:28:45 +0200
Message-ID: <20240530142845.1822812-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 May 2024 14:29:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8788

From: Hieu Van Nguyen <hieu2.nguyen@lge.com>

unpacked source files are now in UNPACKDIR, so we adjust our
operations to match.

Some references were missed in previous commit as they
are behind conditional.

Use BP subdir for python, to build it inside ${S}.

Need cd - to go back to $${B} so that gnutls-helper.py
is executed there instead of python subdirectory.

Use mix of tabs and spaces for indentation like other lines
around :).

Signed-off-by: Hieu Van Nguyen <hieu2.nguyen@lge.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-extended/libvirt/libvirt-python.inc |  8 +++++---
 recipes-extended/libvirt/libvirt_10.0.0.bb  | 21 ++++++++++-----------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 6fb2b68c..40c362d6 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -18,7 +18,7 @@ FILES:${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 # Currently the libvirt-python debug libraries contain buildpaths
 INSANE_SKIP:${PN}-dbg += "buildpaths"
 
-SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
+SRC_URI += "http://libvirt.org/sources/python/${BPN}-python-${PV}.tar.gz;name=libvirt_python;subdir=${BP}"
 
 SRC_URI[libvirt_python.sha256sum] = "a82588f0e7db53eda7b7dbcbc448b0ec43e00a8c77cac69644495299b410c20d"
 
@@ -46,8 +46,9 @@ do_compile:append() {
 		# the syroot staged pkgconfig entries. So we clear the sysroot
 		# for just this portion.
 		export PKG_CONFIG_SYSROOT_DIR=
-		cd ${WORKDIR}/${BPN}-python-${PV} && \
+		cd ${S}/${BPN}-python-${PV} && \
 		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
+		cd -
 	fi
 }
 
@@ -57,8 +58,9 @@ do_install:append() {
 		# the syroot staged pkgconfig entries. So we clear the sysroot
 		# for just this portion.
 		export PKG_CONFIG_SYSROOT_DIR=
-		cd ${WORKDIR}/${BPN}-python-${PV} && \
+		cd ${S}/${BPN}-python-${PV} && \
 		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py install \
                        --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${LIBVIRT_INSTALL_ARGS}
+		cd -
 	fi
 }
diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-extended/libvirt/libvirt_10.0.0.bb
index 9ad1f798..8e54406a 100644
--- a/recipes-extended/libvirt/libvirt_10.0.0.bb
+++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
@@ -24,12 +24,12 @@ RDEPENDS:libvirt-libvirtd:append:aarch64 = " dmidecode"
 #connman blocks the 53 port and libvirtd can't start its DNS service
 RCONFLICTS:${PN}_libvirtd = "connman"
 
-SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
+SRC_URI = "http://libvirt.org/sources/${BP}.tar.xz;name=libvirt \
            file://libvirtd.sh \
            file://libvirtd.conf \
            file://dnsmasq.conf \
            file://hook_support.py \
-           file://gnutls-helper.py \
+           file://gnutls-helper.py;subdir=${BP} \
            file://0001-prevent-gendispatch.pl-generating-build-path-in-code.patch \
            file://0001-messon.build-remove-build-path-information-to-avoid-.patch \
           "
@@ -286,21 +286,20 @@ do_install:append() {
 
 	if ${@bb.utils.contains('PACKAGECONFIG','gnutls','true','false',d)}; then
 	    # Generate sample keys and certificates.
-	    cd ${WORKDIR}
-	    ${WORKDIR}/gnutls-helper.py -y
+	    ${S}/gnutls-helper.py -y
 
 	    # Deploy all sample keys and certificates of CA, server and client
 	    # to target so that libvirtd is able to boot successfully and local
 	    # connection via 127.0.0.1 is available out of box.
 	    install -d ${D}/etc/pki/CA
 	    install -d ${D}/etc/pki/libvirt/private
-            install -m 0755 ${WORKDIR}/gnutls-helper.py ${D}/${bindir}
-	    install -m 0644 ${WORKDIR}/cakey.pem ${D}/${sysconfdir}/pki/libvirt/private/cakey.pem
-	    install -m 0644 ${WORKDIR}/cacert.pem ${D}/${sysconfdir}/pki/CA/cacert.pem
-	    install -m 0644 ${WORKDIR}/serverkey.pem ${D}/${sysconfdir}/pki/libvirt/private/serverkey.pem
-	    install -m 0644 ${WORKDIR}/servercert.pem ${D}/${sysconfdir}/pki/libvirt/servercert.pem
-	    install -m 0644 ${WORKDIR}/clientkey.pem ${D}/${sysconfdir}/pki/libvirt/private/clientkey.pem
-	    install -m 0644 ${WORKDIR}/clientcert.pem ${D}/${sysconfdir}/pki/libvirt/clientcert.pem
+	    install -m 0755 ${S}/gnutls-helper.py ${D}/${bindir}
+	    install -m 0644 cakey.pem ${D}/${sysconfdir}/pki/libvirt/private/cakey.pem
+	    install -m 0644 cacert.pem ${D}/${sysconfdir}/pki/CA/cacert.pem
+	    install -m 0644 serverkey.pem ${D}/${sysconfdir}/pki/libvirt/private/serverkey.pem
+	    install -m 0644 servercert.pem ${D}/${sysconfdir}/pki/libvirt/servercert.pem
+	    install -m 0644 clientkey.pem ${D}/${sysconfdir}/pki/libvirt/private/clientkey.pem
+	    install -m 0644 clientcert.pem ${D}/${sysconfdir}/pki/libvirt/clientcert.pem
 
 	    # Force the connection to be tls.
 	    sed -i -e 's/^\(listen_tls\ =\ .*\)/#\1/' -e 's/^\(listen_tcp\ =\ .*\)/#\1/' ${D}/etc/libvirt/libvirtd.conf
-- 
2.45.1


