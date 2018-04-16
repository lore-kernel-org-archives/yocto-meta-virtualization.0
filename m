Return-Path: <akuster808@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69EFAE00BFD; Mon, 16 Apr 2018 07:34:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.160.68 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (akuster808[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 583A8E00843
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Apr 2018 07:34:48 -0700 (PDT)
Received: by mail-pl0-f68.google.com with SMTP id z12-v6so2676424plo.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Apr 2018 07:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dHrIbyW6VVJByBbK45JrWEDYCBgHeQmycNYCST9QID0=;
	b=alMH/7AtBGwOzEr9Ao/X3iH8icLH8oiGNuDorMtEV/pKd2uRqpQ15z3BcEji0jrdjx
	j/lSmhSonMEy4atmVGclt8mJYXj+n/p/IZFNY3DdNSZAnoINGhdaTx8Ll6CRztcCaoTI
	0YYeYJW5k65w9TdEsaayziRnP6ysheAE8ckrVCWi9eCsL0m6G1G8igJUuFhZjnC/u+Hj
	FrmdJQcYX7+ZXPeQoVvPPLHGlaT1KoGtoxNF9Tu1pyz3qqcz60qsndXiKrsKjmDmK8vg
	htv7EqiybpHZ86n5gteOn6hRVb4VCSlJsr7un5/dAuZvqFKW+nybkov5uNC4bEANBAxd
	0TDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dHrIbyW6VVJByBbK45JrWEDYCBgHeQmycNYCST9QID0=;
	b=eUQV0dKTKfYrbLDXNzBRQ3U4jgFu2DekqoEwDchgQGHueXuEA7qhSrfjPzC2eikLY/
	fNh0mkHnp47MmK2MGUYOO9EuWhDfErorpZz7Fo3+LifKMnhNv5aieY79H0fLOteSaBxg
	ImcHZlS9xWbaCyXMgzqAIk5bUzpySqfUxTd4IBgxLoQ/oZGTiUzyKnx+nYzA4p4B0lSB
	ALgGhOiGv1B/X0+AFGAby4POdwDAsidtOkFtcmOMJQE6eKLOuEygkTjMPTmJOPQ7T3eO
	Fdo9TSLjW5dHL0aWzjbYC91dL9jdOtaECp0yfLI8gqGfqhO+u/njBC7UoUNKgjU3JtFJ
	87xw==
X-Gm-Message-State: ALQs6tA8Q7BfNQLkIc1VP5qXmxm4s3GKBHi1BEnQA7zm4tuea1CjoZYy
	PLuIOGep+iqRHkk8RW6GMsU=
X-Google-Smtp-Source: AIpwx48/1/MRC5G5yfiE9uZX8MCyUDHUQex7E7/WiXDsw/rNiswu5A/5YLKD/GBJZNtBsj/bbGd1dw==
X-Received: by 2002:a17:902:14b:: with SMTP id
	69-v6mr13793013plb.184.1523889287891; 
	Mon, 16 Apr 2018 07:34:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s
	([2601:202:4000:1184:846b:ecf3:2137:c7c5])
	by smtp.gmail.com with ESMTPSA id i2sm1015100pgo.57.2018.04.16.07.34.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Apr 2018 07:34:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: "Armin Kuster" <akuster@akuster-ThinkPad-T460s>
Received: by akuster-ThinkPad-T460s (sSMTP sendmail emulation);
	Mon, 16 Apr 2018 07:34:42 -0700
To: akuster808@gmail.com,
	meta-virtualization@yoctoproject.org
Date: Mon, 16 Apr 2018 07:34:41 -0700
Message-Id: <1523889281-30520-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] sysvinit: fix DISTRO decode
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
X-List-Received-Date: Mon, 16 Apr 2018 14:34:49 -0000

the yocto-check-layer failed with:

      Dependency on variable DISTRO_FEATURES_LIBC was added
      Variable do_install value changed:
      @@ -32,3 +32,7 @@
               done
               echo "" >> ${D}${sysconfdir}/inittab
           fi
      +	if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
      +		echo "" >> ${D}${sysconfdir}/inittab
      +		echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
      +	fi

used idea from meta-selinux

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend | 7 +------
 recipes-core/sysvinit/sysvinit-inittab_xen.inc      | 4 ++++
 2 files changed, 5 insertions(+), 6 deletions(-)
 create mode 100644 recipes-core/sysvinit/sysvinit-inittab_xen.inc

diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend b/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
index 1b89aec..8c08832 100644
--- a/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
+++ b/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
@@ -1,6 +1 @@
-do_install_append() {
-	if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
-		echo "" >> ${D}${sysconfdir}/inittab
-		echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
-	fi
-}
+require ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'sysvinit-inittab_xen.inc', '', d)}
diff --git a/recipes-core/sysvinit/sysvinit-inittab_xen.inc b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
new file mode 100644
index 0000000..9d0589c
--- /dev/null
+++ b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
@@ -0,0 +1,4 @@
+do_install_append() {
+                echo "" >> ${D}${sysconfdir}/inittab
+                echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
+}
-- 
2.7.4


