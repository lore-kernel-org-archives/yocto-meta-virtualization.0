Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B7143E00D23; Fri, 20 May 2016 09:33:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05D23E00CE1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 May 2016 09:33:37 -0700 (PDT)
Received: by mail-oi0-f67.google.com with SMTP id g16so11153522oib.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 May 2016 09:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=b/vJ1gbH6uChkFjOT8qvWuy5oBSErdvcpd5FAX8bHAk=;
	b=D/ZW6U9xEE0uPcaZ8hY9lOQNGCKIfemmAVIC4NPHejKF/slRHt1gqBmBsbZdyaprtm
	Kfxz0WpmbBSpUQFjH9P670rIMAMjdrnCBapRNHSWHchziBuMlTf0Nl/REQkt5xOTEsLJ
	MOQou7gHzRIWgcEwwaeNcEv3yYUVwLRg4NHef4N3VCWK76uXBfUYDa869K32oHArfxGA
	J4aooM2fxHatjyckxP35IKkDRDIB8+6I/+xUsTjU1urNilSbH1uexf8Fh2XF0WHL18+5
	5+KO5WknC/pns3MCN8DNdzyUcFPvGKku8uW9GqgvW0NOpQSNa+5RxkwC18ndpqzQWu2V
	0NeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=b/vJ1gbH6uChkFjOT8qvWuy5oBSErdvcpd5FAX8bHAk=;
	b=mYiKfWdyJ949PdCylRf5/4dD1qnaeu2Izx4Gsf6J1piaIibpdZmLtJ0zKEMIAPdhAv
	6crH+QFEouWspzm59KFvV708z90Dd9mB37yNE//V9Qu5gCWntv6xOF7g77uR9pIjDIq3
	iyI0xmNkVRhobw1kjyzs2Uw2KPujQrG6ID0bjnAYqn49n+OE/Yk2JZ1fuuUQXHIy0edX
	m/JiJCnHI31+WEpU7VIo1P235YMR7y4ZeFDRP3L+bFGZWM8aFeIkW651dzBVw9gJpQd2
	DlZm6+Jd1lVoqbK2iCyr1j2zljtDjlg6PGIwcx0lK+LD25hGqqU8uqTs3d6RE+lQ7AhK
	l0bw==
X-Gm-Message-State: AOPr4FVbwJbHFMK2u0QfEPyfRapIlI3xOX+rcOoTiq19S0kcmb+/YRF7BHcvmYyXHEIUSBW8VwoRcwPpUWE+3g==
MIME-Version: 1.0
X-Received: by 10.202.195.205 with SMTP id t196mr2599552oif.191.1463762016557; 
	Fri, 20 May 2016 09:33:36 -0700 (PDT)
Received: by 10.157.32.198 with HTTP; Fri, 20 May 2016 09:33:36 -0700 (PDT)
In-Reply-To: <1463725643-4514-1-git-send-email-zhe.he@windriver.com>
References: <1463725643-4514-1-git-send-email-zhe.he@windriver.com>
Date: Fri, 20 May 2016 12:33:36 -0400
Message-ID: <CADkTA4PhPeH8OtSknWb2U0AhoPz3x2-neFFxuX3HQ8epkrbpXQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] qemu: Add packageconfig for libseccomp to avoid rdepend QA warning
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
X-List-Received-Date: Fri, 20 May 2016 16:33:38 -0000
Content-Type: multipart/alternative; boundary=001a11415b48086045053348a700

--001a11415b48086045053348a700
Content-Type: text/plain; charset=UTF-8

merged to master.

Bruce

On Fri, May 20, 2016 at 2:27 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> "WARNING: QA Issue: qemu rdepends on libseccomp, but it isn't a build
> dependency? [build-deps]"
>
> Currently qemu itself checks and links with libsecomp(if version >= 2.1.1)
> for x86 and x86-64, since it is not specified in configure, and causes the
> above warning.
>
> This patch adds packageconfig for libseccomp and set it disabled as
> default.
> This feature can be enabled whenever libseccomp exists and is needed.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
> b/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
> index ca8274e..9d774c4 100644
> --- a/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
> +++ b/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
> @@ -1,4 +1,5 @@
>  PACKAGECONFIG[spice] = "--enable-spice,--disable-spice,spice,"
> +PACKAGECONFIG[libseccomp] =
> "--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
>
>  PACKAGECONFIG ?= "fdt spice virtfs libcap-ng"
>  PACKAGECONFIG_class-native = "fdt"
> --
> 1.9.1
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

--001a11415b48086045053348a700
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged to master.<div><br></div><div>Bruce</div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, May 20, 2016 =
at 2:27 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.he@windriver.com" =
target=3D"_blank">zhe.he@windriver.com</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">From: He Zhe &l=
t;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@windriver.com</a>&gt;<br>
<br>
&quot;WARNING: QA Issue: qemu rdepends on libseccomp, but it isn&#39;t a bu=
ild<br>
dependency? [build-deps]&quot;<br>
<br>
Currently qemu itself checks and links with libsecomp(if version &gt;=3D 2.=
1.1)<br>
for x86 and x86-64, since it is not specified in configure, and causes the<=
br>
above warning.<br>
<br>
This patch adds packageconfig for libseccomp and set it disabled as default=
.<br>
This feature can be enabled whenever libseccomp exists and is needed.<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend b/meta-=
openstack/recipes-devtools/qemu/qemu_2.%.bbappend<br>
index ca8274e..9d774c4 100644<br>
--- a/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend<br>
+++ b/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend<br>
@@ -1,4 +1,5 @@<br>
=C2=A0PACKAGECONFIG[spice] =3D &quot;--enable-spice,--disable-spice,spice,&=
quot;<br>
+PACKAGECONFIG[libseccomp] =3D &quot;--enable-seccomp,--disable-seccomp,lib=
seccomp,libseccomp&quot;<br>
<br>
=C2=A0PACKAGECONFIG ?=3D &quot;fdt spice virtfs libcap-ng&quot;<br>
=C2=A0PACKAGECONFIG_class-native =3D &quot;fdt&quot;<br>
--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div>

--001a11415b48086045053348a700--
