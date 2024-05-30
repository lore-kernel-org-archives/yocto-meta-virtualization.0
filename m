Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74624C27C43
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 12:47:26 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.7469.1717073244703370973
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 May 2024 05:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fAU2nIU5;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a626777f74eso76417266b.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 May 2024 05:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717073243; x=1717678043; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zcqFt6ChPwb4EiUiI95jbp5dBHRpkZtswJ7tEGYQtAY=;
        b=fAU2nIU5LwrRdl07HXoC40K/2aFtzcfcHsLAd7Qe2da81Tu/K+2OjeTXDLUN8+gTv/
         9+yGnfUi7y8P2vhYr42M2dQ+IrG4H1N5YzZqwGcZeFqrWZNaEFcs10Tk1d9hADblw7pT
         gF5sJBSZjoDaw/F2s0117/YtEpjfAJFaNCK8Vxv1Pz/zlRV82El9iJhqU/dpzhVkoomo
         qf7D/0P/cCO1r77BIH9yD1VXWXBhLrkQfvRLjwNJpb+XRLR/sbR3xkqjv8fTXAM2qHbP
         0mxqlc9WKS9S5WDitIuCtQCJ31ZHVp+AnytiRr7Gyqa0ctbGJLQ0cLNO58WSEyOuBDBy
         hu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717073243; x=1717678043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcqFt6ChPwb4EiUiI95jbp5dBHRpkZtswJ7tEGYQtAY=;
        b=qiPU++tdyS3eJJRrJenGIlqMD4H6OKWNoMXAe/UxUhEhKUalmOMOg3MzHw8gKKqIJU
         GPUyGD3br22V//jFJ18NvYryILQG2uVF8+RxsUaVCKfBPB1nOAL1A8ySl2nNz5rpKpmM
         CSCWA1+b+1Ugp19aXRC7aPDXOc/EBKWhKR2/pTWKGrBr0aSlUHDf6Ej7IGfonLBC3uX8
         6DcH3TCAzvhtMF3Q6hA7LCt6vrxwI5mZwCFRYdTpfwzY2p4kmuhqqI0mWkY9uYfHO5dV
         6DxzOYpfEs98W6zuU2wxPQ13DBalIttVEB47rsYOYZQEv3N1NMzIAsqG1Eof15P7oeO2
         n57Q==
X-Gm-Message-State: AOJu0YwTbK4t5eiIeVd99aQQgwCcJyvYZoxXjctS/wtDmAboYtgrjsJp
	uBL8ufrKYAqbLw3UoK8S+3/WBSpHI8/WQfCRb+Av1SVrcQvptsPcRT0YkQ==
X-Google-Smtp-Source: AGHT+IGuLfrVUUs0FhQQC789rb6gnpTJcxWCASD/kyHs2ba/Uap78PBoIseY5owMYgAorkc8xZTd3Q==
X-Received: by 2002:a17:906:d004:b0:a66:19cc:167f with SMTP id a640c23a62f3a-a6619cc174bmr117179266b.59.1717073242965;
        Thu, 30 May 2024 05:47:22 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc50095sm816728366b.131.2024.05.30.05.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 05:47:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Hieu Van Nguyen <hieu2.nguyen@lge.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [master-next][PATCH] libvirt: convert more WORKDIR references to UNPACKDIR
Date: Thu, 30 May 2024 14:47:06 +0200
Message-ID: <20240530124706.17491-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 May 2024 12:47:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8784

From: Hieu Van Nguyen <hieu2.nguyen@lge.com>

unpacked source files are now in UNPACKDIR, so we adjust our
operations to match.

Some references were missed in previous commit as they
are behind conditional.

Signed-off-by: Hieu Van Nguyen <hieu2.nguyen@lge.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-extended/libvirt/libvirt-python.inc |  4 ++--
 recipes-extended/libvirt/libvirt_10.0.0.bb  | 18 +++++++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 6fb2b68c..12041df0 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -46,7 +46,7 @@ do_compile:append() {
 		# the syroot staged pkgconfig entries. So we clear the sysroot
 		# for just this portion.
 		export PKG_CONFIG_SYSROOT_DIR=
-		cd ${WORKDIR}/${BPN}-python-${PV} && \
+		cd ${UNPACKDIR}/${BPN}-python-${PV} && \
 		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
 	fi
 }
@@ -57,7 +57,7 @@ do_install:append() {
 		# the syroot staged pkgconfig entries. So we clear the sysroot
 		# for just this portion.
 		export PKG_CONFIG_SYSROOT_DIR=
-		cd ${WORKDIR}/${BPN}-python-${PV} && \
+		cd ${UNPACKDIR}/${BPN}-python-${PV} && \
 		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py install \
                        --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${LIBVIRT_INSTALL_ARGS}
 	fi
diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-extended/libvirt/libvirt_10.0.0.bb
index 9ad1f798..ababbf1b 100644
--- a/recipes-extended/libvirt/libvirt_10.0.0.bb
+++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
@@ -286,21 +286,21 @@ do_install:append() {
 
 	if ${@bb.utils.contains('PACKAGECONFIG','gnutls','true','false',d)}; then
 	    # Generate sample keys and certificates.
-	    cd ${WORKDIR}
-	    ${WORKDIR}/gnutls-helper.py -y
+	    cd ${UNPACKDIR}
+	    ${UNPACKDIR}/gnutls-helper.py -y
 
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
+            install -m 0755 ${UNPACKDIR}/gnutls-helper.py ${D}/${bindir}
+	    install -m 0644 ${UNPACKDIR}/cakey.pem ${D}/${sysconfdir}/pki/libvirt/private/cakey.pem
+	    install -m 0644 ${UNPACKDIR}/cacert.pem ${D}/${sysconfdir}/pki/CA/cacert.pem
+	    install -m 0644 ${UNPACKDIR}/serverkey.pem ${D}/${sysconfdir}/pki/libvirt/private/serverkey.pem
+	    install -m 0644 ${UNPACKDIR}/servercert.pem ${D}/${sysconfdir}/pki/libvirt/servercert.pem
+	    install -m 0644 ${UNPACKDIR}/clientkey.pem ${D}/${sysconfdir}/pki/libvirt/private/clientkey.pem
+	    install -m 0644 ${UNPACKDIR}/clientcert.pem ${D}/${sysconfdir}/pki/libvirt/clientcert.pem
 
 	    # Force the connection to be tls.
 	    sed -i -e 's/^\(listen_tls\ =\ .*\)/#\1/' -e 's/^\(listen_tcp\ =\ .*\)/#\1/' ${D}/etc/libvirt/libvirtd.conf
-- 
2.45.1


