Return-Path: <fabio.berton@ossystems.com.br>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A85DE00C29; Tue, 14 Jun 2016 10:59:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78C0EE00C1D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Jun 2016 10:59:30 -0700 (PDT)
Received: by mail-qg0-f65.google.com with SMTP id 78so5046475qgt.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Jun 2016 10:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=iaFMX4TPFOiCJ2zqozHmeCMyo5cnRBNOCmr48pcAWTE=;
	b=vyOGuIA0/XgWRoJ1VRmWfZn2b+ktJhp4W4mFfw1+8rfTNSa2kpwzIxSWBaM0eLSntI
	XMuN9G4d8y7TFdaFGf3fWr35k1C/BjXq0ZVyUT2QZKshVXuIksVKjemc1gtXM/N/zSsl
	zHa4bszgfh7ga1RwXuKQgQbeQATuyU0O2B508w4bXgI0DyH1Aicpdqa/xpfbHFF3bgcy
	Y5axtZYgEotwsyfwX2DleABHUMqaP35wY6J8Gnk+oo/ocX5FAGEDqDddfBL3gszg+ZP2
	Vxp2iwVPGyx2igD5F15fTx2rpbDx2JeXlQEY0XWKdKOCoDbRlaLygQKKal9N+L7wKfZ3
	X2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=iaFMX4TPFOiCJ2zqozHmeCMyo5cnRBNOCmr48pcAWTE=;
	b=bzOWA9MfeNdzvB31ucvcHchexkUZC4rYoDvuL08t8TjX44OYY4Rs/kZkXPEsyuf1j6
	Pjx3VK1ZIliV3qdDowAl/SqT2wYckpCPdgeKhGGimSXhZTL+leYfO3gmVUpRzDpRmTXc
	eFZP/8b5C5QOY22B6mYIfWKijMZGvlpP7PIli0gbwQX9fie8dhhQuC+MsSxCJhkwcign
	K5yTyEVo0aIBRPARI6S8+CJVzi9bMzpC/6dN2SAakVFpL+RLsPGxvexn21GDt4DhkeHT
	1eDzwM/qxJPug7GxuWrBeHHGJki7y8g//TNgGcLdbVxxkJ7WGwDnn5je1wJFLapbxORD
	AeTw==
X-Gm-Message-State: ALyK8tJW5IR0fd1sEM1KoWvEfuifTGt2KwWjnUx/XcOHM1PiLtFinkO5V7YUjH6P9weMpg==
X-Received: by 10.140.19.15 with SMTP id 15mr11264953qgg.91.1465927169858;
	Tue, 14 Jun 2016 10:59:29 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id
	b34sm8636770qtd.32.2016.06.14.10.59.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jun 2016 10:59:28 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: meta-virtualization@yoctoproject.org
Date: Tue, 14 Jun 2016 14:59:12 -0300
Message-Id: <1465927152-2796-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] docker-registry: Make version dependence compatible with opkg
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
X-List-Received-Date: Tue, 14 Jun 2016 17:59:34 -0000

Some recipes in RDEPENDS are installing specific version of package, for
example:
  gunicorn (= 19.1.1)

If usigin ipk for PACKAGE_CLASSES, opkg prints error:

Collected errors:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies
 for docker:
 *      gunicorn (= 19.1.1) *
 * opkg_install: Cannot install package docker.

This error is caused because opkg appends package revision to version.
In this case:
  gunicorn_19.1.1-r0.1

If we use comparator >= this error doesn't appear.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../docker-registry/docker-registry_git.bb         | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/recipes-containers/docker-registry/docker-registry_git.bb b/recipes-containers/docker-registry/docker-registry_git.bb
index 3d8d74b..0320440 100644
--- a/recipes-containers/docker-registry/docker-registry_git.bb
+++ b/recipes-containers/docker-registry/docker-registry_git.bb
@@ -24,27 +24,27 @@ PV = "0.9.1+git${SRCREV}"
 
 RDEPENDS_${PN} += "\
   docker \
-  gunicorn (= 19.1.1) \
+  gunicorn (>= 19.1.1) \
   python-pip \
   python-distribute \
-  python-m2crypto (= 0.22.3) \
-  python-pyyaml (= 3.11) \
-  python-flask (= 0.10.1) \
-  python-gevent (= 1.0.1) \
+  python-m2crypto (>= 0.22.3) \
+  python-pyyaml (>= 3.11) \
+  python-flask (>= 0.10.1) \
+  python-gevent (>= 1.0.1) \
   python-requests \
   python-sqlalchemy (>= 0.9.4) \
-  python-blinker (= 1.3) \
-  python-backports-lzma (= 0.0.3) \
-  python-flask-cors (= 1.10.3) \
-  python-bugsnag (= 2.0.2) \
-  python-docker-registry-core (= 2.0.3) \
-  python-newrelic (= 2.22.0.19) \
+  python-blinker (>= 1.3) \
+  python-backports-lzma (>= 0.0.3) \
+  python-flask-cors (>= 1.10.3) \
+  python-bugsnag (>= 2.0.2) \
+  python-docker-registry-core (>= 2.0.3) \
+  python-newrelic (>= 2.22.0.19) \
   python-itsdangerous (>= 0.21) \
   python-jinja2 (>= 2.4) \
   python-werkzeug (>= 0.7) \
   python-simplejson (>= 3.6.2) \
-  python-redis (= 2.10.3) \
-  python-boto (= 2.34.0) \
+  python-redis (>= 2.10.3) \
+  python-boto (>= 2.34.0) \
   python-webob \
   "
 # OFFICIAL REQ:
-- 
2.1.4


