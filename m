Return-Path: <akuster808@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1EE4E00BFD; Fri, 20 Apr 2018 07:35:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.192.195 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (akuster808[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A993E00B49
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Apr 2018 07:35:00 -0700 (PDT)
Received: by mail-pf0-f195.google.com with SMTP id o16so4374110pfk.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Apr 2018 07:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9KYv0/baJyFMxa5kp0s2Xp9/ytDmQZH8bR2QISDvEP8=;
	b=NKdwKuuOUENUVbT8pcZKboJDUbPQHA9Yeq52oaVX+anNrBkNyLDlEY9uwJOOKM3Xto
	LH+l0HFDwd2pnMFgAOM1OttfSeGHyO6/yMI+Ou44jnyWvGhgNl32u/3730Xgl+BNhT7H
	Hm01P0GXudm2FwgZ1+67xXdeFiYGLSbyvIYbvLarAFoKau2PLgPuNncV2//keOt5d4Nw
	ths53FLoLp5WxCb1caQ5ICwAePqoEWbbAqZJexBN2CNCVyAijeb3JwoQUQfSHoJyPZ9l
	mkuyo78X+1DUViBWOCaAQrp+yQyvy8nOgOq+tSB/4WEo65MYQX65s8pza/PKVdv8s6JH
	PKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9KYv0/baJyFMxa5kp0s2Xp9/ytDmQZH8bR2QISDvEP8=;
	b=jisKm3klyrmG0fzHLfFHw/BzzB9P9LoH7T58MZX1Xipmrykr/NRXulwEVzAN4njzqQ
	EDeXBnVM2g5kw9SJl7hpqchU0EPPaF0jAwzR0PW6Vr0hLCyyxKSvQGaVOw9tYSkGsd1I
	PNo6kbAsI89CzUDnZv7yYeRIjs9QT8H9596T1AP1GetU2ZGcZ79pH9sLUmpgV7Ds17m4
	oCmfC6WRYmduGV/XLdgNmnMOqy9z+O0nVehydOyGZrC9Zp0S2A8uLhG+oP6SkgN657Ed
	lkAi7dBB4UakOxzyOaQVK3VHLKTkzczajnVPpsgcOr9IzqUJWXpAg8L6OCut06yENM+m
	o0Fw==
X-Gm-Message-State: ALQs6tA6tx1X425G4e8nndK1zu0vsPRulGoboLhPVFAC1M0YAdIAbbzY
	XhXE7J/VBSE1DPsfOoHlQzJaoQ==
X-Google-Smtp-Source: AIpwx4/oO0/NM9mA5MlsF2X1jALiZk5muNFXXZIe7mGX3zuUGF4OvNOfy4LCVLKTuG6HxsbMP1Jthw==
X-Received: by 10.101.86.8 with SMTP id l8mr8517769pgs.182.1524234900685;
	Fri, 20 Apr 2018 07:35:00 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-71-197-71-93.hsd1.ca.comcast.net.
	[71.197.71.93])
	by smtp.gmail.com with ESMTPSA id b3sm2345084pga.7.2018.04.20.07.34.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Apr 2018 07:35:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	meta-virtualization@yoctoproject.org
Date: Fri, 20 Apr 2018 07:34:56 -0700
Message-Id: <20180420143456.31128-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180420143456.31128-1-akuster808@gmail.com>
References: <20180420143456.31128-1-akuster808@gmail.com>
Subject: [PATCH 2/2] refactor for YP Compat for PV changes
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
X-List-Received-Date: Fri, 20 Apr 2018 14:35:02 -0000

Only include our versions of recipes if virtualiztions is in
DISTRO_FEATURE

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 conf/distro/include/meta-virt-default-versions.inc | 9 +++++++++
 conf/layer.conf                                    | 2 ++
 recipes-devtools/python/python-blinker_1.3.bb      | 2 ++
 recipes-devtools/python/python-gevent_1.0.1.bb     | 4 +++-
 recipes-devtools/python/python-m2crypto_0.22.3.bb  | 2 ++
 recipes-devtools/python/python-pyyaml_3.11.bb      | 2 ++
 recipes-devtools/python/python-redis_2.10.3.bb     | 2 ++
 recipes-devtools/python/python-sqlalchemy_1.1.5.bb | 2 ++
 recipes-devtools/python/python-werkzeug_0.10.4.bb  | 2 ++
 9 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 conf/distro/include/meta-virt-default-versions.inc

diff --git a/conf/distro/include/meta-virt-default-versions.inc b/conf/distro/include/meta-virt-default-versions.inc
new file mode 100644
index 0000000..27e7b90
--- /dev/null
+++ b/conf/distro/include/meta-virt-default-versions.inc
@@ -0,0 +1,9 @@
+# Meta-virtuailization PREFERED_VERSION
+
+PREFERRED_VERSION_python-blinker = "1.3"
+PREFERRED_VERSION_python-gevent = "1.0.1"
+PREFERRED_VERSION_python-m2crypto = "0.22.3"
+PREFERRED_VERSION_python-pyyaml = "3.11"
+PREFERRED_VERSION_python-redis = "2.10.3"
+PREFERRED_VERSION_python-sqlalchemy = "1.1.5"
+PREFERRED_VERSION_python-werkzeug = "0.10.4"
diff --git a/conf/layer.conf b/conf/layer.conf
index 4233d39..fa2e015 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -26,3 +26,5 @@ PREFERRED_PROVIDER_virtual/containerd ?= "containerd-opencontainers"
 # Sanity check for meta-virtualization layer.
 # Setting SKIP_META_VIRT_SANITY_CHECK to "1" would skip the bbappend files check.
 INHERIT += "sanity-meta-virt"
+
+require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'meta-virt-default-versions.inc', '', d)}
diff --git a/recipes-devtools/python/python-blinker_1.3.bb b/recipes-devtools/python/python-blinker_1.3.bb
index 24e19b5..8abb9c0 100644
--- a/recipes-devtools/python/python-blinker_1.3.bb
+++ b/recipes-devtools/python/python-blinker_1.3.bb
@@ -18,5 +18,7 @@ SRC_URI[sha256sum] = "6811010809262261e41ab7b92f3f6d23f35cf816fbec2bc05077992eeb
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
+DEFAULT_PREFERENCE = "-1"
+
 inherit setuptools
 
