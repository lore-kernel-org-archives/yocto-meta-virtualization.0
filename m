Return-Path: <jpuhlman@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6DC42E01281; Wed, 13 Jun 2018 16:35:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.83.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E47EE0120F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Jun 2018 16:35:46 -0700 (PDT)
Received: by mail-pg0-f68.google.com with SMTP id z1-v6so1997169pgv.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Jun 2018 16:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=OM7jOeyymByFrT9Fjg6ONDdorCVJkzjtP32Oer9+PA0=;
	b=FJHmEZ7g+6T6Ua9w352XMaF8CYt4jYuHvyLhpN/sr5zE+G0a8F089bGv3VEDQQHfYs
	HL5OViPaTNwtTT4O812QHGXjyQtd5tkhqsv7b4qzrqo1FaMB08oXLDK0GEdPQ7RLSfxi
	twLf3mUNSZDS39cXetSXteylIlf3AwIXl7mO1hr1xTOGBxeJ7A0XXHcV6dq+iTdfEuJw
	GdaTYi6aGUOsP96pLM3Kj9oGXn5mwQTUTygDLZhvYmw3udCHMwFx/wvvkMD4JH8VTYG9
	1pvs2a7Z5Guagogo+ZS2ZC2xXFWdGZfSJpEE3DFst8dVcZoBkQhqWUEWq6vxGJfObVEw
	nPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OM7jOeyymByFrT9Fjg6ONDdorCVJkzjtP32Oer9+PA0=;
	b=tGqh5JesETzWiWSbWpP+ObqXkxgBSl2Y70r47lZAyjwa2W1tBAmc6nCVfdLJnTxOTF
	E3LvQrkqkb1EkhHXMuFacCAgMFwalDDwj/ysHnyWo7rylcZioNzyhOc64ABCa8c2ysR3
	aYueKpOaH3E5lU6AXFlND/dpuXDms224nZRJ4CeBu+I1gNdZZu2WhIkTalg9D/I4Z0iL
	js9LY2IMXTT5AiKhrylfLMH8Ui08mu4DRlUSTiHhdOXon8nsEDhyE8FOd8DvMZ+mGHEJ
	18pL2VNwm1XkpLLBAvpvLrQsqt7/esb9LGLr2Q1rRpbW22BcR/0YGJmOvY6xrvDYJrGI
	sh5A==
X-Gm-Message-State: APt69E1g/0/dT74lShaj7DoF8Oco3hpHxOSrz8Zu3kVZLki5XBHl+7Tx
	qWgfoeoseEIf/geUtvNr60Eal4hqRZA=
X-Google-Smtp-Source: ADUXVKIqvDNR9gnS+2E2t90w522V/74aFXtcDdMKOtJAxwwwnPzi/EGk7QYxhspyXURYMb/zrgCuUw==
X-Received: by 2002:a63:618e:: with SMTP id
	v136-v6mr213084pgb.100.1528932945741; 
	Wed, 13 Jun 2018 16:35:45 -0700 (PDT)
Received: from jptest02.mvista.com (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	o87-v6sm6056979pfa.106.2018.06.13.16.35.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 16:35:44 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 13 Jun 2018 16:32:53 -0700
Message-Id: <20180613233253.18859-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.11.1
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH] libvirt: Check for qemu.conf before modifying
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
X-List-Received-Date: Wed, 13 Jun 2018 23:35:48 -0000

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 recipes-extended/libvirt/libvirt_4.3.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_4.3.0.bb b/recipes-extended/libvirt/libvirt_4.3.0.bb
index ef51b9e..edd5261 100644
--- a/recipes-extended/libvirt/libvirt_4.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_4.3.0.bb
@@ -266,8 +266,10 @@ do_install_append() {
 	fi
 
 	# disable seccomp_sandbox
-	sed -i '/^#seccomp_sandbox = 1/aseccomp_sandbox = 0' \
-	    ${D}${sysconfdir}/libvirt/qemu.conf
+        if [ -e ${D}${sysconfdir}/libvirt/qemu.conf ] ; then
+	   sed -i '/^#seccomp_sandbox = 1/aseccomp_sandbox = 0' \
+	       ${D}${sysconfdir}/libvirt/qemu.conf
+        fi
 
 	# Add hook support for libvirt
 	mkdir -p ${D}/etc/libvirt/hooks
-- 
2.11.1


