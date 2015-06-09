Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6BD1FE0096A; Tue,  9 Jun 2015 06:02:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.49 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EDD65E00496
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Jun 2015 06:02:12 -0700 (PDT)
Received: by yhak3 with SMTP id k3so6612541yha.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 09 Jun 2015 06:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=05RZ99tvK3xVewXsPkyR5H0MdOwCQzCj+wwbcNpnFXM=;
	b=jMbZ0b23YIAQbjtcY8Q0AK2rmPMStGTNbDJC97FlI1EMgytsM1655x+S1mYm9HRSej
	hiR4gGZ7TE2KHnbvH2whY7Akpbm9WP4TV/0zhFsGhmtoOEXPkxvJnDDWATchSphmiLPL
	SMChZImRIFWfmBQUZWZXdOZofdgFjpk4zCHhtaeWP/LHpLWOy7gb7M0lBxKqjaLbvQp9
	cRn3wxB7Txp+Cq3GG1hdUCCsIw0UqSn13D0dg92h4zdKXgeucw6JrSt7CckiNBXBRXye
	COZ7/q4xnVJzyfCjTlOdc5H5bd76jhnZwoYAgRP/VsYRl+etazui48Leq0JO6cYfUtnS
	qMjg==
MIME-Version: 1.0
X-Received: by 10.13.232.71 with SMTP id r68mr22020626ywe.16.1433854932277;
	Tue, 09 Jun 2015 06:02:12 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Tue, 9 Jun 2015 06:02:12 -0700 (PDT)
In-Reply-To: <1433826846-6684-1-git-send-email-erik.boto@pelagicore.com>
References: <1433826846-6684-1-git-send-email-erik.boto@pelagicore.com>
Date: Tue, 9 Jun 2015 09:02:12 -0400
Message-ID: <CADkTA4Nm7OmnO9xT=rQ+wU15eocOZw5y_64K19pq6OOcPXuJeQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@pelagicore.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: install lxc.service if DISTRO_FEATURES contains systemd
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
X-List-Received-Date: Tue, 09 Jun 2015 13:02:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2015 at 1:14 AM, Erik Bot=C3=B6 <erik.boto@pelagicore.com> w=
rote:
> Signed-off-by: Erik Bot=C3=B6 <erik.boto@pelagicore.com>
> ---
>  recipes-containers/lxc/lxc_1.0.7.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc=
/lxc_1.0.7.bb
> index f79ba76..948dd0f 100644
> --- a/recipes-containers/lxc/lxc_1.0.7.bb
> +++ b/recipes-containers/lxc/lxc_1.0.7.bb
> @@ -94,6 +94,11 @@ do_install_append() {
>         for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do=
 \
>             sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
>
> +       if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false'=
, d)}; then
> +           install -d ${D}${systemd_unitdir}/system/
> +           cp ${S}/config/init/systemd/lxc.service ${D}${systemd_unitdir=
}/system/
> +       fi

We actually don't need this, I introduced a similar copy in January of
this year, and subsequently
removed it, since the line:

EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit',
'--with-init-script=3Dsysvinit', '--with-init-script=3Dsystemd', d)}"

Takes care of the proper generation and install of the service files
(and sysvinit scripts).

If we are having issues with startup, we need to see what broke since
I made the change
and tested it.

Also note that SYSTEMD_AUTO_ENABLE_${PN}-setup is currently set to "disable=
", so
you do need to enable the systemd init parts as well.

Bruce


> +
>         if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false=
', d)}; then
>             install -d ${D}${sysconfdir}/init.d
>             cp ${S}/config/init/sysvinit/lxc ${D}${sysconfdir}/init.d
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

