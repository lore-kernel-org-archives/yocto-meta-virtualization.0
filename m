Return-Path: <jpuhlman@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9E7F3E02E4E; Tue, 12 Jun 2018 15:37:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com
	[74.125.82.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11189E02E4B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 12 Jun 2018 15:37:17 -0700 (PDT)
Received: by mail-ot0-f169.google.com with SMTP id q17-v6so732313otg.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 12 Jun 2018 15:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=R8Ggcdgv6ugzBpcmdlegh0qqEikXXs/P1n4BRSKc9yw=;
	b=CvcTdL9N4Bdy90YnKD0yw9DoBKyFA1pm78JevAsaEZ5lp2/0P+BZB1slWJ8m6SoWPZ
	jVZGjMxJl4uof//Xz/sJn1KF6Kjv36J1JIVJkax5BOOysASyDnYDSGOk0+QVKsrWVmvW
	wuUYbjPPfY9zRopi08oxUrTP//ReJ2MonG74/lCmwySovGnnb1ufYDlaoZpdcn+LLitY
	W7YhJwgY+1oE0aCD43aU6UJeDVXVvgLJCZ4dBwFn5+UTHSh5/AU9bUHwnoq8zBivZAbW
	JSxTueN3w3c16qKreBlJp3OI/k1OQ3r1YsnN0S6NYZPDgnDzWb0GTOHig6cQxEmnTIOY
	nOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=R8Ggcdgv6ugzBpcmdlegh0qqEikXXs/P1n4BRSKc9yw=;
	b=eRrKvwJ4frOuRvEoS6Bn0z/EcvquOR5Hp3G8ZO3LmdZMyB0uPShCVGvBhUBENAePD3
	suCA16z/Mn8ckCmiraFoJ+PthQ+CPaDX5FXZL47GwHD/Im5vJFDA2nfm67eEz5/v/tbu
	ZtbgWfgDOBXbB8LKVoGWTSM7mS9DgOOsezHj56IwqMtgmGF9RnvvxdA0t8/dKWBvW0n+
	kAATa3Fx0I+yEk7nulnYj3RnhYmh1E2g0bW5vPzS+/OQTu7LSgFvHwVS12SxSl21cuA/
	xEgWIsDT1Al5ay9KkV7c+EdxFQSeDd47Hu6+ytJsoSyMzK+kVxylmimNbFNIMa/Jky1E
	YmAQ==
X-Gm-Message-State: APt69E2UdShNBmLTfpiBw8MBV5mOgqUN0axE30aael9CcBrXrz5+uTSv
	Bu0/1OrjugglJS+vra8ifhu6cJF7
X-Google-Smtp-Source: ADUXVKKH+O5GwAVhcqBWScIVprfP8MLTo4Uuuj85V5C774pUwv1pzLvO5N4MUJsHVlV47Y9zSONg+g==
X-Received: by 2002:a9d:2e3a:: with SMTP id
	q55-v6mr1599339otb.361.1528843036950; 
	Tue, 12 Jun 2018 15:37:16 -0700 (PDT)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	k19-v6sm1284573ote.0.2018.06.12.15.37.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 15:37:16 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 12 Jun 2018 15:37:03 -0700
Message-Id: <1528843023-21625-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.2
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH] Check for qemu pkgconfig before qemu.conf modify
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
X-List-Received-Date: Tue, 12 Jun 2018 22:37:24 -0000

/etc/libvirt/qemu.conf doesn't exist if qemu is disabled causing a
build failure.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 recipes-extended/libvirt/libvirt_4.3.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_4.3.0.bb b/recipes-extended/libvirt/libvirt_4.3.0.bb
index ef51b9e..5cae02b 100644
--- a/recipes-extended/libvirt/libvirt_4.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_4.3.0.bb
@@ -266,8 +266,10 @@ do_install_append() {
 	fi
 
 	# disable seccomp_sandbox
-	sed -i '/^#seccomp_sandbox = 1/aseccomp_sandbox = 0' \
-	    ${D}${sysconfdir}/libvirt/qemu.conf
+        if ${@bb.utils.contains('PACKAGECONFIG', 'qemu', 'true', 'false', d)}; then
+	   sed -i '/^#seccomp_sandbox = 1/aseccomp_sandbox = 0' \
+	       ${D}${sysconfdir}/libvirt/qemu.conf
+        fi
 
 	# Add hook support for libvirt
 	mkdir -p ${D}/etc/libvirt/hooks
-- 
2.6.2


