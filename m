Return-Path: <akuster@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45A87E006EF; Mon, 30 Jun 2014 14:48:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.181 listed in list.dnswl.org]
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC8E0E006C6
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 14:48:22 -0700 (PDT)
Received: by mail-pd0-f181.google.com with SMTP id v10so8927463pde.40
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 14:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XFjgcbdiPaUuBAJtiTp+jxbGswtLSyzmwP8pfT1m3CI=;
	b=jw5Hf1jI0P69A3sPBOsyUE3dAakbaTXQM1uUptQARQG9jNdDBh4RBm7VTSA/kCC2km
	Uhi5FFIzrr9eVUZxD7tnQ/AOok2P8wOHb+Do7YDKS06bEml7sIenmwmSZEN9nEyhDBG6
	mULLm3cmbDggfvVWDIufwjgdOeip7RMj8X5+KoNoZO0GZLRZyCr+yKRXL8DQqK6pWAPO
	ISgFUJi9+13Xm2Jiy1RMGU919+YyTEtGo5Rji+0rYmLHd2SJXhMEx7ltltV05LY/S4Zy
	UJhgB6YasyHidLUrt3kuj++T8FORjOeF+i71zcNOfycwkKZoyMC7NV4VZ0nYUCCaICaq
	OJQw==
X-Gm-Message-State: ALoCoQkYSCMeH0cwiUGHNaI5luGAwfmPQGNBwsdbUaT3HTGS+e1h5L0QWwj+ZlWqecH5mgR+cuTn
X-Received: by 10.66.189.169 with SMTP id gj9mr42431435pac.149.1404164902124; 
	Mon, 30 Jun 2014 14:48:22 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	ir10sm29325691pbc.59.2014.06.30.14.48.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Jun 2014 14:48:21 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 30 Jun 2014 14:48:10 -0700
Message-Id: <1404164895-19815-3-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1404164895-19815-1-git-send-email-akuster@mvista.com>
References: <1404164895-19815-1-git-send-email-akuster@mvista.com>
Cc: bruce.ashfield@windriver.com
Subject: [PATCH 2/7] [meta-openstack] iptables: remove PRINC reference
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
X-List-Received-Date: Mon, 30 Jun 2014 21:48:28 -0000

replace PRINC with PR .= ".1"

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-openstack/recipes-extended/iptables/iptables_1.4.21.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-extended/iptables/iptables_1.4.21.bbappend b/meta-openstack/recipes-extended/iptables/iptables_1.4.21.bbappend
index 7b4d5df..24495fb 100644
--- a/meta-openstack/recipes-extended/iptables/iptables_1.4.21.bbappend
+++ b/meta-openstack/recipes-extended/iptables/iptables_1.4.21.bbappend
@@ -1,4 +1,4 @@
-INC := "${@int(PRINC) + 1}"
+PR .= ".1"
 
 RRECOMMENDS_${PN} += "kernel-module-xt-conntrack \
                       kernel-module-xt-redirect \
-- 
1.9.1


