Return-Path: <jpuhlman@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4E43E00E11; Sun, 31 Jul 2016 22:00:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11668E00DF5
	for <meta-virtualization@yoctoproject.org>;
	Sun, 31 Jul 2016 22:00:19 -0700 (PDT)
Received: by mail-pf0-f172.google.com with SMTP id x72so51291396pfd.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 31 Jul 2016 22:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=WPy6hhwPXbvxz5UQUCX6gJAg+Wz4kCKrh2PffgJbvi0=;
	b=dt/xxI1VIf5WuVfsLR+bbXLHlKSrwCOXQaz6/EtMoouBVDjqX0ZqTjfur7HZrK1H8R
	eJllZiYBGg8Qw4PQnBRrub9Yjlz0Jj8cbc3aKWBilyz/E+laJ3qfznhfmy0FRdFl9vXj
	i1wZfF2F7DeyNJACTjb9yhjg5RVZEiIbGF7JhBZPp2PkX/2hikbYANDJQpdcj08gArRJ
	suxlaP+sMzawYEoieoTGoL/SrkMTeOWpmZ9T2WF5zmfrzyyvFR6Lkt0GZJ/wRXhtPch2
	WzoZGCrqmZHjtM9IwD/dbMRPBaEMAGivAAGPvvvdd/raBWkFh+Y+ok/+XZDYO52O8sGg
	nsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WPy6hhwPXbvxz5UQUCX6gJAg+Wz4kCKrh2PffgJbvi0=;
	b=SgVij29NIF3XE1DT/3AXh8L9LoVs6CMk18KcNj+kfDuCniQJA4lDtSednNLSFbI7iB
	21a4oYMIX2Bkmg+OGhAB0eVvfXw9UQvEWdSFaY6TMZPK5APtkrgdvQ1hNVkrPXvO5192
	w93rX6b5fXdpuTkNrSnReoMzPw1mtU+EYQ5A0yH4idgUh7wj42FierrZNfIo9Vf6p7gM
	FqK4iGLkix0i0Qdx1duMZHy7jOY9/goOhovL9v/+n2Kks3SLgGmXXegvZ2d0mISs2pks
	Wq8UZ67FmTZorxGmKwZmiC3MjL9yZauqxuYk4xzXaVp0jD7DnmAl2wAVk4LLdBBdTFVf
	jT8w==
X-Gm-Message-State: AEkoouvOms7oXqcQtRBDWsGv76i29T0/Ho0yJMuZy2bVMRMSyulqVzZwzBwhvN0Q7V+X3q5N
X-Received: by 10.98.28.142 with SMTP id c136mr91998969pfc.131.1470027619056; 
	Sun, 31 Jul 2016 22:00:19 -0700 (PDT)
Received: from workhorse.mvista.com
	(99-0-9-164.lightspeed.frokca.sbcglobal.net. [99.0.9.164])
	by smtp.gmail.com with ESMTPSA id
	wa9sm41480195pac.35.2016.07.31.22.00.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Jul 2016 22:00:18 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Sun, 31 Jul 2016 22:00:11 -0700
Message-Id: <1470027611-26666-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.2
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH] Fix python install in multilib case.
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
X-List-Received-Date: Mon, 01 Aug 2016 05:00:20 -0000

Currently libvirt python builds in the multilib case, but fails to
install. Switch from PN to BPN, and fix compile to be consistent.
---
 recipes-extended/libvirt/libvirt-python.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 405d5f7..7a7a4cc 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -42,14 +42,14 @@ python __anonymous () {
 
 do_compile_append() {
 	if [ "${LIBVIRT_PYTHON_ENABLE}" = "1" ]; then
-		cd ${WORKDIR}/libvirt-python-${PV} && \
+		cd ${WORKDIR}/${BPN}-python-${PV} && \
 		  ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build
 	fi
 }
 
 do_install_append() {
 	if [ "${LIBVIRT_PYTHON_ENABLE}" = "1" ]; then
-		cd ${WORKDIR}/${PN}-python-${PV} && \
+		cd ${WORKDIR}/${BPN}-python-${PV} && \
 		  ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install \
                        --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${LIBVIRT_INSTALL_ARGS}
 	fi
-- 
2.6.2


