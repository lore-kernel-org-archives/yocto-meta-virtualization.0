Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F33EE02E6B; Tue, 12 Jun 2018 22:57:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F971E02857
	for <meta-virtualization@yoctoproject.org>;
	Tue, 12 Jun 2018 22:57:23 -0700 (PDT)
Received: by mail-lf0-f52.google.com with SMTP id t134-v6so1977165lff.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 12 Jun 2018 22:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZsqYoR9jN4RDCsqVEjYiBPZuSko9kvptzbcFBJvRX/M=;
	b=ROJulpBaFz1lWXL698e5XmNLaDm7MM0KZQBPUql0qkmgx0gvEt4nGW6mrI97bMfA0Q
	6mi43Uzr2v6h8k5LljAcCwkqO45EG8HsVc9J5GZT3PK7X7LfDY/pwf3/v50X5i82LQiW
	5Dzo5sMbrfNRUp7UHXJ/debou42Maoe1o3ewE9M8Vl7XLcpJeeRBEqbioFNsrghaJRG7
	5E9bFHHaqRfXywLyA4wFYuOuq1D21nFQ0zsfqXQSpplheLHRjzgknjJDH2tgrt9PLIIw
	VYDOubuHrxFZ3k7CYPbSFgLG0j0VQ8CPQAnJYMVaY/u9yxGVBrcTUW4kW7nK9PEl+OkR
	Hu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZsqYoR9jN4RDCsqVEjYiBPZuSko9kvptzbcFBJvRX/M=;
	b=CyDp4pvO0ZQwmB1F2rLDWjajN3PlJqaYf/RscdqAfgWKfICJTJfGUEETCJQ/q+T63B
	kUiiDqGhjN0j6q+BFs32BRSHqHZUA557eN9Inrfc0CBpx/R8kQ2rtHs3eKO0MWzZwqSw
	rnuHZrTG0vrX6yP5BFTSKTgknyGX3W2L0NBh3caGj2EAgbrlqVVK7sYYICz8CMS0bpF0
	M/5b/uCj9SIFZ7shqV9dV6dJGRvV00MEjLYr2iRBjy8hjApk8QUFcoesu6s6Zsxfdgob
	1vP8u00uM33UNkjfpvCYsTuDvgzhEp8FnYx7rX2hzatRvUmYsM8aIvZTNIzkgZG1ESx8
	95zA==
X-Gm-Message-State: APt69E14R4c/ttKxKdTl1I4/8Ify98xH6lMqGhS1qgFzU2BAgqkuvhYl
	B6Df/8Y7CLSkXphcOEgwtFZPMaKuuGJc2EO6LUESRw==
X-Google-Smtp-Source: ADUXVKL2+VPbgUPBPuzpxej3UyJCtX3nYNo/5XAqbD+/OYNDm59aLkekwDLU3Vl9+HK1Ifvi4GVq3k2f2AGnLNxWMkQ=
X-Received: by 2002:a19:a68a:: with SMTP id
	p132-v6mr1854558lfe.89.1528869443004; 
	Tue, 12 Jun 2018 22:57:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP; Tue, 12 Jun 2018 22:57:22
	-0700 (PDT)
In-Reply-To: <1528843023-21625-1-git-send-email-jpuhlman@mvista.com>
References: <1528843023-21625-1-git-send-email-jpuhlman@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Jun 2018 01:57:22 -0400
Message-ID: <CADkTA4O-6yFZtarpDoefbNk5xsJjadhS_oZCzOt2hPbnJiazwQ@mail.gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] Check for qemu pkgconfig before qemu.conf modify
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
X-List-Received-Date: Wed, 13 Jun 2018 05:57:27 -0000
Content-Type: multipart/alternative; boundary="0000000000000eef21056e7fa8b6"

--0000000000000eef21056e7fa8b6
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 12, 2018 at 6:37 PM, Jeremy Puhlman <jpuhlman@mvista.com> wrote:

> /etc/libvirt/qemu.conf doesn't exist if qemu is disabled causing a
> build failure.
>
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>  recipes-extended/libvirt/libvirt_4.3.0.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_4.3.0.bb
> b/recipes-extended/libvirt/libvirt_4.3.0.bb
> index ef51b9e..5cae02b 100644
> --- a/recipes-extended/libvirt/libvirt_4.3.0.bb
> +++ b/recipes-extended/libvirt/libvirt_4.3.0.bb
> @@ -266,8 +266,10 @@ do_install_append() {
>         fi
>
>         # disable seccomp_sandbox
> -       sed -i '/^#seccomp_sandbox = 1/aseccomp_sandbox = 0' \
> -           ${D}${sysconfdir}/libvirt/qemu.conf
> +        if ${@bb.utils.contains('PACKAGECONFIG', 'qemu', 'true',
> 'false', d)}; then
>

Rather than key off the package config, why not just test for the file's
existence and then only operate on it if it is there ? That is always safe,
simpler and protects us from build failures if the behaviour/output of
libvirt changes with respect to qemu in the future.

We could argue that we could check both, or warn if the package config is
on, but the file isn't present .. but I'd still prefer to just keep it
simple and all basic shell operations.

Cheers,

Bruce


> +          sed -i '/^#seccomp_sandbox = 1/aseccomp_sandbox = 0' \
> +              ${D}${sysconfdir}/libvirt/qemu.conf
> +        fi
>
>         # Add hook support for libvirt
>         mkdir -p ${D}/etc/libvirt/hooks
> --
> 2.6.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--0000000000000eef21056e7fa8b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jun 12, 2018 at 6:37 PM, Jeremy Puhlman <span dir=3D"ltr">&lt;<=
a href=3D"mailto:jpuhlman@mvista.com" target=3D"_blank">jpuhlman@mvista.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">/etc/libvirt/qemu.=
conf doesn&#39;t exist if qemu is disabled causing a<br>
build failure.<br>
<br>
Signed-off-by: Jeremy Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista.com">jp=
uhlman@mvista.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_4.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvi<wbr>rt_4.3.0.bb</a> | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_4.3.0.bb" r=
el=3D"noreferrer" target=3D"_blank">lib<wbr>virt_4.3.0.bb</a> b/recipes-ext=
ended/libvirt/<a href=3D"http://libvirt_4.3.0.bb" rel=3D"noreferrer" target=
=3D"_blank">lib<wbr>virt_4.3.0.bb</a><br>
index ef51b9e..5cae02b 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_4.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>virt_4.3.0.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_4.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>virt_4.3.0.bb</a><br>
@@ -266,8 +266,10 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # disable seccomp_sandbox<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;/^#seccomp_sandbox =3D 1/aseccomp_s=
andbox =3D 0&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${sysconfdir}/libvirt/<wbr>qe=
mu.conf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;<wbr>PACKAGECONFI=
G&#39;, &#39;qemu&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br></blo=
ckquote><div><br></div><div>Rather than key off the package config, why not=
 just test for the file&#39;s existence and then only operate on it if it i=
s there ? That is always safe, simpler and protects us from build failures =
if the behaviour/output of libvirt changes with respect to qemu in the futu=
re.</div><div><br></div><div>We could argue that we could check both, or wa=
rn if the package config is on, but the file isn&#39;t present .. but I&#39=
;d still prefer to just keep it simple and all basic shell operations.</div=
><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;/^#seccomp_sandbox =3D 1/as=
eccomp_sandbox =3D 0&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${sysconfdir}/libvirt=
/<wbr>qemu.conf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add hook support for libvirt<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/etc/libvirt/hooks<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.6.2<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--0000000000000eef21056e7fa8b6--
