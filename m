Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58410E00A39; Thu, 24 Aug 2017 05:43:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.217.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.217.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AF924E00726
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 05:43:39 -0700 (PDT)
Received: by mail-ua0-f193.google.com with SMTP id j17so1034123uae.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 05:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4XWVmv+8S+0Y5HHiDcxcjWcqemSCsr+rU7Xz2gLuMUs=;
	b=ZdJLZGZE+ZcmB71owyArMVpEtpmujokl01tzHvB5UHLs72H/FWx7hOSB9uFJKd63HX
	FFQDnhBfhwlHfz5kMmcPBpZ9oP+4METom2xIZyrqRkUX8r1jZJZ2JfPURp3VyYvIuB7r
	v4wME7dWm/y3ANKTQkmc1z5lLXFFZLBs6M/Rdgv4GrZAp9Yg4MMWRfCy1TV5//5OIeRO
	rDth6dwQ7vOhSFLzq+BPIltFQDkqJ0vDXAwpIFb7TI0HbNEEpLQKuK9Bdg/Y7VLoMmgg
	JYtx1owVnX1BbIjx6Q+nJk8nn74hFhd4c2gJIAEuBtHDV6S2TYebJy9XhxVbXQwxpAj3
	rveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4XWVmv+8S+0Y5HHiDcxcjWcqemSCsr+rU7Xz2gLuMUs=;
	b=Bg8yOP04TBjlzVIMMj3CdsINakiqD0NgWhIzwWk32f6IDx6Rywpy3p0gOxaMJ5eYXb
	4kMlP6J8jL1DygDazOPAsiuDkn/bDwzpVfEdqVUXZv1SZPYjVoSzetB4eJuVsuj7G5Zw
	F9Y43gzwHYUl/kZQj3RNr5q7W+q1WAeN+oHBB33hfNcblJjdJodqnGDJO4a6N/TQpxbE
	TfeW/fyj481PEVv9VrnaJCwYrbwWoq27Qw9acVETacxwjS/+Y39c2kmSUnHRz878Y0kI
	uXrBshGDfri5wLyoRSIJo+bbjVdRBzE3Yzz5VUvrJhAlAnFbzNdydS8VOJhEWFn84wcV
	vZ0Q==
X-Gm-Message-State: AHYfb5guSD8E2vib4MufhjL0iCyGyR3wxSP4MPYpWaQkJIyt+H/D2H+e
	n83h8oTBk2QnsvZX9m8gqQ9nMAeaEA==
X-Received: by 10.159.58.96 with SMTP id r32mr2750512uag.168.1503578618631;
	Thu, 24 Aug 2017 05:43:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Thu, 24 Aug 2017 05:43:37 -0700 (PDT)
In-Reply-To: <1503558220-28686-1-git-send-email-B40290@freescale.com>
References: <1503558220-28686-1-git-send-email-B40290@freescale.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 Aug 2017 08:43:37 -0400
Message-ID: <CADkTA4NmNL=U_Zk4QuJmASh+rh3367AyawWMcnur9-JMsbqK0Q@mail.gmail.com>
To: Chunrong Guo <B40290@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, chunrong.guo@nxp.com
Subject: Re: [PATCH] kernel: drop 4.1 bbappend
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
X-List-Received-Date: Thu, 24 Aug 2017 12:43:40 -0000
Content-Type: multipart/alternative; boundary="f403045e903a749e2005577f2dd5"

--f403045e903a749e2005577f2dd5
Content-Type: text/plain; charset="UTF-8"

I already have this one queued. I was waiting for my patches to merge to
oe-core before pushing it.

Cheers,

Bruce

On Thu, Aug 24, 2017 at 3:03 AM, Chunrong Guo <B40290@freescale.com> wrote:

> From: Chunrong Guo <chunrong.guo@nxp.com>
>
>     *4.1 is no longer in oe-core master, so we drop the bbappend
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  recipes-kernel/linux/linux-yocto_4.1.bbappend | 20 --------------------
>  1 file changed, 20 deletions(-)
>  delete mode 100644 recipes-kernel/linux/linux-yocto_4.1.bbappend
>
> diff --git a/recipes-kernel/linux/linux-yocto_4.1.bbappend
> b/recipes-kernel/linux/linux-yocto_4.1.bbappend
> deleted file mode 100644
> index f163fdf..0000000
> --- a/recipes-kernel/linux/linux-yocto_4.1.bbappend
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI += "file://xt-checksum.scc \
> -            file://ebtables.scc \
> -           file://vswitch.scc \
> -           file://lxc.scc \
> -            file://docker.scc \
> -           "
> -KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
> -
> -KERNEL_MODULE_AUTOLOAD += "openvswitch"
> -KERNEL_MODULE_AUTOLOAD += "kvm"
> -KERNEL_MODULE_AUTOLOAD += "kvm-amd"
> -KERNEL_MODULE_AUTOLOAD += "kvm-intel"
> -
> -# aufs kernel support required for xen-image-minimal
> -KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES',
> 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
> -
> -# xen kernel support
> -SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '
> file://xen.scc', '', d)}"
> --
> 1.9.0
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

--f403045e903a749e2005577f2dd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I already have this one queued. I was waiting for my patch=
es to merge to oe-core before pushing it.<div><br></div><div>Cheers,</div><=
div><br></div><div>Bruce</div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Thu, Aug 24, 2017 at 3:03 AM, Chunrong Guo <span dir=
=3D"ltr">&lt;<a href=3D"mailto:B40290@freescale.com" target=3D"_blank">B402=
90@freescale.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Fr=
om: Chunrong Guo &lt;<a href=3D"mailto:chunrong.guo@nxp.com">chunrong.guo@n=
xp.com</a>&gt;<br>
<br>
=C2=A0 =C2=A0 *4.1 is no longer in oe-core master, so we drop the bbappend<=
br>
<br>
Signed-off-by: Chunrong Guo &lt;<a href=3D"mailto:B40290@freescale.com">B40=
290@freescale.com</a>&gt;<br>
---<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto_4.1.bbappend | 20 -------------=
-------<br>
=C2=A01 file changed, 20 deletions(-)<br>
=C2=A0delete mode 100644 recipes-kernel/linux/linux-<wbr>yocto_4.1.bbappend=
<br>
<br>
diff --git a/recipes-kernel/linux/linux-<wbr>yocto_4.1.bbappend b/recipes-k=
ernel/linux/linux-<wbr>yocto_4.1.bbappend<br>
deleted file mode 100644<br>
index f163fdf..0000000<br>
--- a/recipes-kernel/linux/linux-<wbr>yocto_4.1.bbappend<br>
+++ /dev/null<br>
@@ -1,20 +0,0 @@<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
-<br>
-SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ebtables.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://vswitch.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lxc.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable.<wbr>scc&qu=
ot;<br>
-<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;openvswitch&quot;<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm&quot;<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-amd&quot;<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-intel&quot;<br>
-<br>
-# aufs kernel support required for xen-image-minimal<br>
-KERNEL_FEATURES_append +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FE=
ATURES&#39;, &#39;aufs&#39;, &#39; features/aufs/aufs-enable.scc&#39;<wbr>,=
 &#39;&#39;, d)}&quot;<br>
-<br>
-# xen kernel support<br>
-SRC_URI +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#=
39;xen&#39;, &#39; file://xen.scc&#39;, &#39;&#39;, d)}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.0<br>
<br>
--<br>
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

--f403045e903a749e2005577f2dd5--