diff --git a/recipes-devtools/python/python-gevent_1.0.1.bb b/recipes-devtools/python/python-gevent_1.0.1.bb
index 7f1d262..8cd1388 100644
--- a/recipes-devtools/python/python-gevent_1.0.1.bb
+++ b/recipes-devtools/python/python-gevent_1.0.1.bb
@@ -25,4 +25,6 @@ SRC_URI += "file://gevent-allow-ssl-v2-or-v3-certificates.patch"
 # so always force a cross compile
 do_configure_append() {
 	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/libev/configure
-}
\ No newline at end of file
+}
+
+DEFAULT_PREFERENCE = "-1"
diff --git a/recipes-devtools/python/python-m2crypto_0.22.3.bb b/recipes-devtools/python/python-m2crypto_0.22.3.bb
index 2c2625d..e151dcc 100644
--- a/recipes-devtools/python/python-m2crypto_0.22.3.bb
+++ b/recipes-devtools/python/python-m2crypto_0.22.3.bb
@@ -22,6 +22,8 @@ SRC_URI += " \
 SRC_URI[md5sum] = "573f21aaac7d5c9549798e72ffcefedd"
 SRC_URI[sha256sum] = "6071bfc817d94723e9b458a010d565365104f84aa73f7fe11919871f7562ff72"
 
+DEFAULT_PREFERENCE = "-1"
+
 inherit setuptools pypi
 
 DEPENDS += "openssl swig-native"
diff --git a/recipes-devtools/python/python-pyyaml_3.11.bb b/recipes-devtools/python/python-pyyaml_3.11.bb
index cb1db8c..ecb1719 100644
--- a/recipes-devtools/python/python-pyyaml_3.11.bb
+++ b/recipes-devtools/python/python-pyyaml_3.11.bb
@@ -25,6 +25,8 @@ SRC_URI[sha256sum] = "c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
+DEFAULT_PREFERENCE = "-1"
+
 inherit setuptools
 
 DEPENDS += "libyaml python-cython-native"
diff --git a/recipes-devtools/python/python-redis_2.10.3.bb b/recipes-devtools/python/python-redis_2.10.3.bb
index 9eda8a5..2ef2b6b 100644
--- a/recipes-devtools/python/python-redis_2.10.3.bb
+++ b/recipes-devtools/python/python-redis_2.10.3.bb
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "a4fb37b02860f6b1617f6469487471fd086dd2d38bbce640c2055862b9
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
+DEFAULT_PREFERENCE = "-1"
+
 inherit setuptools
 
 RDEPENDS_${PN} = "redis"
diff --git a/recipes-devtools/python/python-sqlalchemy_1.1.5.bb b/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
index 63caeb4..f22d272 100644
--- a/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
+++ b/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
@@ -13,4 +13,6 @@ SRC_URI[sha256sum] = "68fb40049690e567ebda7b270176f5abf0d53d9fbd515fec4e43326f60
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
+DEFAULT_PREFERENCE = "-1"
+
 inherit setuptools
diff --git a/recipes-devtools/python/python-werkzeug_0.10.4.bb b/recipes-devtools/python/python-werkzeug_0.10.4.bb
index 763e5b9..5f3e01f 100644
--- a/recipes-devtools/python/python-werkzeug_0.10.4.bb
+++ b/recipes-devtools/python/python-werkzeug_0.10.4.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "9d2771e4c89be127bc4bac056ab7ceaf0e0064c723d6b6e195739c3af4
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
+DEFAULT_PREFERENCE = "-1"
+
 inherit setuptools
 
 RDEPENDS_${PN} += "python-io \
-- 
2.14.1


