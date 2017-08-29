Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14E2AE00C9F; Tue, 29 Aug 2017 05:43:47 -0700 (PDT)
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
	*      [209.85.213.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28CC5E00C94
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Aug 2017 05:43:44 -0700 (PDT)
Received: by mail-vk0-f68.google.com with SMTP id s199so1271814vke.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Aug 2017 05:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=datTAOVIT41+3FQzGpzaoRReJu1XKeKozUmDgJRJbrE=;
	b=f8b3YAUzVMZ1lnORFKVmg5co/ZLkMrUEhkPG10yPK5FJeI7+yzpUutVW4r2E1CytMU
	io0G4iIt7hCUGvfQMl+cLRicUJzK5xglWS83gBT7zbCDZe3jfcJBLhYexBaEjoYvsK/a
	jjseSfE7LksYwjVg8qjZAM+qKlS8/XVpfndhZ4fnPajA1L959YuuS4mk460iTLxqByAy
	LxQA3WHf1uUiqWX5QALxOJJQpYvj3UgbMxm+G0WNDhMdrbsYZgKgoejrEbklyQT2CpE9
	oIKFQ3+iEMUcSPEQjpvCK2VMJY+/hG0fPTklFwDKPSxo0TAp/E85ioKlT018lyLjsv2y
	Q+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=datTAOVIT41+3FQzGpzaoRReJu1XKeKozUmDgJRJbrE=;
	b=pdCSkKBt3T5Qc58X6ldrWMn8jCLSNH5t31BHN753PpjyKKT6j/Q3DVnUASVSOIZtu0
	MdnFuG9ZPl7I/rBdMkjxhJMo9NPeZ9K/S8INts5QolLtkcUrSFuij+v7LSdDAwkDfJUd
	wTDzDBx79wf55xsh5WMVsE8CPutS9M5KCYOkC5pipaSse/y7F2so11PPrS4zUlf40EBC
	nXBVR8PP+RUyYcGrHRmTgd38kuJtOUOtmjn7clxZBgBd2XVKlHmt/w/lP8R2p+7qchVK
	BSfZ8kXOfyJqTdZvZ5voOKR2jfqXCpinNzGFMheJuTmlNGO+1PcDbxpHxThwEhVe/zbm
	MCWg==
X-Gm-Message-State: AHYfb5hldkPLylJ5/aRhtuFdvXqhYETtf+Fd0ML8TWxZgCNA068qgrS0
	+flI5khsF79U6k801wPT3e8dnyPlEw==
X-Received: by 10.31.47.67 with SMTP id v64mr115598vkv.144.1504010623990; Tue,
	29 Aug 2017 05:43:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Tue, 29 Aug 2017 05:43:43 -0700 (PDT)
In-Reply-To: <1503600374-19479-1-git-send-email-christopher.w.clark@gmail.com>
References: <1503600374-19479-1-git-send-email-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 Aug 2017 08:43:43 -0400
Message-ID: <CADkTA4NG3SXB9vXdkU0A1o-u_rd+hcW6ooeBTP8O2kEOOtY7aQ@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: RFC : [PATCH] xen: remove xen-bootimg.inc
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
X-List-Received-Date: Tue, 29 Aug 2017 12:43:47 -0000
Content-Type: multipart/alternative; boundary="001a114385a6fb432d0557e3c23a"

--001a114385a6fb432d0557e3c23a
Content-Type: text/plain; charset="UTF-8"

I didn't get any objections, so this is now merged.


Bruce

On Thu, Aug 24, 2017 at 2:46 PM, <christopher.w.clark@gmail.com> wrote:

> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> This inc file has not been used within meta-virtualization since:
>     Date:   Tue Sep 10 21:02:41 2013 -0400
>     commit 214c4715f0ed53ba9c499932b0b6ee3f602ff89f
>
> and has needed updating since the changes in:
>     Date:   Wed Feb 24 01:23:58 2016 -0800
>     git://git.openembedded.org/openembedded-core
>     commit e38c94d6bf83ed3ca7f046d9503e81b927487bf2
>
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>
> This inc file either needs updating to change SYSLINUXCFG to SYSLINUX_CFG
> or alternatively it could be removed. Since it is no longer used within
> meta-virtualization, and I cannot find a reference to it elsewhere via
> web search engine, it requires further work to test any change to this
> file.
> This patch just removes it.
>
>
>  recipes-extended/images/xen-bootimg.inc | 35
> ---------------------------------
>  1 file changed, 35 deletions(-)
>  delete mode 100644 recipes-extended/images/xen-bootimg.inc
>
> diff --git a/recipes-extended/images/xen-bootimg.inc
> b/recipes-extended/images/xen-bootimg.inc
> deleted file mode 100644
> index 093aa68..0000000
> --- a/recipes-extended/images/xen-bootimg.inc
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -SYSLINUX_TIMEOUT = "10"
> -SYSLINUX_LABEL = "boot"
> -SYSLINUX_XEN_APPEND = "dom0_mem=1048576"
> -SYSLINUX_KERNEL_APPEND = "ramdisk_size=32768 root=/dev/ram0 rw
> console=tty0 console=ttyS0,115200n8"
> -#LABELS_append = " ${SYSLINUX_LABEL} "
> -
> -INITRD = "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.cpio.lzma"
> -
> -do_bootimg[depends] += "${IMAGE_BASENAME}:do_rootfs"
> -
> -inherit bootimg
> -
> -syslinux_populate_append() {
> -       install -m 0444 ${STAGING_LIBDIR}/syslinux/mboot.c32
> ${HDDDIR}${SYSLINUXDIR}/mboot.c32
> -}
> -
> -grubefi_populate_append() {
> -       install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz
> ${DEST}${EFIDIR}/xen.gz
> -}
> -
> -populate_append() {
> -       install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz
> ${DEST}/xen.gz
> -}
> -
> -build_syslinux_cfg() {
> -       echo ALLOWOPTIONS 1 > ${SYSLINUXCFG}
> -       echo SERIAL 0 115200 > ${SYSLINUXCFG}
> -       echo DEFAULT ${SYSLINUX_LABEL} >> ${SYSLINUXCFG}
> -       echo TIMEOUT ${SYSLINUX_TIMEOUT} >> ${SYSLINUXCFG}
> -       echo PROMPT 1 >> ${SYSLINUXCFG}
> -       echo LABEL ${SYSLINUX_LABEL} >> ${SYSLINUXCFG}
> -       echo KERNEL mboot.c32 >> ${SYSLINUXCFG}
> -       echo APPEND xen.gz ${SYSLINUX_XEN_APPEND} --- vmlinuz
> ${SYSLINUX_KERNEL_APPEND} --- initrd >> ${SYSLINUXCFG}
> -}
> -
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
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114385a6fb432d0557e3c23a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I didn&#39;t get any objections, so this is now merged.<di=
v><br></div><div><br></div><div>Bruce</div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Thu, Aug 24, 2017 at 2:46 PM,  <span dir=
=3D"ltr">&lt;<a href=3D"mailto:christopher.w.clark@gmail.com" target=3D"_bl=
ank">christopher.w.clark@gmail.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">From: Christopher Clark &lt;<a href=3D"mailto:christopher.w=
.clark@gmail.com">christopher.w.clark@gmail.com</a><wbr>&gt;<br>
<br>
This inc file has not been used within meta-virtualization since:<br>
=C2=A0 =C2=A0 Date:=C2=A0 =C2=A0Tue Sep 10 21:02:41 2013 -0400<br>
=C2=A0 =C2=A0 commit 214c4715f0ed53ba9c499932b0b6ee<wbr>3f602ff89f<br>
<br>
and has needed updating since the changes in:<br>
=C2=A0 =C2=A0 Date:=C2=A0 =C2=A0Wed Feb 24 01:23:58 2016 -0800<br>
=C2=A0 =C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-cor=
e" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/<wbr>openembed=
ded-core</a><br>
=C2=A0 =C2=A0 commit e38c94d6bf83ed3ca7f046d9503e81<wbr>b927487bf2<br>
<br>
Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@=
gmail.com">christopher.w.clark@gmail.com</a><wbr>&gt;<br>
---<br>
<br>
This inc file either needs updating to change SYSLINUXCFG to SYSLINUX_CFG<b=
r>
or alternatively it could be removed. Since it is no longer used within<br>
meta-virtualization, and I cannot find a reference to it elsewhere via<br>
web search engine, it requires further work to test any change to this file=
.<br>
This patch just removes it.<br>
<br>
<br>
=C2=A0recipes-extended/images/xen-<wbr>bootimg.inc | 35 -------------------=
-----------<wbr>---<br>
=C2=A01 file changed, 35 deletions(-)<br>
=C2=A0delete mode 100644 recipes-extended/images/xen-<wbr>bootimg.inc<br>
<br>
diff --git a/recipes-extended/images/xen-<wbr>bootimg.inc b/recipes-extende=
d/images/xen-<wbr>bootimg.inc<br>
deleted file mode 100644<br>
index 093aa68..0000000<br>
--- a/recipes-extended/images/xen-<wbr>bootimg.inc<br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
-SYSLINUX_TIMEOUT =3D &quot;10&quot;<br>
-SYSLINUX_LABEL =3D &quot;boot&quot;<br>
-SYSLINUX_XEN_APPEND =3D &quot;dom0_mem=3D1048576&quot;<br>
-SYSLINUX_KERNEL_APPEND =3D &quot;ramdisk_size=3D32768 root=3D/dev/ram0 rw =
console=3Dtty0 console=3DttyS0,115200n8&quot;<br>
-#LABELS_append =3D &quot; ${SYSLINUX_LABEL} &quot;<br>
-<br>
-INITRD =3D &quot;${DEPLOY_DIR_IMAGE}/${IMAGE_<wbr>BASENAME}-${MACHINE}.cpi=
o.<wbr>lzma&quot;<br>
-<br>
-do_bootimg[depends] +=3D &quot;${IMAGE_BASENAME}:do_rootfs&quot;<br>
-<br>
-inherit bootimg<br>
-<br>
-syslinux_populate_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0444 ${STAGING_LIBDIR}/syslinux/<wbr=
>mboot.c32 ${HDDDIR}${SYSLINUXDIR}/mboot.<wbr>c32<br>
-}<br>
-<br>
-grubefi_populate_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${<wbr>=
MACHINE}.gz ${DEST}${EFIDIR}/xen.gz<br>
-}<br>
-<br>
-populate_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${<wbr>=
MACHINE}.gz ${DEST}/xen.gz<br>
-}<br>
-<br>
-build_syslinux_cfg() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo ALLOWOPTIONS 1 &gt; ${SYSLINUXCFG}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo SERIAL 0 115200 &gt; ${SYSLINUXCFG}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo DEFAULT ${SYSLINUX_LABEL} &gt;&gt; ${SYSLI=
NUXCFG}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo TIMEOUT ${SYSLINUX_TIMEOUT} &gt;&gt; ${SYS=
LINUXCFG}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo PROMPT 1 &gt;&gt; ${SYSLINUXCFG}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo LABEL ${SYSLINUX_LABEL} &gt;&gt; ${SYSLINU=
XCFG}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo KERNEL mboot.c32 &gt;&gt; ${SYSLINUXCFG}<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo APPEND xen.gz ${SYSLINUX_XEN_APPEND} --- v=
mlinuz ${SYSLINUX_KERNEL_APPEND} --- initrd &gt;&gt; ${SYSLINUXCFG}<br>
-}<br>
-<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
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

--001a114385a6fb432d0557e3c23a--
