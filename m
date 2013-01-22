Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00662E00709
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 04:47:46 -0800 (PST)
Received: by mail-ea0-f175.google.com with SMTP id d1so2858818eab.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 04:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=uiaOHJXROSqv31dlmh/OxIisUKVuU4hSih+05fs7F6w=;
	b=Uob6hXz6W3eSAdT2KIqT5UM19qDFV7Mx/lFhVpQhPVUQqR0VjXslnOYIp6HzEiLqJJ
	XNj3rar7hnEUeLehNu6qYlJMh4Z5vnNgrXT86ePkJjwMZzBz4Xr7jirxB22DzQyXeiRX
	7d40dG7h8CVfSM+lpeWLg1Rbj8Lq/2nr5rpWX4z1MXwxY4BlQuWYfsNPM6KwC5OG3QWA
	HveBMY2naReqxmCpvcCtssE+zxsr9vTflyKLv38u4V13HgxZC3F6QCJSvp56GLdoYu4C
	h+9fu0f5Rz+PYpqqf7VBXi7VjyZslhPxKsvPS1zwVzXhHjY77Sg1w8a7fItqVyrzAmrX
	8A2Q==
X-Received: by 10.14.215.6 with SMTP id d6mr72062577eep.40.1358858865591;
	Tue, 22 Jan 2013 04:47:45 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id g2sm4079611eep.16.2013.01.22.04.47.43
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:47:44 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id DBA13400DC1; Tue, 22 Jan 2013 13:47:31 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 22 Jan 2013 13:47:17 +0100
Message-Id: <1358858841-13339-3-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1358858841-13339-1-git-send-email-david.nystrom@enea.com>
References: <1358858841-13339-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] Changed libvirt dependency to netcat-openbsd to match meta-networking
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
X-List-Received-Date: Tue, 22 Jan 2013 12:47:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 recipes-extended/libvirt/libvirt_1.0.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_1.0.0.bb b/recipes-extended/libvirt/libvirt_1.0.0.bb
index 5374237..90d7dbb 100644
--- a/recipes-extended/libvirt/libvirt_1.0.0.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.0.bb
@@ -11,7 +11,7 @@ DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux
 # These might be included by PACKAGECONFIG
 #RRECOMMENDS+= "polkit qemu yajl libnl lxc netcf"
 
-RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq openbsd-netcat"
+RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd"
 RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
 RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
 
-- 
1.7.9.5


