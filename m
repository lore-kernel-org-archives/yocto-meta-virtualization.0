Return-Path: <fabio.berton@ossystems.com.br>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21A3EE00C0E; Tue, 28 Nov 2017 03:15:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCE69E00B1E
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Nov 2017 03:15:10 -0800 (PST)
Received: by mail-qk0-f193.google.com with SMTP id v137so36495299qkb.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Nov 2017 03:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=fM4QoeIk2JErhgOwnQfAmgrW7F6740EEcFIPK+hF3Bk=;
	b=cMGNcoANfV8ZEEXpYhePyQ6GfOuv79zR9rROqPSu0hAGtQLk5V07dDuOjvBs90KerR
	DT8+uUpk2i5g6CHUDz2axM8YvEkTQH9GbO5ICrvOPQvZ/CBO81dgobiyMYmSllZdLzCZ
	+wA8ma+ZQSoYvC1gf9nj4biE3d/WOcRvbdXyrzrHZpOMVAOl78S+KNuJn67kH3om8YM8
	Zzzfh8o639Iwet7Zk8WZj0HlyR0j1zlwTgcXnWwRUdULOclO9YSN3brO8tpFEKOYdknk
	mWuiY13K97CwfSXc357BIJOivX+GWoBM1YyIP+Ptg5gL2/Jrc8XcNmdvduaHIFI+tS0U
	BPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=fM4QoeIk2JErhgOwnQfAmgrW7F6740EEcFIPK+hF3Bk=;
	b=SgNQSm7YLXWMLvLC7FfGO7oD7693zoUJgnJEmIiEtqkPLyLAkmMO0TbDB5ONy1bh4d
	OnbLkFKSX8a5j17kL7jnBmEmZirOYLzYoLj52RWhr3dnagqLoAKryQB6z4bgPJ3BLJ3D
	BihxytLNVWLBTm9LnSpBEqWre+Qo0R4OAydpf3o9nSVWI2qFdaVqWJxW3bbeRr6US9El
	bNGJvOdV1h0vCm0ER03iPLDnfKT1vPzYFTDWRWtxSYe9I2veNi8uuplomwlbVQub8MGg
	DbyaUmUYuW77OGHeL4b01unRrBduewtUTyZyneXsNBu+DN+kqopBNwysA9BoPjPbkG1Y
	5zCA==
X-Gm-Message-State: AJaThX7j748RXzoQ0v+jx8Kx1GH3vgIHxNj64N/1OF3/Ts3L6KC7Mzhv
	FWx1JG+zXdctMCIWqXSqTfwJ0u9R
X-Google-Smtp-Source: AGs4zMZ0rumuIzwr5gIokqdbSyqG6254VUiCbQxdn4KMLs/X5Vy9CD7YXAvCnhmkZg/6OMrOIu2Rqw==
X-Received: by 10.55.22.7 with SMTP id g7mr7869928qkh.82.1511867709490;
	Tue, 28 Nov 2017 03:15:09 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	u26sm22056807qtb.1.2017.11.28.03.15.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Nov 2017 03:15:08 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: meta-virtualization@yoctoproject.org
Date: Tue, 28 Nov 2017 09:14:43 -0200
Message-Id: <20171128111443.16257-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Subject: [pyro][PATCH] python-*: use https for pypi URLs
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
X-List-Received-Date: Tue, 28 Nov 2017 11:15:12 -0000

Several of the recipes here were using http URLs for source hosted on
pypi - pypi apparently no longer supports http so switch to https
instead.

Apply this commit [1] to pyro branch.

[1] https://www.mail-archive.com/meta-virtualization@yoctoproject.org/msg02821.html

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 recipes-devtools/python/python-gevent_1.0.1.bb    | 2 +-
 recipes-devtools/python/python-m2crypto_0.22.3.bb | 2 +-
 recipes-devtools/python/python-pyyaml_3.11.bb     | 2 +-
 recipes-devtools/python/python-requests_2.8.1.bb  | 2 +-
 recipes-devtools/python/python-sphinx_1.4.1.bb    | 2 +-
 recipes-devtools/python/python-webob_1.6.0.bb     | 2 +-
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
diff --git a/recipes-devtools/python/python-sphinx_1.4.1.bb b/recipes-devtools/python/python-sphinx_1.4.1.bb
index 835b369..b4ae86b 100644
--- a/recipes-devtools/python/python-sphinx_1.4.1.bb
+++ b/recipes-devtools/python/python-sphinx_1.4.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=72f034adc6f7b05b09bc00d1a05bb065"
 PR = "r0"
 SRCNAME = "Sphinx"
 
-SRC_URI = "http://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "4c4988e0306a04cef8dccc384281e585"
 SRC_URI[sha256sum] = "c6871a784d24aba9270b6b28541537a57e2fcf4d7c799410eba18236bc76d6bc"
diff --git a/recipes-devtools/python/python-webob_1.6.0.bb b/recipes-devtools/python/python-webob_1.6.0.bb
index 71c74ff..93f2acf 100644
--- a/recipes-devtools/python/python-webob_1.6.0.bb
+++ b/recipes-devtools/python/python-webob_1.6.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5
 PR = "r0"
 SRCNAME = "WebOb"
 
-SRC_URI = "http://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "089d7fc6745f175737800237c7287802"
 SRC_URI[sha256sum] = "63d262d8f61b516321f786879c9277fa2209f7f57eb47b537eeecfea383d55b7"
-- 
2.14.2


