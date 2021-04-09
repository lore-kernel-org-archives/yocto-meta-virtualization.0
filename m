Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.11979.1617985875959960533
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Apr 2021 09:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38492 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lUu2I-00055o-Qs; Fri, 09 Apr 2021 19:31:11 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-virtualization][PATCH 1/5] python3-paramiko: Upgrade 2.7.0 -> 2.7.2
Date: Fri,  9 Apr 2021 19:31:00 +0300
Message-Id: <20210409163104.26711-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 2.7.2:

- Update our CI to catch issues with sdist generation,
  installation and testing.
- Add missing test suite fixtures directory to MANIFEST.in,
  reinstating the ability to run Paramiko's tests from an sdist
  tarball.
- Remove leading whitespace from OpenSSH RSA test suite static
  key fixture, to conform better to spec.
- Fix incorrect string formatting causing unhelpful error message
  annotation when using Kerberos/GSSAPI.
- Fix incorrectly swapped order of p and q numbers when loading
  OpenSSH-format RSA private keys. At minimum this should address
  a slowdown when using such keys, and it also means Paramiko
  works with Cryptography 3.1 and above (which complains
  strenuously when this problem appears).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-paramiko_2.7.0.bb => python3-paramiko_2.7.2.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename recipes-devtools/python/{python3-paramiko_2.7.0.bb => python3-paramiko_2.7.2.bb} (70%)

diff --git a/recipes-devtools/python/python3-paramiko_2.7.0.bb b/recipes-devtools/python/python3-paramiko_2.7.2.bb
similarity index 70%
rename from recipes-devtools/python/python3-paramiko_2.7.0.bb
rename to recipes-devtools/python/python3-paramiko_2.7.2.bb
index d03702c..3d05efb 100644
--- a/recipes-devtools/python/python3-paramiko_2.7.0.bb
+++ b/recipes-devtools/python/python3-paramiko_2.7.2.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "b130f3e1c3442d21c1a0c9ae17776f4e"
-SRC_URI[sha256sum] = "fba9c46340e3d690ad5a9d0dbf06677cd91425de3afa7e9c0c187298ee4ddd0d"
+SRC_URI[sha256sum] = "7f36f4ba2c0d81d219f4595e35f70d56cc94f9ac40a6acdf51d6ca210ce65035"
 
 RDEPENDS_${PN} += " \
     python3-bcrypt \
-- 
2.17.1

