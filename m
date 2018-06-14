Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D53BE00DFE; Thu, 14 Jun 2018 01:34:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.46 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8EE2CE02144
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Jun 2018 01:34:08 -0700 (PDT)
Received: by mail-lf0-f46.google.com with SMTP id n3-v6so8064440lfe.12
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Jun 2018 01:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bCXxTQ69hYgdfjkFbBYHQBbBYIpE4pOu4Ay4hcaMaso=;
	b=stcy5t+hwHgdgv/3uL3CltGVHOXIwW7y60J9EH8z0n3385SVGH26cZEB2vEso2R6Fq
	yk1Tim5KQH6N2919nXgQmX8U0V4F73F4+Bglj53/Oe4DJckqox516DL5y4/F/dKH6cR6
	JvmSLI6do/XCYNwBYOxdabLzqiexw5HaJgYeCgbizLT8PB9KvBIpwTTK3HUdqMOjdU8P
	y9oCEF2zJrFkHEm5NF+AivOTVHq+Fr4f5ibJ6wHgYjfJfakPGLJjjC6bT3ond6A9QsaE
	3/hpBVomEIIlTwpXZtuszbG8jp951HVd4rE2o4qni8teUpYtitqfRuX5/9C10yiI6li+
	F5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bCXxTQ69hYgdfjkFbBYHQBbBYIpE4pOu4Ay4hcaMaso=;
	b=If5AmckRXOWh1n+wsofq0g6qzZOM674ZbrnjzIA/z/a52Jmr/kb55y0phU1Grafota
	bVWEXGDRHg09srYl6yhAUXTfQKLd0TlnXbkHnRWh+uwk2PKxTNnzEdyMBj4oSaZjsXR7
	+4YO3wMHq97MKT3vOfYTPNbVabTdDWE+DQ/tK6DYBSp+VlL6hLd28YLyUaTB7LeiVBv4
	4mV0R8JKFvrIlKEsTQ7jxcbcehnmaQXZ2yxrvkj3UpxNRNq9E/STtcyOHquag51RKg51
	/URal04+YJGlUWJJUMlEnzYe7ByjgyCZDcjh9rLOGNMaBM4oSmj/dBykK1WuKnZke3O5
	P4Tw==
X-Gm-Message-State: APt69E20BUflF+boLommL4wMpzW/Mk0UZy6IpSQuk5ennGEUOFgWbEfR
	EabD0xX97CYwnXtUBFKGzCyhZi1fP5Yv7KAeeq8Vaw==
X-Google-Smtp-Source: ADUXVKL9bmvdnT1FQ33FiDZ5f9n4swN4IHIPyQh4Cwu5DHgqMGHflWkiRElskphGNYjmO9w3H939KOl1FBtND6MSQGQ=
X-Received: by 2002:a2e:585:: with SMTP id 127-v6mr1067711ljf.28.1528965247549;
	Thu, 14 Jun 2018 01:34:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 01:34:06
	-0700 (PDT)
In-Reply-To: <20180613233253.18859-1-jpuhlman@mvista.com>
References: <20180613233253.18859-1-jpuhlman@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Jun 2018 04:34:06 -0400
Message-ID: <CADkTA4OL2eNjDPRToKD8xoxbJ1_KvPNyV8PTw3oDisCOJOmQ2Q@mail.gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvirt: Check for qemu.conf before modifying
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
X-List-Received-Date: Thu, 14 Jun 2018 08:34:12 -0000
Content-Type: multipart/alternative; boundary="000000000000744726056e95f665"

--000000000000744726056e95f665
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Jun 13, 2018 at 7:32 PM, Jeremy Puhlman <jpuhlman@mvista.com> wrote:

> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>  recipes-extended/libvirt/libvirt_4.3.0.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_4.3.0.bb
> b/recipes-extended/libvirt/libvirt_4.3.0.bb
> index ef51b9e..edd5261 100644
> --- a/recipes-extended/libvirt/libvirt_4.3.0.bb
> +++ b/recipes-extended/libvirt/libvirt_4.3.0.bb
> @@ -266,8 +266,10 @@ do_install_append() {
>         fi
>
>         # disable seccomp_sandbox
> -       sed -i '/^#seccomp_sandbox = 1/aseccomp_sandbox = 0' \
> -           ${D}${sysconfdir}/libvirt/qemu.conf
> +        if [ -e ${D}${sysconfdir}/libvirt/qemu.conf ] ; then
> +          sed -i '/^#seccomp_sandbox = 1/aseccomp_sandbox = 0' \
> +              ${D}${sysconfdir}/libvirt/qemu.conf
> +        fi
>
>         # Add hook support for libvirt
>         mkdir -p ${D}/etc/libvirt/hooks
> --
> 2.11.1
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

--000000000000744726056e95f665
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged<div><br></div><div>Bruce</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Wed, Jun 13, 2018 at 7:32 PM,=
 Jeremy Puhlman <span dir=3D"ltr">&lt;<a href=3D"mailto:jpuhlman@mvista.com=
" target=3D"_blank">jpuhlman@mvista.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">Signed-off-by: Jeremy Puhlman &lt;<a href=3D"mailto:jp=
uhlman@mvista.com">jpuhlman@mvista.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_4.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvi<wbr>rt_4.3.0.bb</a> | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_4.3.0.bb" r=
el=3D"noreferrer" target=3D"_blank">lib<wbr>virt_4.3.0.bb</a> b/recipes-ext=
ended/libvirt/<a href=3D"http://libvirt_4.3.0.bb" rel=3D"noreferrer" target=
=3D"_blank">lib<wbr>virt_4.3.0.bb</a><br>
index ef51b9e..edd5261 100644<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${D}${sysconfdir}/libvirt/<wbr>qemu.co=
nf ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;/^#seccomp_sandbox =3D 1/as=
eccomp_sandbox =3D 0&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${sysconfdir}/libvirt=
/<wbr>qemu.conf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add hook support for libvirt<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/etc/libvirt/hooks<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.11.1<br>
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
</div>

--000000000000744726056e95f665--
