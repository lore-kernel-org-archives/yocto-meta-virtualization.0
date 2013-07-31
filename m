Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28463E002F9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jul 2013 20:00:57 -0700 (PDT)
Received: by mail-la0-f51.google.com with SMTP id fp13so115968lab.10
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jul 2013 20:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lCW4M8b2byJv0RUWnW+Ydn5R21xtV8RQkNMRr0/U2hY=;
	b=bw66Dqy5RyZTGgsKB5fX6WR2h/bCWWDzpPiGBiMceMO9yaVkSRNRtrG5pzcpEiGpwi
	PEosdLpwK+x/PyR0gGa4x8MnZWEKDSbmNyRggatn/CoWAkohwlGZUd6PHWrHsiy5uIiQ
	4tFjd8QxjU92TNA6nSjs/O/kmLtzQP7/gF6h4earR5EJIXHfWS47yGnr8LpSAb8SWU6e
	LQfi2X4X5XY8mHBjvmUf05i+X4CidM0ANLXpTUm+nYVLJyce5KhRYxhm4vDGPaKwFLwp
	75IDr7vwYGZ+5SkBHsvz4p9cS+RCy2ssOuspMZFfkp6RhRLC06DUyhQFJz5/Fh18bnRg
	pOaw==
MIME-Version: 1.0
X-Received: by 10.152.23.168 with SMTP id n8mr29922906laf.88.1375239656392;
	Tue, 30 Jul 2013 20:00:56 -0700 (PDT)
Received: by 10.112.133.234 with HTTP; Tue, 30 Jul 2013 20:00:56 -0700 (PDT)
In-Reply-To: <1374847604-18982-1-git-send-email-mihai.prica@intel.com>
References: <1374847604-18982-1-git-send-email-mihai.prica@intel.com>
Date: Tue, 30 Jul 2013 23:00:56 -0400
Message-ID: <CADkTA4NOFLb3wtNz1auH9_w_+MhCP0MHsHgsPuwTZzDk6vgfFw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mihai Prica <mihai.prica@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] openvswitch: Ensure pki directory creation
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
X-List-Received-Date: Wed, 31 Jul 2013 03:00:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 26, 2013 at 10:06 AM, Mihai Prica <mihai.prica@intel.com> wrote:
> RPM doesn't guarantee the order in which postinstalls are ran.
> Added code to ensure the pki directory is initialized.

Looks good, and tested fine here. Again, sorry for the delay, this is
now merged.

Bruce

>
> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>  .../openvswitch/openvswitch_1.10.0.bb              |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> index fff597c..3703c1b 100644
> --- a/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> +++ b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> @@ -14,7 +14,7 @@ RDEPENDS_${PN}-pki = "${PN}"
>  RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
>  RRECOMMENDS_${PN} += "kernel-module-openvswitch"
>
> -PR = "r1"
> +PR = "r2"
>
>  SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
>         file://openvswitch-switch \
> @@ -91,6 +91,10 @@ pkg_postinst_${PN}-controller () {
>                  exit 1
>          fi
>
> +    if test ! -d $D/${datadir}/${PN}/pki; then
> +        ovs-pki init --dir=$D/${datadir}/${PN}/pki
> +    fi
> +
>         cd $D/${sysconfdir}/openvswitch-controller
>          if ! test -e cacert.pem; then
>              ln -s $D/${datadir}/${PN}/pki/switchca/cacert.pem cacert.pem
> --
> 1.7.9.5
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

