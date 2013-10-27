Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11A84E01781
	for <meta-virtualization@yoctoproject.org>;
	Sat, 26 Oct 2013 20:51:36 -0700 (PDT)
Received: by mail-la0-f49.google.com with SMTP id eh20so4117525lab.8
	for <meta-virtualization@yoctoproject.org>;
	Sat, 26 Oct 2013 20:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LTWOwqqXyaAxnPGAlh7pRd0QKD6RxqEgRDPMG64fn8I=;
	b=juHYE63vAswOsoMWvxAswlJPBSdCOTnFyt9CIwxI9rVkVsd0p0Kdn7qWBZaZa0tSCx
	I0vMWcIIrLv7K2DviI7d9UjsfHQxq5qYXlbCzNBJDyoP+HrT/Twfj/XFQ9SWzhN2B27c
	EQOe04o/x7ZftLw0U5mgEQR2IrqGPhwEibBA5KgOrh35Wv4UUf/4OcWz7xFP4xToRXVH
	NcfkWsL1fGp9TB/q5fh7BqpEp/dfpCpaSH13/Bm/CnGeS4wX+UKO8qapp//Bw79LuQQ6
	tCArJuKNLP24BaO1BnjBXUtebyVr7ek+xoxH1s4rm/lZtakZuVtXb5hSzhVWql0FRw4b
	N/tg==
MIME-Version: 1.0
X-Received: by 10.112.136.65 with SMTP id py1mr3166510lbb.4.1382845894599;
	Sat, 26 Oct 2013 20:51:34 -0700 (PDT)
Received: by 10.112.14.200 with HTTP; Sat, 26 Oct 2013 20:51:34 -0700 (PDT)
In-Reply-To: <1382736387-20490-1-git-send-email-paul.barrette@windriver.com>
References: <1382736387-20490-1-git-send-email-paul.barrette@windriver.com>
Date: Sat, 26 Oct 2013 23:51:34 -0400
Message-ID: <CADkTA4OAEjX4Y6=qvEDJBqXXxKovO=Ay744HkgBC2bf4kTgOGQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Barrette <paul.barrette@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: fix RDEPENDS issue for installers.
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
X-List-Received-Date: Sun, 27 Oct 2013 03:51:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 25, 2013 at 5:26 PM, Paul Barrette
<paul.barrette@windriver.com> wrote:
> Make sure openvswitch has all the runtime dependencies defined.
> Without e.g. sed, an installer may calculate dependencies and order
> packages based on the deps, which may install openvswitch before sed.
> This would result in an install failure, when the post install step
> calls ovs-pki, which uses sed.

Looks fine to me, better to be explicit with the dependencies.

merged to the tree.

Bruce

>
> Signed-off-by: Paul Barrette <paul.barrette@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch_1.10.0.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> index 9cdd839..02c8ab3 100644
> --- a/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> +++ b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> @@ -14,7 +14,11 @@ RDEPENDS_${PN}-pki = "${PN}"
>  RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
>  RRECOMMENDS_${PN} += "kernel-module-openvswitch"
>
> -PR = "r2"
> +# Some installers will fail because of an install order based on
> +# rdeps.  E.g. ovs-pki calls sed in the postinstall.  sed may be
> +# queued for install later.
> +RDEPENDS_${PN} += "sed gawk grep"
> +PR = "r3"
>
>  SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
>         file://openvswitch-switch \
> --
> 1.8.1.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

