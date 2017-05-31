Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20ED4E00B01; Wed, 31 May 2017 10:14:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.180 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.180 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f180.google.com (mail-yb0-f180.google.com
	[209.85.213.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD4E9E00992
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 May 2017 10:14:44 -0700 (PDT)
Received: by mail-yb0-f180.google.com with SMTP id 130so5246505ybl.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 May 2017 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=BzO4CS/krJZkLF1wNPoSLWaW9OEAkjwLfPghrL/OtKk=;
	b=UFxR6S69iQdT1JZR7BegnRjBfED0RImynjFs1/2Rb/4bXUpBnH0H8tiSIAb2/sNoKE
	lLoodcPO7gTS0k2B0OiE7LqEG7TwGjZWukpi2f3YjOCLoUOgmVeSSCP/+GYif0mj5QMf
	tJJy0tOkFFytX5X1FN6yzjGPs6Cm7mWgnAJh3u0PczQkyNARQfA/2m+QHvbO4TwWLlGE
	LM7kzh+s7yxZTo6ig7JGLawamhqECBbGf1GL3Zg9lEr2X3Nbgr0IQzZwjHSy3oYGCVSF
	QePzeh7hsdyes8aARhBnY67IXMahDbqljNR2KNtzwYAZrSi52SieuLWIW+HAJy8GRwIN
	m+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=BzO4CS/krJZkLF1wNPoSLWaW9OEAkjwLfPghrL/OtKk=;
	b=r3Rk/t2vAHw/0zcJirdJNboQ71kBPGV2Ljo53qYzgCtKOX+I/uDD0VcqIxSHH8Qmnc
	CfFo0Ty7f9fjN0ilPPWrndWCH+7JqzKdGA+RTVUWwGzqgFfhSwXv05w98sgitUcBsrip
	7gBrzMyzMgKkoxklvtyvyuTwxcry2LEGrwmH5OyAQQjZSrqPbXYoba9LBNotU6Hfv3Oy
	nHQ0EehLla6uCyduh60bi93u6Q9nsow/2rK0H2ARwKuIDg2VtjqOQNWKf6HwR5pWldrK
	1DV9RBBh/mDbjtNAuT6+mvEc6gLsFuqBA/WBhuEjJbNPXAOICWT3rb2OJZftQCCESqMG
	2nMw==
X-Gm-Message-State: AODbwcCF+RlwfeP9j7lAFzNGVvK5x+KAAhUkjoBA1X5LykrsvmM/ibxz
	S9d0gxWaznrcWkFHHRvl3Ek3Nmah/HgQ
X-Received: by 10.37.22.9 with SMTP id 9mr42626697ybw.33.1496250883636; Wed,
	31 May 2017 10:14:43 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.174.162 with HTTP; Wed, 31 May 2017 10:14:43 -0700 (PDT)
In-Reply-To: <1495541635-40607-1-git-send-email-adrian.dudau@enea.com>
References: <1495541635-40607-1-git-send-email-adrian.dudau@enea.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Wed, 31 May 2017 13:14:43 -0400
X-Google-Sender-Auth: yrM477OXT43A2w6ZSQKkdj5mTK8
Message-ID: <CAPuovEKKWNCbadFVa3gViV_x2CcD-rSzV2dwO2smw7M7XQ85Tw@mail.gmail.com>
To: Adrian Dudau <adrian.dudau@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] python: Inherit setuptools instead of distutils for several packages
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
X-List-Received-Date: Wed, 31 May 2017 17:14:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 23, 2017 at 8:13 AM, Adrian Dudau <adrian.dudau@enea.com> wrote:
> python-appdirs
> python-keystoneauth
> python-lesscpy
> python-os-client-config
>
> The setup scripts of these modules use setuptools instead of distutils,
> resulting in errors like this:
>
> |   File "setup.py", line 5, in <module>
> |     from setuptools import setup
> | ImportError: No module named setuptools
>
> Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>


Agreed. The setup.py for all of these packages have some form of
'import setuptools' so this is the correct change. I mentioned to
Bruce I would have a look at these as I know in the past we have had
some flip-flopping in this regard. Anyways, Bruce this change is fine
and at least in my mind OK to merge.

Mark

> ---
>  meta-openstack/recipes-devtools/python/python-appdirs_git.bb          | 2 +-
>  meta-openstack/recipes-devtools/python/python-keystoneauth1_2.18.0.bb | 2 +-
>  meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb       | 2 +-
>  meta-openstack/recipes-devtools/python/python-os-client-config_git.bb | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-appdirs_git.bb b/meta-openstack/recipes-devtools/python/python-appdirs_git.bb
> index 8e40f26..2482871 100644
> --- a/meta-openstack/recipes-devtools/python/python-appdirs_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-appdirs_git.bb
> @@ -12,7 +12,7 @@ SRC_URI = "git://github.com/ActiveState/${SRCNAME}.git"
>
>  S = "${WORKDIR}/git"
>
> -inherit distutils
> +inherit setuptools
>
>  DEPENDS += " \
>          python-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1_2.18.0.bb b/meta-openstack/recipes-devtools/python/python-keystoneauth1_2.18.0.bb
> index 1fdf9e1..83582c5 100644
> --- a/meta-openstack/recipes-devtools/python/python-keystoneauth1_2.18.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1_2.18.0.bb
> @@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "075a9ca7a8877c5885fa2487699015e45260c4e6be119683effe0ad2ab
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> -inherit distutils
> +inherit setuptools
>
>  DEPENDS += " \
>          python-pbr \
> diff --git a/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb b/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
> index 61ae935..71e0dc0 100644
> --- a/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
> @@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "ccad1ad2a89ced1875c5ca4e16e5478b791d31fb187fe29f1541859318
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> -inherit distutils
> +inherit setuptools
>
>  DISTUTILS_INSTALL_ARGS = "--root=${D} \
>      --prefix=${prefix} \
> diff --git a/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb b/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb
> index 7b55dbb..5393bb7 100644
> --- a/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb
> @@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
>
>  S = "${WORKDIR}/git"
>
> -inherit distutils
> +inherit setuptools
>
>  DEPENDS += " \
>          python-pbr \
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

