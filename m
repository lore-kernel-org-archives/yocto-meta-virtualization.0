Return-Path: <fabio.berton@ossystems.com.br>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1EBCE00C0E; Tue, 28 Nov 2017 03:17:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3FFCE00B1E
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Nov 2017 03:17:12 -0800 (PST)
Received: by mail-qt0-f195.google.com with SMTP id q13so31650767qtb.5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Nov 2017 03:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=QTzmV2FnGaMA3Azpk4r/hrl/JBujzmc7n5+ztV4zYMY=;
	b=F8CI51f2vqrhDKEWdM0F8ePqusHj7Fh3OuEdll6MMMgcQXINecqR+DvATNIDw2s2O2
	cZt2Gp/LBk5RbB4VkZ3PbzHo/Dpg8dutcBeIVzBCW+SkqYhsoSl0bUV79VClMOV7aD8w
	ntXDHrIMGrw0RwgJxRZniPMlZdsiFdNr9s9tTkWrTIHCEX4J77FvdGgGlg7BOH1wxl0B
	oyza0UKt7hpmu4UxeMefcm0bHu4gSWc2qSd/izl/nTg9J9PnU6o2mTHQCQsduWKWH8p7
	S1l0GW+taeQQAakxWG/XkZYlXVFrobxgqTH7bD/skIxB3YTyEN5rb9huFx36XZbqN6YL
	Cl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=QTzmV2FnGaMA3Azpk4r/hrl/JBujzmc7n5+ztV4zYMY=;
	b=cuLJSwbaJpzQE6UvUNcKIfbPr+nQN1IgkWlhdggjfue/V51n3v1vAFyh3NV8smyt9D
	3j1Wp4rW0CtpjoKAkwnwxV3lGvRnmnYufJUqLdbmDWR4h2j6vnH1u+VOpMKZUHww0Dta
	WN/2xZKQCFhkKMRlNewBNW99VQKWcV1SLrbNhco20nVwd90OHQh+/akxi346S07Ast9a
	O+t1JEQ000LyyBk9QfTfoXc0rMTRAQGF76ba9C9Vw0sbnNdn3NW/vNzqZH+N6CzyNO5t
	a9CgTUErAKlkRAzj+bg4hDON1OhqN88PQXsGgRIHuExSsom8J93gwsbWKM4dTTjGOzpy
	ey4A==
X-Gm-Message-State: AJaThX514/RZUfKvCZdThKObnFoVHOgYIhRKb8u4BOnO2pBkXrs4fSL5
	6xaI7cOErLCshmcbtDF0AMqHxtFc
X-Google-Smtp-Source: AGs4zMYtRQ3+cyaNkM1m701W6dWvyg7shmw/cQB6QcoAm7UZyqgGo9EeuRqei/SkZ9XrBrjUabY59Q==
X-Received: by 10.237.62.153 with SMTP id n25mr60925071qtf.122.1511867831794; 
	Tue, 28 Nov 2017 03:17:11 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	k9sm21495509qkl.10.2017.11.28.03.17.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Nov 2017 03:17:11 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: meta-virtualization@yoctoproject.org
Date: Tue, 28 Nov 2017 09:16:53 -0200
Message-Id: <20171128111653.16636-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Subject: [krogoth][PATCH] python-*: use https for pypi URLs
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Nov 2017 11:17:13 -0000

Several of the recipes here were using http URLs for source hosted on
pypi - pypi apparently no longer supports http so switch to https
instead.

Apply this commit [1] to krogoth branch.

[1] https://www.mail-archive.com/meta-virtualization@yoctoproject.org/msg02821.html

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 recipes-devtools/python/python-gevent_1.0.1.bb    | 2 +-
 recipes-devtools/python/python-m2crypto_0.22.3.bb | 2 +-
 recipes-devtools/python/python-pyyaml_3.11.bb     | 2 +-
 recipes-devtools/python/python-requests_2.8.1.bb  | 2 +-
 recipes-devtools/python/python-sphinx_1.3.1.bb    | 2 +-
 recipes-devtools/python/python-webob_1.4.1.bb     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-devtools/python/python-gevent_1.0.1.bb b/recipes-devtools/python/python-gevent_1.0.1.bb
