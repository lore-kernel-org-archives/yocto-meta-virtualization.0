Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A6F7E00B58; Tue, 21 May 2019 07:39:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0481DE00931
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 May 2019 07:39:56 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id w1so16150014ljw.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 May 2019 07:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SFB531mtxcwvpOEzUYqTLBq0keFwRbMqdFgrl9nWq2k=;
	b=NvtNcPGQtw87Bl/+kNH+546s7QZ3NVOGuQ0nxHJKprWY+csFx8PaLEyanMcPhF0NqH
	Q1tXJNsaQ3JKfdTO02k6+etWaAM4e80dCQeHO2O1377Kbd0sfk32bGOvf+iC09HS5rxc
	i4WClrvPSK+Ck27Y7TlA4VYT2XQRG1YnMwQaKjVf9B5nibEqfgs4GqTC561qSlXkW4Ns
	wZ4/xFRazoX2QYdaNX4XhQip8WAy5jSlqmncT4Lpvv17YLvx15epyjsbGJftHL9eY6R0
	04jCEADXoBMDOY3MRMvDVu95jVMCov2odQBK/6b8eMZK4PVVosQ/O5jD6K5+31KxFmH5
	vrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SFB531mtxcwvpOEzUYqTLBq0keFwRbMqdFgrl9nWq2k=;
	b=Bz9uPX3V7CV+cm6zGDc1W+/4rGUFt99E3GDJ0qhqmjbmiBdk3SYKy5H58Xy/L2bFNo
	G56h7kCdO3JTz5klALK8x9pVMED+IqlAnB9cJgc5CpulSLpPaW6f3CTEFaGhtf8ifL7v
	Ls/xQ/u0NeaSAO2Kw/lNL/bPav6mXeNNbzNs0j9PI1FArzf+RXY21ebErelneTFPk/Af
	qalErTkTmFz5Re2tJKGDGVZQbcaZKToKeCqn1TZaLjUu6UEtFjfOtMup2roGOSjyz+cD
	xMpjnghMxuhnS7i78I+yhuZvFBAS1oYmmAVpXgBBmAbZUhusTKEmaU9V8FjVHrBhIDGy
	LlAg==
X-Gm-Message-State: APjAAAXt8xuiIrkdQEQiqfXXDFeNvC/7LHnSg7iIZvPRV7lYHltgc2m3
	+k8Y6bGkH4/QLcQJD5EvVAzNWPlnAEkaUbusG+3sffES
X-Google-Smtp-Source: APXvYqx7uT3jjs05OcVdFdC90WtB0pdJe4oH1vqIELmooVTISwkIOy8bEVKC67XZGBY1tWAhkiQdBbZwDIBHykCvj94=
X-Received: by 2002:a2e:864e:: with SMTP id i14mr10738912ljj.141.1558449595849;
	Tue, 21 May 2019 07:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <1557936398-36529-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1557936398-36529-1-git-send-email-hongxu.jia@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 May 2019 10:39:44 -0400
Message-ID: <CADkTA4MbPAADy96fnMMDFPwDfMWeQ9vO=PRUx=Qu8xZHccLuTw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvirt: fix Nothing PROVIDES 'numactl' on ARM
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
X-List-Received-Date: Tue, 21 May 2019 14:39:58 -0000
Content-Type: multipart/alternative; boundary="0000000000008fa19b058966d245"

--0000000000008fa19b058966d245
Content-Type: text/plain; charset="UTF-8"

On Wed, May 15, 2019 at 12:07 PM Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> ARM does not currently support NUMA, and defines COMPATIBLE_HOST in recipe
> numactl
>
> Since commit [b5b5def libvirt: add hook support] applied, it failed with
> Nothing PROVIDES 'numactl' on ARM BSP, not all BSP define var-KARCH but
> define var-TARGET_ARCH
>
> So check var-TARGET_ARCH, and add numactl to PACKAGECONFIG conditionally


> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_5.3.0.bb | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_5.3.0.bb
> b/recipes-extended/libvirt/libvirt_5.3.0.bb
> index 30bb44c..a949e8f 100644
> --- a/recipes-extended/libvirt/libvirt_5.3.0.bb
> +++ b/recipes-extended/libvirt/libvirt_5.3.0.bb
> @@ -189,9 +189,17 @@ PACKAGECONFIG ??= "qemu yajl openvz vmware vbox esx
> iproute2 lxc test \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux',
> 'selinux audit libcap-ng', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'xen',
> 'libxl', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'polkit', '', d)} \
> -                   ${@bb.utils.contains('KARCH', 'arm', '', 'numactl',
> d)} \
> +                   ${@support_numactl(d)} \
>                    "
>
> +def support_numactl(d):
> +    targetarch = d.getVar("TARGET_ARCH")
> +    # ARM does not currently support NUMA
> +    if targetarch.startswith("arm"):
> +        return ""
> +
> +    return "numactl"
> +
>

Checking TARGET_ARCH is definitely the right thing to use for this.

But out of curiosity, why can't we change it to work the same as the qemu
PACKAGECONFIG setting ?

i.e. PACKAGECONFIG_remove_arm = "numactl"
PACKAGECONFIG_remove_arm64 = "numactl"

(or whatever the ARM64 target arch maps to).

Bruce



>  # qemu is NOT compatible with mips64
>  PACKAGECONFIG_remove_mipsarchn32 = "qemu"
>  PACKAGECONFIG_remove_mipsarchn64 = "qemu"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000008fa19b058966d245
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, May 15, 2019 at 12:07 PM Hongxu Jia &lt;<a =
href=3D"mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">ARM does n=
ot currently support NUMA, and defines COMPATIBLE_HOST in recipe<br>
numactl<br>
<br>
Since commit [b5b5def libvirt: add hook support] applied, it failed with<br=
>
Nothing PROVIDES &#39;numactl&#39; on ARM BSP, not all BSP define var-KARCH=
 but<br>
define var-TARGET_ARCH<br>
<br>
So check var-TARGET_ARCH, and add numactl to PACKAGECONFIG conditionally=C2=
=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_5.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_5.3.0.bb</a> | 10 +++++++++-<br>
=C2=A01 file changed, 9 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_5.3.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libvirt_5.3.0.bb</a> b/recipes-extended=
/libvirt/<a href=3D"http://libvirt_5.3.0.bb" rel=3D"noreferrer" target=3D"_=
blank">libvirt_5.3.0.bb</a><br>
index 30bb44c..a949e8f 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_5.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_5.3.0.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_5.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_5.3.0.bb</a><br>
@@ -189,9 +189,17 @@ PACKAGECONFIG ??=3D &quot;qemu yajl openvz vmware vbox=
 esx iproute2 lxc test \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;selinux&#39;, &#39;selinux =
audit libcap-ng&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;xen&#39;, &#39;libxl&#39;, =
&#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;polkit&#39;,=
 &#39;&#39;, d)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;KARCH&#39;, &#39;arm&#39;, &#39;&#39;, &#39;numactl&#3=
9;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@su=
pport_numactl(d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
<br>
<br>
+def support_numactl(d):<br>
+=C2=A0 =C2=A0 targetarch =3D d.getVar(&quot;TARGET_ARCH&quot;)<br>
+=C2=A0 =C2=A0 # ARM does not currently support NUMA<br>
+=C2=A0 =C2=A0 if targetarch.startswith(&quot;arm&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 return &quot;numactl&quot;<br>
+<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">Checking TARGET_ARCH is definitely the right thing to use=
 for this.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">But out of cur=
iosity, why can&#39;t we change it to work the same as the qemu PACKAGECONF=
IG setting ?</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">i.e. PACKAGE=
CONFIG_remove_arm =3D &quot;numactl&quot;</div><div class=3D"gmail_default"=
 style=3D"font-size:small">PACKAGECONFIG_remove_arm64 =3D &quot;numactl&quo=
t;</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">(or whatever the ARM64=
 target arch maps to).</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Br=
uce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0# qemu is NOT compatible with mips64<br>
=C2=A0PACKAGECONFIG_remove_mipsarchn32 =3D &quot;qemu&quot;<br>
=C2=A0PACKAGECONFIG_remove_mipsarchn64 =3D &quot;qemu&quot;<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000008fa19b058966d245--
