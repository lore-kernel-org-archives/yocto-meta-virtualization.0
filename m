Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E8C2E00982; Wed, 10 Jun 2015 13:15:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.169 listed in list.dnswl.org]
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52B35E0086D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Jun 2015 13:15:35 -0700 (PDT)
Received: by ykfr66 with SMTP id r66so28417891ykf.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Jun 2015 13:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=QPuwo0p+28F1tdAP9fCJqf8WFmdAogkYeSV3htUm4Hw=;
	b=kPMt8Ri5LVyLftkoRVT9gCbB4P8QQ3MhTOFvBxIom7KgbycyvW7nd+yWwzzNx6b7T1
	Gq5TkIoYcupD/CXEGBJa7UEaj4DEtCwWdKw49FsXrhX44w+FUJsXNl7L9JD2SZCetPt3
	15sQh+ac7h0Qd5x1DNCeEjSD/3DTjyrpWqIaFYUh253+w+vHm6PsaYrS8I4rYuq7szVt
	yk5Hq1zqBk/tuayERcTvxM80kODymd/V8MTiO1jPs96azl1LfFFrC9lfIQghRuV0cMby
	yATB/ftcslTRr8By56Fx3gl8Q+VxP7gR+0Lhiy7mZHw79Rvjfs+7XCpGzNYqLopFMalZ
	BgZg==
MIME-Version: 1.0
X-Received: by 10.170.73.194 with SMTP id p185mr6669905ykp.123.1433967334608; 
	Wed, 10 Jun 2015 13:15:34 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 10 Jun 2015 13:15:34 -0700 (PDT)
In-Reply-To: <1433856827-25796-1-git-send-email-erik.boto@pelagicore.com>
References: <1433856827-25796-1-git-send-email-erik.boto@pelagicore.com>
Date: Wed, 10 Jun 2015 16:15:34 -0400
Message-ID: <CADkTA4O1r=zwwFhRbUCoBrDmUDU=y8BFmFPZpZ5MmvSSS2Wfpg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@pelagicore.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: allow multiple init systems in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 10 Jun 2015 20:15:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2015 at 9:33 AM, Erik Bot=C3=B6 <erik.boto@pelagicore.com> w=
rote:
> Add handling for distros with both systemd and sysvinit by passing
> multiple init systems to configure with --with-init-script=3D


I've never had much luck with multiple init systems .. but no issues in
merging this change. It is now on the master branch.

Cheers,

Bruce

>
> Signed-off-by: Erik Bot=C3=B6 <erik.boto@pelagicore.com>
> ---
>  recipes-containers/lxc/lxc_1.0.7.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc=
/lxc_1.0.7.bb
> index f79ba76..faa31b7 100644
> --- a/recipes-containers/lxc/lxc_1.0.7.bb
> +++ b/recipes-containers/lxc/lxc_1.0.7.bb
> @@ -46,7 +46,9 @@ S =3D "${WORKDIR}/${BPN}-${PV}"
>  PTEST_CONF =3D "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-t=
ests', '', d)}"
>  EXTRA_OECONF +=3D "--with-distro=3D${DISTRO} ${PTEST_CONF}"
>
> -EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '=
--with-init-script=3Dsysvinit', '--with-init-script=3Dsystemd', d)}"
> +EXTRA_OECONF +=3D "--with-init-script=3D\
> +${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit,', '', d)}=
\
> +${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
>
>  PACKAGECONFIG ??=3D "templates \
>      ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

