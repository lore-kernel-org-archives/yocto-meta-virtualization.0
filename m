Return-Path: <koen@dominion.thruhere.net>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 612E1E00C80; Mon, 23 Jul 2018 07:48:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.208.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE6ADE00C74
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jul 2018 07:48:57 -0700 (PDT)
Received: by mail-ed1-f66.google.com with SMTP id e19-v6so1207870edq.7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jul 2018 07:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n7zw91sB7I9CUIcqMd7yNOeujWmkWpOHL/eYYFe6d4o=;
	b=wx0WZqb6wYhoADzS/h74V9Ki3W92p+sUZDegEOxvVzFK5Q41+wz0hwZnrcGEbf/sEJ
	7oaZ4o+wN78ijrg+iwhaBZGsHlyhBDMbvHq6D9gGCW+8COEvwBvCzvNwEFm30rJEbwXn
	V7EfuINm3HCV7pdJwxTnVEKKd5F0+7Ef7K55jzsuIQfTLLo32S/B5ol6JuWjdrUcsIqU
	GOcalfcp9x5w47NkjvrsG6ZCxXJYdZgS2iWw5kVNvK2U/vay1DKumiDhsj6hsz7cpcPq
	CcylziPZ1w+q8yOoa0wsAg46x0GdIlEmjXx4hQmYnar4gCNHjlwDze5XcRrBzunX7m/X
	j/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n7zw91sB7I9CUIcqMd7yNOeujWmkWpOHL/eYYFe6d4o=;
	b=TFUX8NDk0K1Eq7XG920ChRfB67m9Bx2eFLgIRwYEwhd7+JNcfpAXnmffLdUv7ehu1S
	AdEfaksnKpTk6amkpd9pi3JxDFsNNoqC6IB+2OLa2Rk0hYwGZGZ2dnlyVcWO8JBlAiwL
	PaI5+9iq8xuRvs9d1p1XpvHmOOqWJZc0C0mrSDTE6rDwegpyzITOoEfihDfSYpmXsJK7
	RCMijVlcEjf/sVfeUkPRPrnC5JjwnePIpVnf7/PFbg30ZB3l+8/uS7/U5XjZKYNUJXrA
	XGkYUROGG65gxr5N6hatls/luH4lmEXHPk4VPFWK0n/qRT+4h11qZdUnv49/mXeaBTbX
	sCgQ==
X-Gm-Message-State: AOUpUlEKtBhFCecrEW5TXssYhOTglu89Y5BL7l9hPnOuN5XCliPCzNl+
	gNGqn3EpUP/Qp4hqoo5xeeDUPJSI5dY=
X-Google-Smtp-Source: AAOMgpdRyW85Uc6SEw3lUkhoH7HAX/ayDmlanXrQXS8oDlbQyd6icpXZK5mAO+G86l8KACd+UqFhZw==
X-Received: by 2002:a50:ae98:: with SMTP id
	e24-v6mr14065043edd.16.1532357336908; 
	Mon, 23 Jul 2018 07:48:56 -0700 (PDT)
Received: from localhost.localdomain ([82.163.40.65])
	by smtp.gmail.com with ESMTPSA id
	w26-v6sm4479189eds.7.2018.07.23.07.48.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 07:48:55 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Google-Original-From: Koen Kooi <koen.kooi@linaro.org>
To: meta-virtualization@yoctoproject.org
Date: Mon, 23 Jul 2018 16:48:49 +0200
Message-Id: <20180723144850.17279-3-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20180723144850.17279-1-koen.kooi@linaro.org>
References: <20180723144850.17279-1-koen.kooi@linaro.org>
Cc: Raymond Danks <ray.danks@se-eng.com>, Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 3/4] kubernetes: package remaining files into PN-misc
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
X-List-Received-Date: Mon, 23 Jul 2018 14:48:58 -0000

A previous commit changed do_installed to install everything, not just
kube*, adjust PACKAGES to keep ${PN} empty as it was before.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index f23721c..bb80c3f 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -14,6 +14,7 @@ DEPENDS += "rsync-native \
             coreutils-native \
            "
 
+PACKAGES =+ "${PN}-misc"
 PACKAGES =+ "kubeadm"
 PACKAGES =+ "kubectl"
 PACKAGES =+ "kubelet"
@@ -100,11 +101,13 @@ SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','kubelet','
 SYSTEMD_SERVICE_kubelet = "${@bb.utils.contains('DISTRO_FEATURES','systemd','kubelet.service','',d)}"
 SYSTEMD_AUTO_ENABLE_kubelet = "enable"
 
+FILES_${PN}-misc = "${bindir}"
 FILES_kubeadm = "${bindir}/kubeadm ${systemd_unitdir}/system/kubelet.service.d/*"
 FILES_kubectl = "${bindir}/kubectl"
 FILES_kube-proxy = "${bindir}/kube-proxy"
 FILES_kubelet = "${bindir}/kubelet ${systemd_unitdir}/system/kubelet.service ${sysconfdir}/kubernetes/manifests/"
 
+
 INHIBIT_PACKAGE_STRIP = "1"
 INSANE_SKIP_${PN} += "ldflags already-stripped"
 
-- 
2.9.5


