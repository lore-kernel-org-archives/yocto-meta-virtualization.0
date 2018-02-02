Return-Path: <ricardo@opensourcefoundries.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BB816E00E08; Thu,  1 Feb 2018 21:14:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.193 listed in list.dnswl.org]
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2EA60E00D6A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  1 Feb 2018 21:14:38 -0800 (PST)
Received: by mail-qk0-f193.google.com with SMTP id d125so1991374qkg.13
	for <meta-virtualization@yoctoproject.org>;
	Thu, 01 Feb 2018 21:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=rfrkuzqXyMRNWe3xt3a8qkwhSv8wRHurMphxrtEJvwI=;
	b=om8mheygO/7uZpcUu4Wu2ZiW59m3GS4Iigl0kf6kHqzvZG1BKn8CMalXA+jD4C6zEG
	kqqSXZKrT6q9P9jGkU35nQ5ei6YdG8o/+RaOggyJT0pL7LofVt+dEUv1GQtYT1MJNbVd
	ntaqvZ3O+rvgZrREvTs+va3+tNr/xyq/Plp4we+bQmSzpXWwuof+jDXi6q6uZ1sKpg9j
	MZ6tqfsiFEXFr0bIAqaFWt6lrohUQNZyr1OkxLC71kjUxnazCbDNvzrD8x464Xzvs4Yo
	Pz6x3KRu/35OgFDl/dgEO3W5cAKbGyXN5dafN5mKSzri6Bern4jyVklKPRgN/lzS/AAj
	KS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rfrkuzqXyMRNWe3xt3a8qkwhSv8wRHurMphxrtEJvwI=;
	b=omicPkySkvXNrZ5iOCYwvcnNxhcl6MTUWCJnuBfTy9b47PVlovEuro7RMBzwZcjBY9
	Luo8Xb1GwyioSjggcrNVeEE6k0E8OZXUrQIJNcVN/+PIIUurbSHYOqoI3+dK2KcDqmEe
	QndiiGxAw/FcjyMMpdJPA3eotpn/9aNjhZ9LI2BlFhnGk6XvKela6uck7YCpEn347lhS
	k1KKrQ/CtKd6a2PElMAnkpEzpdoSb/+ynbPzyBxYCM2PyjCFU8b16d9/A95yr5MD7VbT
	9Hr6ZPR6Zn5pXIKTSnlsvDzs666dBLa2QCLmzhbThovuL6tXNEqW6mMfgEJHp+8hDE3K
	wKXQ==
X-Gm-Message-State: AKwxytfp1efZY0FvUMgY4Ir/RDBltirMEwrXYZoBGiXxOSkj4/QpuwLX
	+b7I/IxCljI8yBZMuPqvbuvSMdBZjQ==
X-Google-Smtp-Source: AH8x2277DqI//ktmMWN2O0JmWQnQAjxOLGtETDe3ube8fP3wuHNsq1HOzFwq/o4JeKnUZbK7r0s3aA==
X-Received: by 10.55.93.194 with SMTP id r185mr18443492qkb.109.1517548477741; 
	Thu, 01 Feb 2018 21:14:37 -0800 (PST)
Received: from localhost.localdomain ([189.4.104.170])
	by smtp.gmail.com with ESMTPSA id
	q186sm279102qkf.76.2018.02.01.21.14.35
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Feb 2018 21:14:36 -0800 (PST)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  2 Feb 2018 03:02:23 -0200
Message-Id: <1517547743-30140-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] lxc: set systemdsystemunitdir with systemd
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
X-List-Received-Date: Fri, 02 Feb 2018 05:14:39 -0000

systemd unit dir can be customized by the distro (e.g. usrmerge), so
make sure the correct unit dir path is set on configure.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 recipes-containers/lxc/lxc_2.0.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
index 651eb72..d8607f8 100644
--- a/recipes-containers/lxc/lxc_2.0.8.bb
+++ b/recipes-containers/lxc/lxc_2.0.8.bb
@@ -60,6 +60,7 @@ EXTRA_OECONF += "--enable-log-src-basename"
 CFLAGS_append = " -Wno-error=deprecated-declarations"
 
 PACKAGECONFIG ??= "templates \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
 "
 PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
@@ -68,6 +69,7 @@ PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparm
 PACKAGECONFIG[templates] = ",,, ${PN}-templates"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
 PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
 PACKAGECONFIG[python] = "--enable-python,--disable-python,python3,python3-core"
 PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua,lua"
 
-- 
2.7.4