index 47f1267..8ac1295 100644
--- a/recipes-devtools/python/python-gevent_1.0.1.bb
+++ b/recipes-devtools/python/python-gevent_1.0.1.bb
@@ -13,7 +13,7 @@ RDEPENDS_${PN} += "python-greenlet python-mime python-pprint python-re"
 
 SRCNAME = "gevent"
 
-SRC_URI = "http://pypi.python.org/packages/source/g/gevent/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/g/gevent/${SRCNAME}-${PV}.tar.gz"
 SRC_URI[md5sum] = "7b952591d1a0174d6eb6ac47bd975ab6"
 SRC_URI[sha256sum] = "4627e215d058f71d95e6b26d9e7be4c263788a4756bd2858a93775f6c072df43"
 
diff --git a/recipes-devtools/python/python-m2crypto_0.22.3.bb b/recipes-devtools/python/python-m2crypto_0.22.3.bb
index 95d6eec..9814d3d 100644
--- a/recipes-devtools/python/python-m2crypto_0.22.3.bb
+++ b/recipes-devtools/python/python-m2crypto_0.22.3.bb
@@ -14,7 +14,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0ccca7097c1d29fa42e75e9c15c6ff2e"
 
 SRCNAME = "M2Crypto"
-SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz \
+SRC_URI = "https://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz \
            file://m2crypto-Fix-build-with-SWIG-3.0.5.patch \
 "
 
diff --git a/recipes-devtools/python/python-pyyaml_3.11.bb b/recipes-devtools/python/python-pyyaml_3.11.bb
index cb1db8c..9a6f2f6 100644
--- a/recipes-devtools/python/python-pyyaml_3.11.bb
+++ b/recipes-devtools/python/python-pyyaml_3.11.bb
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
 
 SRCNAME = "PyYAML"
-SRC_URI = "http://pyyaml.org/download/pyyaml/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pyyaml.org/download/pyyaml/${SRCNAME}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "f50e08ef0fe55178479d3a618efe21db"
 SRC_URI[sha256sum] = "c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8"
diff --git a/recipes-devtools/python/python-requests_2.8.1.bb b/recipes-devtools/python/python-requests_2.8.1.bb
index 187f97a..d266780 100644
--- a/recipes-devtools/python/python-requests_2.8.1.bb
+++ b/recipes-devtools/python/python-requests_2.8.1.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=58c7e163c9f8ee037246da101c6afd1e"
 
 SRCNAME = "requests"
 
-SRC_URI = "http://pypi.python.org/packages/source/r/requests/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/r/requests/${SRCNAME}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "a27ea3d72d7822906ddce5e252d6add9"
 SRC_URI[sha256sum] = "84fe8d5bf4dcdcc49002446c47a146d17ac10facf00d9086659064ac43b6c25b"
diff --git a/recipes-devtools/python/python-sphinx_1.3.1.bb b/recipes-devtools/python/python-sphinx_1.3.1.bb
index fe8ad94..d8cef30 100644
--- a/recipes-devtools/python/python-sphinx_1.3.1.bb
+++ b/recipes-devtools/python/python-sphinx_1.3.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6dd095eaa1e7a662b279daf80ecad7e6"
 PR = "r0"
 SRCNAME = "Sphinx"
 
-SRC_URI = "http://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "8786a194acf9673464c5455b11fd4332"
 SRC_URI[sha256sum] = "1a6e5130c2b42d2de301693c299f78cc4bd3501e78b610c08e45efc70e2b5114"
diff --git a/recipes-devtools/python/python-webob_1.4.1.bb b/recipes-devtools/python/python-webob_1.4.1.bb
index 18b3806..e566363 100644
--- a/recipes-devtools/python/python-webob_1.4.1.bb
+++ b/recipes-devtools/python/python-webob_1.4.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5
 PR = "r0"
 SRCNAME = "WebOb"
 
-SRC_URI = "http://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "a5c6e8ba5431756e6a5d5ec56047ec94"
 SRC_URI[sha256sum] = "12f8b98390befc47336d2c0e5bad9cc48609d808eabb3f8675dc1027a3a9e9db"
-- 
2.14.2


