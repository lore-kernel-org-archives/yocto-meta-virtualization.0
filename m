Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3948E00D5F; Sun, 25 Aug 2019 19:24:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.50 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20F6FE0096F
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 19:24:43 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id f21so6090456lfc.5
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 19:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=G78Z/zVhYj/3e4PO6FRyEBLTu6razWj78XSqbNre5Q8=;
	b=XyVAFrLwVTTH6ocsZYOSqjSmOYOCvo9UGdeJPNShbRG4NHU9C7hENfllvDaAiYqjdD
	Dls15gwyEnDPumk1JKbwvw4X1yLiuYOaoAK5R9E5Po/WPftk1nhNicTzg0fRLnpWMwUK
	8kTojWujhVCwdbRpKDOZnC7Ze3SlbocAi2PyV7gzSGHu1MTFFGmLi+MZZlQcpdD66v9n
	BjaqKgVkw7CgY9lTlNVqxHFDwe/Srt9s6UV7uwje+3zGqI9pJI9g643v0Ju2FigNgNsp
	M3BEwHqqYvv02J6QGU5nr2JFiEEXgJ+1nJicr76vNIBrEVG4t9PUoSGoqslpCMGCf4Ns
	+7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=G78Z/zVhYj/3e4PO6FRyEBLTu6razWj78XSqbNre5Q8=;
	b=rvA8mitvdwRYCxRdcEqjUV888lgFQTEZiW4DdWTNgTlMeyH+Vm2X4uXiJ/4A1YCtLT
	KNT+LiMC4FeujlOcEXM0cPr+7efq/0b7lh5BL0NyyX5BcXPbUjetoCkUToMjzTon7xNd
	C9E73apt5lQUZ7GM7UT1TYubGKmL0TjSYCs967GJDODGyJJyvFCc2u5lsvojsSrS/doh
	vnQwYI27DHZKdazADdUhk26NV/tkLgybdowuMnPkbA6vSzMzFWV64tu3doJfRQNdNS/C
	0zar4si+zwjafyVDv4o+Gh30QrqEa20sYbEmRVM4fDlOoee8qQ4CHBdtcHW+v/ypVzmr
	7E7A==
X-Gm-Message-State: APjAAAW4EhevarVo90dVJZ49Q2aaNGL19gBxi+PUUJsaVst8lCbWrWVQ
	IXvyv+wuFxO5JFb41B98OCz0/AeTGoIo+ZkUPPRjz9Ar
X-Google-Smtp-Source: APXvYqxcfP4GFdrOKRr9nRlLZpsS21vILvUbDFDVQRMQfhk417K+VA1VmQgAJNinZFhoXrvtwNF8RYC5p7gNlns40Y0=
X-Received: by 2002:ac2:5323:: with SMTP id f3mr88683lfh.36.1566786282920;
	Sun, 25 Aug 2019 19:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190814015408.15372-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190814015408.15372-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 25 Aug 2019 22:24:31 -0400
Message-ID: <CADkTA4ND5jE1NjhMSFqG_WSgqvLVhr4TcAy1iVKBLgxd97GNoA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-barbicanclient: upgrade 4.5.2 -> 4.8.1
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
X-List-Received-Date: Mon, 26 Aug 2019 02:24:44 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Aug 13, 2019 at 9:54 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>
> Unable to find version 4.8.1 in branch stable/pike.
> Change branch to master.
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb b/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
> index 2d57158..3c5043b 100644
> --- a/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
> @@ -5,11 +5,11 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=e031cff4528978748f9cc064c6e6fa73"
>
>  SRC_URI = "\
> -       git://github.com/openstack/python-barbicanclient.git;branch=stable/pike \
> +       git://github.com/openstack/python-barbicanclient.git \
>         "
>
> -PV = "4.5.2+git${SRCPV}"
> -SRCREV = "775de93a612db866bb39ba6828f3e7bd1aa3c9f5"
> +PV = "4.8.1+git${SRCPV}"
> +SRCREV = "1b282358166fe4c1d4dea896bd336b2850584f56"
>  S = "${WORKDIR}/git"
>
>  inherit setuptools
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

