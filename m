Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F25AEE00DA3; Wed, 31 Jul 2019 19:17:19 -0700 (PDT)
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
	*      [209.85.167.66 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5381BE00CD7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Jul 2019 19:17:19 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id x3so49055539lfc.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Jul 2019 19:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Km7aiAlnnrluD8Gg2q/3Ue/db9U4+qmi6GG9uOt0ZWU=;
	b=p/lFo23ClKHk1zRSR2bq9kr+UvVWY2OB7ZO7OFJ6ZwrIRbNpsMzy2J2M5BHgCFClUD
	qGxWoeFjwh+pBlYLW3QxGHOSGzCRzrcNn746kpSiw2TmJ3+zSIkwx4IT72UqlURBQXQj
	Birb4YZM2KIVUYiYuDGnt/pM2GbpcMmJ0qhZ51N67kNlJvlDDpBVMInScOVDJ14J2+LX
	ztVZdUkeI1u2rORWa8D2nq4Ek6rhe89I0K8LGs84Xb9nOXxXNHURhqsXpg2pbrG4pq25
	Vk0BrOFj/sPudUtrwAdfZcK+hDvuWKq7UhC6fMhhGnRoS6ApyV8P/HYo1b41kDlJTREu
	iBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Km7aiAlnnrluD8Gg2q/3Ue/db9U4+qmi6GG9uOt0ZWU=;
	b=RkhTQKyT9cqoU3FyaKcLOxI1DjchaCC+68J/q0OshObThxIv/x4GIMR9efBS3PkYco
	vmt3+lKdABQPe08TZlueYoEb4c2CH2AUfibYUjAnFMTOmF+2zQsQPzpUsS79071Vzitt
	30/aZMeJ65fCC2bsfZIj9Hk5cftvD575gCbvPumZiTGhlW0MaKqpHSg8b1ROyt9obklh
	tvByHaoJvXKTCg1x6cADf5wCJ48thwN4vM2UDFgCqro0P7oXWHvjQnfCaLlGJ+ffzPVY
	0SX8g5OGgP7Q54p7yBRteRgQKSRH3ZCo/prGNzG/BUyUTUw9QhvpCRNS8dx8FYFm+Wmc
	t74g==
X-Gm-Message-State: APjAAAXvch1SZ6kJf9JgC4/3bHcZ0l/MeyH0xfrpqo6JWa9Gndy43uwt
	BzuX1sf2GZ/t3+m/ZFWWnEc0fdQJwm9fcGy4UR4=
X-Google-Smtp-Source: APXvYqxKtPm7mTYG8xdFHK2OfbI6u6yrbT0UC0omDSG+s8WFUzY3g9Sx7WFKdLW/xqrdpd3DjRGUWSmmdwLT9Ov4tGg=
X-Received: by 2002:a19:491d:: with SMTP id w29mr60257514lfa.149.1564625838248;
	Wed, 31 Jul 2019 19:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <1564469542-339956-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1564469542-339956-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 Jul 2019 22:17:10 -0400
Message-ID: <CADkTA4M6TQ4V+bDi=kfoYi+mzE_x41Z7oNWOxZKVesCqbexqoQ@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvirt: Remove numactl from PACKAGECONFIG for arm
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
X-List-Received-Date: Thu, 01 Aug 2019 02:17:20 -0000
Content-Type: multipart/alternative; boundary="0000000000004b96d8058f04d7ed"

--0000000000004b96d8058f04d7ed
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Jul 30, 2019 at 2:52 AM <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> b5b5def ("libvirt: add hook support") introduces a wrong check against
> KARCH
> which is not defined.
>
> This patch use TARGET_ARCH overrides to remove numactl from PACKAGECONFIG
> for
> 32-bit arm arches.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_5.5.0.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_5.5.0.bb
> b/recipes-extended/libvirt/libvirt_5.5.0.bb
> index 80f7a6c..de936c4 100644
> --- a/recipes-extended/libvirt/libvirt_5.5.0.bb
> +++ b/recipes-extended/libvirt/libvirt_5.5.0.bb
> @@ -192,13 +192,16 @@ PACKAGECONFIG ??= "qemu yajl openvz vmware vbox esx
> iproute2 lxc test \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux',
> 'selinux audit libcap-ng', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'xen',
> 'libxl', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'polkit',
> 'polkit', '', d)} \
> -                   ${@bb.utils.contains('KARCH', 'arm', '', 'numactl',
> d)} \
>                    "
>
>  # qemu is NOT compatible with mips64
>  PACKAGECONFIG_remove_mipsarchn32 = "qemu"
>  PACKAGECONFIG_remove_mipsarchn64 = "qemu"
>
> +# numactl is NOT compatible with arm
> +PACKAGECONFIG_remove_arm = "numactl"
> +PACKAGECONFIG_remove_armeb = "numactl"
> +
>  # enable,disable,depends,rdepends
>  #
>  PACKAGECONFIG[gnutls] = ",,,gnutls-bin"
> --
> 2.7.4
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004b96d8058f04d7ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, J=
ul 30, 2019 at 2:52 AM &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=
=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
<br>
b5b5def (&quot;libvirt: add hook support&quot;) introduces a wrong check ag=
ainst KARCH<br>
which is not defined.<br>
<br>
This patch use TARGET_ARCH overrides to remove numactl from PACKAGECONFIG f=
or<br>
32-bit arm arches.<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D=
"_blank">zhe.he@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_5.5.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_5.5.0.bb</a> | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_5.5.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libvirt_5.5.0.bb</a> b/recipes-extended=
/libvirt/<a href=3D"http://libvirt_5.5.0.bb" rel=3D"noreferrer" target=3D"_=
blank">libvirt_5.5.0.bb</a><br>
index 80f7a6c..de936c4 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_5.5.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_5.5.0.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_5.5.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_5.5.0.bb</a><br>
@@ -192,13 +192,16 @@ PACKAGECONFIG ??=3D &quot;qemu yajl openvz vmware vbo=
x esx iproute2 lxc test \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;selinux&#39;, &#39;selinux =
audit libcap-ng&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;xen&#39;, &#39;libxl&#39;, =
&#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;polkit&#39;, &#39;polkit&#3=
9;, &#39;&#39;, d)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;KARCH&#39;, &#39;arm&#39;, &#39;&#39;, &#39;numactl&#3=
9;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
<br>
<br>
=C2=A0# qemu is NOT compatible with mips64<br>
=C2=A0PACKAGECONFIG_remove_mipsarchn32 =3D &quot;qemu&quot;<br>
=C2=A0PACKAGECONFIG_remove_mipsarchn64 =3D &quot;qemu&quot;<br>
<br>
+# numactl is NOT compatible with arm<br>
+PACKAGECONFIG_remove_arm =3D &quot;numactl&quot;<br>
+PACKAGECONFIG_remove_armeb =3D &quot;numactl&quot;<br>
+<br>
=C2=A0# enable,disable,depends,rdepends<br>
=C2=A0#<br>
=C2=A0PACKAGECONFIG[gnutls] =3D &quot;,,,gnutls-bin&quot;<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--0000000000004b96d8058f04d7ed--
