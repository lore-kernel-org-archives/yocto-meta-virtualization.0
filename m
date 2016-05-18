Return-Path: <fabio.berton@ossystems.com.br>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0299CE00D32; Wed, 18 May 2016 13:55:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A727E00CEF
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 May 2016 13:55:53 -0700 (PDT)
Received: by mail-qg0-f68.google.com with SMTP id z70so391741qge.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 May 2016 13:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=EwLKz/P2b9ePqkzNNxce7ll4kcm5B+RF1c7QVKv4MsU=;
	b=bx3SxgpH6klZlsQ6YsC0X9DMw57auT3ALqvpFLgdVNE6+rbt8O8ZYZW/AQcVTxEqrW
	IkFN0vuUMRsx+5AswEQE57t32PLmIyiXeT1Y8/FxGsaCl3w+NRp7Mkn9KWkVSg7z9GGd
	dRCOyIbIVGOH0oIp+IZMJ6Z6ffWcc0vhrPOeJaZLAD/3SKtrA60cXeUYqJbhSrTbU/4o
	xcgaqA4DzzyN36ZHG+QSJa01HAu+CfrcLDE4+7+w3O+0Nnl/HgvOVGNYtqAWWGq3bar7
	vpPSb+NAUkpCrrVC1kwoUlhOM6HSwsi9QScKMuNsDO+//PCRmaGYzBkGlXOzFF7eBHD0
	f6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=EwLKz/P2b9ePqkzNNxce7ll4kcm5B+RF1c7QVKv4MsU=;
	b=JTDxTqsjSq2fmeQVu53zlvY20Q++EVhBoe4SkFaLVvg87lrIQwNqiE2jpbUF37AIuL
	NVsF+fobPkMf4oLwclkKZK8J7jh8W8Uxq/3hEQbtdL0IgNM0+N+cvhJTp2fQ+VAu47Cr
	n55tGIFDp/2/2S/Axzfa8ED9zcTGLiVvY6ADe091hO3zGcbdmSPmPYlAMYFxOfIKRZb8
	CbFOB8w0SNqrXkpWmxUzqSjrPlxZvMf0PxTuD2Rnb7Z/DedazTkyO76QprqtVAZhiMR8
	3Uv4MfGFCrFLJwWL2TJoUqoqqTzXB7LosZpYnXCKEkACa10jdobX1u81mryxbLlwasaY
	2FMQ==
X-Gm-Message-State: AOPr4FWMHVkJv+pzIdFTKdtx4ecUe3LgIES0oc+yEfNPDL3xGPd6cIQgMyQViBj2kroSkg==
X-Received: by 10.140.39.243 with SMTP id v106mr10015236qgv.23.1463604953213; 
	Wed, 18 May 2016 13:55:53 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id
	b40sm5072135qga.47.2016.05.18.13.55.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 May 2016 13:55:51 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: meta-virtualization@yoctoproject.org
Date: Wed, 18 May 2016 17:55:26 -0300
Message-Id: <1463604926-30546-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] docker-registry: Remove RDEPENDS explicit version
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
X-List-Received-Date: Wed, 18 May 2016 20:55:58 -0000

RDEPENDS has dependence recipe with recommended version like:

 - gunicorn (= 19.1.1)

This syntax only work if we use rpm for package class, we can't
use this syntax with ipk package class.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../docker-registry/docker-registry_git.bb         | 36 +++++++++++-----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/recipes-containers/docker-registry/docker-registry_git.bb b/recipes-containers/docker-registry/docker-registry_git.bb
index 3d8d74b..17a5ae1 100644
--- a/recipes-containers/docker-registry/docker-registry_git.bb
+++ b/recipes-containers/docker-registry/docker-registry_git.bb
@@ -24,27 +24,27 @@ PV = "0.9.1+git${SRCREV}"
 
 RDEPENDS_${PN} += "\
   docker \
-  gunicorn (= 19.1.1) \
+  gunicorn  \
   python-pip \
   python-distribute \
-  python-m2crypto (= 0.22.3) \
-  python-pyyaml (= 3.11) \
-  python-flask (= 0.10.1) \
-  python-gevent (= 1.0.1) \
+  python-m2crypto  \
+  python-pyyaml  \
+  python-flask  \
+  python-gevent  \
   python-requests \
-  python-sqlalchemy (>= 0.9.4) \
-  python-blinker (= 1.3) \
-  python-backports-lzma (= 0.0.3) \
-  python-flask-cors (= 1.10.3) \
-  python-bugsnag (= 2.0.2) \
-  python-docker-registry-core (= 2.0.3) \
-  python-newrelic (= 2.22.0.19) \
-  python-itsdangerous (>= 0.21) \
-  python-jinja2 (>= 2.4) \
-  python-werkzeug (>= 0.7) \
-  python-simplejson (>= 3.6.2) \
-  python-redis (= 2.10.3) \
-  python-boto (= 2.34.0) \
+  python-sqlalchemy  \
+  python-blinker  \
+  python-backports-lzma  \
+  python-flask-cors  \
+  python-bugsnag  \
+  python-docker-registry-core  \
+  python-newrelic  \
+  python-itsdangerous  \
+  python-jinja2  \
+  python-werkzeug  \
+  python-simplejson  \
+  python-redis  \
+  python-boto  \
   python-webob \
   "
 # OFFICIAL REQ:
-- 
2.1.4


