Return-Path: <asselsm@gmail.com>
Received: from mail-qe0-f47.google.com (mail-qe0-f47.google.com
	[209.85.128.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACFCCE017BB
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Oct 2013 18:53:43 -0700 (PDT)
Received: by mail-qe0-f47.google.com with SMTP id b4so1371623qen.34
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Oct 2013 18:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=NlFUcYwGSJotmIwjk9lCl36O4EzMGhmraCFeYgNuZdw=;
	b=YpkhzUJGPSUKIMITarx13veIHx5ullJdMiVvF+HlQedt8XBpFjjz4NKq5TZQ1kR9+f
	HpByYr5x9J4uWEqa7zLbsDinkeemyaCEoZErwHo9xVpwA+PgKOw7y49I9xpMHE00xWP5
	p470RWU0u1MvV1xqitGTFTmbGmFhSj5J8o4AwJnkBaifRlqFDl7uhQXR6igVuIzAp3k+
	cKZTn7Y2iSkUIsCkyCdPT9xtxfo+GiXoFZNunHEhiGC0elh7JeVSvBcCLPN6HvoCSAEo
	/1q9G6EXOc+Fa9VrqeNUNmr5b1JiYitQiV4ajDFUDBIyoBStUOHh8zfMU5DapJVjViEd
	10NA==
X-Received: by 10.49.4.199 with SMTP id m7mr808877qem.19.1383184422384;
	Wed, 30 Oct 2013 18:53:42 -0700 (PDT)
Received: from localhost (198-84-204-234.cpe.teksavvy.com. [198.84.204.234])
	by mx.google.com with ESMTPSA id og1sm2326623qeb.3.2013.10.30.18.53.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Oct 2013 18:53:41 -0700 (PDT)
From: Mark Asselstine <asselsm@gmail.com>
To: meta-virtualization@yoctoproject.org,
	bruce.ashfield@windriver.com
Date: Wed, 30 Oct 2013 21:55:12 -0400
Message-Id: <1383184512-28442-1-git-send-email-asselsm@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] libvirt: add PACKAGECONFIG for sasl
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
X-List-Received-Date: Thu, 31 Oct 2013 01:53:46 -0000

We don't want to leave build order dictating whether or not we get
sasl support in libvirt so add a PACKAGECONFIG for sasl. I have not
added sasl as a default PACKAGECONFIG since out of the box you would
not normally get sasl being built so this mimics this behavior. I have
listed a RDEPENDS in the PACKAGECONFIG as older Yocto builds for some
reason are not picking up the required runtime dependency.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 recipes-extended/libvirt/libvirt_1.1.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/libvirt/libvirt_1.1.2.bb b/recipes-extended/libvirt/libvirt_1.1.2.bb
index 56d6aed..4bdade8 100644
--- a/recipes-extended/libvirt/libvirt_1.1.2.bb
+++ b/recipes-extended/libvirt/libvirt_1.1.2.bb
@@ -149,6 +149,7 @@ PACKAGECONFIG[udev] = "--with-udev --with-pciaccess,--without-udev,udev libpciac
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux,"
 PACKAGECONFIG[ebtables] = "ac_cv_path_EBTABLES_PATH=/sbin/ebtables,ac_cv_path_EBTABLES_PATH=,ebtables,ebtables"
 PACKAGECONFIG[python] = "--with-python,--without-python,python,"
+PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,cyrus-sasl"
 
 # Enable the Python tool support
 require libvirt-python.inc
-- 
1.8.1.2


