Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.4159.1631827388243890122
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 14:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jLgTVP+T;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 17so7467388pgp.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Sep 2021 14:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4CJ1oBR7nDNrCGYgm5CzKlshZsSfUxtf7qR1nEkl5B8=;
        b=jLgTVP+T9imPE8Ws02AwRlu8UE723q1wXFlEro63KvdZBjQNP+azUdqa+ZRQisJ1wX
         ZMNdiJwJ13oUFkuwWvORPv2Cqkgh5RrVI33uQ7tK52pTgFIRKoF8YtQW1spiYBL/xoip
         nS9m+APMct+F/1jEaZJtnuRnh0AV6wTlX3exRrGrxdT8GCwAR7FBNnMY+wS8qFPpNzS8
         lBukBv/mc2nd0P+Z2d1J+FXq7iBRyU7gqndQp2FpqtLVKo3MSvIEOWEGbOJg8aAB78VW
         pwfZhtdZ9aezsq5BoBEgmzR9ftgReUOP+iF8IvI6P9kSx0vOspx5TQSsm9HvOjcH6of5
         7+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4CJ1oBR7nDNrCGYgm5CzKlshZsSfUxtf7qR1nEkl5B8=;
        b=GNHlp68/LM8qq8ODLCA8cmYTqRKNGHzA05V1gLHjZw9P7W6fY02GLTwfYfcxsKlxM1
         ZpY8slcX/5r+RKDjM2eBZzEibbJEyMPAfliQ9utuXiwv83GxvPlWGaIICKu925u6BSYG
         6BoLZHHv+h/7+T/EINhrput0FI03bv23Po7DIvoIV4l2JorwDAPLy+RjkVc0FXz3zy9K
         L0jwDlijP00Seoi9R41sCWST8G6/e2EwkhQW4WZqPBbNsQsbhUAsm1Lwa3uTC0QlO7dX
         1udBca0FiNC5HuL7g7Gyuh8Lsrum1gm8DBr9aG5xG6drVbmSoOugeVm12srfI6/BVh3W
         Dwag==
X-Gm-Message-State: AOAM531ILfuW6nsaUYxpkNTUvvmkEl3zBCfVU5ecTHcwXc826urtPah1
	9xzs1zGGf/p2tEgKLWg3M1t3lzAxlDc=
X-Google-Smtp-Source: ABdhPJzJO3iWSo16ZO9HOYQlLbY8Sc+KWJPPAcaXjIVFRR73r7Yhr4U4n23LWC0AnR+8AMnQTBCRgQ==
X-Received: by 2002:aa7:959a:0:b0:43b:adeb:ef58 with SMTP id z26-20020aa7959a000000b0043badebef58mr7014404pfj.19.1631827387438;
        Thu, 16 Sep 2021 14:23:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:8e48:889d:1351:d2d2])
        by smtp.gmail.com with ESMTPSA id qe17sm3520209pjb.39.2021.09.16.14.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 14:23:07 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-virtualization][dunfell][PATCH 1/3] libvirt: Security fix for CVE-2020-10701
Date: Thu, 16 Sep 2021 14:23:03 -0700
Message-Id: <20210916212305.2211766-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source:  https://libvirt.org/git/libvirt.git
MR: 110898
Type: Security Fix
Disposition: Backport from https://libvirt.org/git/?p=libvirt.git;a=commit;h=4cc90c2e62df653e909ad31fd810224bf8bcf913
ChangeID: 73bff4861d76b0674547ead4d4b251b60705bb8c
Description:

Affect libvirt < 6.2.0

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libvirt/libvirt/CVE-2020-10701.patch      | 39 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_6.1.0.bb     |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2020-10701.patch

diff --git a/recipes-extended/libvirt/libvirt/CVE-2020-10701.patch b/recipes-extended/libvirt/libvirt/CVE-2020-10701.patch
new file mode 100644
index 0000000..453b02b
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2020-10701.patch
@@ -0,0 +1,39 @@
+From 4cc90c2e62df653e909ad31fd810224bf8bcf913 Mon Sep 17 00:00:00 2001
+From: Jonathon Jongsma <jjongsma@redhat.com>
+Date: Fri, 20 Mar 2020 09:43:13 -0500
+Subject: [PATCH] api: disallow virDomainAgentSetResponseTimeout() on read-only
+ connections
+
+This function changes the amount of time that libvirt waits for a
+response from the guest agent for all guest agent commands. Since this
+is a configuration change, it should not be allowed on read-only
+connections.
+
+Signed-off-by: Jonathon Jongsma <jjongsma@redhat.com>
+Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
+Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-10701 
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/libvirt-domain.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libvirt-domain.c b/src/libvirt-domain.c
+index 65813b68cc..a12809c2d5 100644
+--- a/src/libvirt-domain.c
++++ b/src/libvirt-domain.c
+@@ -12576,6 +12576,8 @@ virDomainAgentSetResponseTimeout(virDomainPtr domain,
+     virCheckDomainReturn(domain, -1);
+     conn = domain->conn;
+ 
++    virCheckReadOnlyGoto(conn->flags, error);
++
+     if (conn->driver->domainAgentSetResponseTimeout) {
+         if (conn->driver->domainAgentSetResponseTimeout(domain, timeout, flags) < 0)
+             goto error;
+-- 
+2.25.1
+
diff --git a/recipes-extended/libvirt/libvirt_6.1.0.bb b/recipes-extended/libvirt/libvirt_6.1.0.bb
index f301a0e..0146c6c 100644
--- a/recipes-extended/libvirt/libvirt_6.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_6.1.0.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://0001-build-drop-unnecessary-libgnu.la-reference.patch \
            file://hook_support.py \
            file://gnutls-helper.py \
+           file://CVE-2020-10701.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "a870e63f20fac2ccf98e716d05256145"
-- 
2.25.1

