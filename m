Return-Path: <elfy@ecognize.me>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BEFFE00A44; Fri, 23 Mar 2018 13:09:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from mail.ecognize.me (unknown [46.101.151.221])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16D7EE0070F
	for <meta-virtualization@yoctoproject.org>;
	Fri, 23 Mar 2018 13:09:38 -0700 (PDT)
Received: from mail.ecognize.me (unknown [46.101.151.221])
	(Authenticated sender: elfy)
	by mail.ecognize.me (Postfix) with ESMTPSA id 563A320337
	for <meta-virtualization@yoctoproject.org>;
	Fri, 23 Mar 2018 16:09:39 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ecognize.me; s=mail;
	t=1521835779; bh=rA/x9+/Ul1RYTTbfQCCWavTOPumm9qysj90KJKc2ocM=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=ZwD7VXEC0fKazS1R6gHbXe1wpRS7cIWGH2Xd+6i3uMTDNDtVDSdcxMe3nIGMD53MU
	pfhLdxBYu4Tar4oY+tlIocRKQkGn4Tvzw4DMStf1VMz+y16oIKEMpE5cOwVIkVT7eq
	+oHtqrNLo1U1hmVzpXuwHDhyxsr/bFrBvnH9pIF8=
Mime-Version: 1.0
Date: Fri, 23 Mar 2018 20:09:39 +0000
Message-ID: <a7b9bbec9718fc4325304e3656a0013d@mail.ecognize.me>
X-Mailer: RainLoop/1.10.3.151
From: elfy@ecognize.me
To: meta-virtualization@yoctoproject.org
In-Reply-To: <20180323195016.30251-1-elfy@ecognize.me>
References: <20180323195016.30251-1-elfy@ecognize.me>
Subject: [PATCH] New URL for go-fsnotify
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
X-List-Received-Date: Fri, 23 Mar 2018 20:09:40 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The owner changed the repo URL 3 days ago and set up a repo to break auto=
-redirects on purpose=0A=0Ahttps://github.com/go-fsnotify/fsnotify#my-pro=
ject-is-not-compiling-anymore-what-can-i-do=0A---=0Arecipes-devtools/go/g=
o-fsnotify_git.bb | 2 +-=0A1 file changed, 1 insertion(+), 1 deletion(-)=
=0A=0Adiff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devto=
ols/go/go-fsnotify_git.bb=0Aindex e5bcf14..1d9fbdc 100644=0A--- a/recipes=
-devtools/go/go-fsnotify_git.bb=0A+++ b/recipes-devtools/go/go-fsnotify_g=
it.bb=0A@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc38914=
c9a7ab03bb2b96d4baaee10769"=0A=0ASRCNAME =3D "fsnotify"=0A=0A-PKG_NAME =
=3D "github.com/go-fsnotify/${SRCNAME}"=0A+PKG_NAME =3D "github.com/fsnot=
ify/${SRCNAME}"=0ASRC_URI =3D "git://${PKG_NAME}.git"=0A=0ASRCREV =3D "83=
6bfd95fecc0f1511dd66bdbf2b5b61ab8b00b6"=0A--=0A2.15.1

