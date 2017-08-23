Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66E0CE00D59; Tue, 22 Aug 2017 19:47:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.217.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.217.195 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE266E00BB1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 19:47:19 -0700 (PDT)
Received: by mail-ua0-f195.google.com with SMTP id d12so213282uag.5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 19:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1ibHoroQ+ahYUNsHnPL0LAz1iRx2ny9CAFlN1p4p/Jw=;
	b=pvHrm8Ko5lr0X6sPlAsvyF/7J+In+6RC3ERN9adLzosVoIbhQwRbKp65YWXkhLoRdf
	Z5tS5AyUUFaH+UPD8aGbPEAe8maUJ2W5g22zs7HLzPB46BjKpkLd+ee9prx19Jx8dwB4
	zaUFrddFmKo4FNQum/i+8q8uUARgFlu1fu0uSaH8jsEL2xy+uOf7JyFDG0kr7K1pxhAH
	wxJhlsCUJpbHg/GOpWE+AWO9pJiGB3Vljllf5dI8AxmK4M5xF006p2LfGPO8jLLHBXGx
	qpWl/7dvczkYAxQYcrtpNGmp5c7U1jq7J53zvY+HSv3GCRBJblT9gVP1mIiTBmmYF8pP
	WHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1ibHoroQ+ahYUNsHnPL0LAz1iRx2ny9CAFlN1p4p/Jw=;
	b=gsIChicjfKZEBdVDzzWm98x52VCQP+EOVATqgpt7ChjwNVIz7EuGy2/1dbE9YvQLOc
	T0ceMf9hQ6AzK79KFo/huG04L7oDQAltqQcs6xyoNxdq2LlDeejQrOBawoJxAAvehNBr
	xDaWlAFq0BbdgMLPMlQE/38NKbpFOIt12vomfIJgs6OJBYsL7gWD2H8qIo98TZMt4P50
	AztebTWg2pr8op7Ke6sPvamBwsl60eVshtMG+BaPTISpfWAo06d91o7BuEAgvl+HIbE/
	IcEexYlbXYL6jO0HA9u77P86mkMegV6efK3CMD6FihiXjFsFTnbd0Boc9VQlvo9ODz9c
	u4bw==
X-Gm-Message-State: AHYfb5gwN6Eq3saFCWv4XXz1knhaby6a324/UQOGsPf3DbaAiY2V9BlL
	fThhN0DVbCptuzdB3R8gcNbn/5TiIw==
X-Received: by 10.159.59.30 with SMTP id i30mr970973uah.147.1503456439075;
	Tue, 22 Aug 2017 19:47:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Tue, 22 Aug 2017 19:47:18 -0700 (PDT)
In-Reply-To: <1503378503-23353-5-git-send-email-christopher.w.clark@gmail.com>
References: <1503378503-23353-1-git-send-email-christopher.w.clark@gmail.com>
	<1503378503-23353-5-git-send-email-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 22 Aug 2017 22:47:18 -0400
Message-ID: <CADkTA4PS==zpgYYFdsnubPY_8N0bx=SOfHEwU60qZ948x1dXMg@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH 4/4] xen-image-minimal : change SYSLINUXCFG to SYSLINUX_CFG
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
X-List-Received-Date: Wed, 23 Aug 2017 02:47:20 -0000
Content-Type: multipart/alternative; boundary="f403043c41c8fc88c6055762ba0a"

--f403043c41c8fc88c6055762ba0a
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 22, 2017 at 1:08 AM, <christopher.w.clark@gmail.com> wrote:

> From: Christopher Clark <christopher.clark6@baesystems.com>
>
> Fixes the build for xen-image-minimal.
>

What change triggered the need to update the variable ? It would be nice to
log that in the commit message.

I did a quick grep and didn't find the root cause.

Bruce


>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  recipes-extended/images/xen-image-minimal.bb | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/recipes-extended/images/xen-image-minimal.bb
> b/recipes-extended/images/xen-image-minimal.bb
> index b8c2002..94240f6 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -50,12 +50,12 @@ SYSLINUX_XEN_ARGS ?= "loglvl=all guest_loglvl=all
> console=com1,vga com1=115200,8
>  SYSLINUX_KERNEL_ARGS ?= "ramdisk_size=32768 root=/dev/ram0 rw
> console=hvc0 earlyprintk=xen console=tty0 panic=10 LABEL=boot debugshell=5"
>
>  build_syslinux_cfg () {
> -       echo "ALLOWOPTIONS 1" > ${SYSLINUXCFG}
> -       echo "DEFAULT boot" >> ${SYSLINUXCFG}
> -       echo "TIMEOUT 10" >> ${SYSLINUXCFG}
> -       echo "PROMPT 1" >> ${SYSLINUXCFG}
> -       echo "LABEL boot" >> ${SYSLINUXCFG}
> -       echo "  KERNEL mboot.c32" >> ${SYSLINUXCFG}
> -       echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} --- /vmlinuz
> ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUXCFG}
> +       echo "ALLOWOPTIONS 1" > ${SYSLINUX_CFG}
> +       echo "DEFAULT boot" >> ${SYSLINUX_CFG}
> +       echo "TIMEOUT 10" >> ${SYSLINUX_CFG}
> +       echo "PROMPT 1" >> ${SYSLINUX_CFG}
> +       echo "LABEL boot" >> ${SYSLINUX_CFG}
> +       echo "  KERNEL mboot.c32" >> ${SYSLINUX_CFG}
> +       echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} --- /vmlinuz
> ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUX_CFG}
>  }
>
> --
> 2.1.4
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

--f403043c41c8fc88c6055762ba0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Aug 22, 2017 at 1:08 AM,  <span dir=3D"ltr">&lt;<a href=3D"mail=
to:christopher.w.clark@gmail.com" target=3D"_blank">christopher.w.clark@gma=
il.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Christ=
opher Clark &lt;<a href=3D"mailto:christopher.clark6@baesystems.com">christ=
opher.clark6@<wbr>baesystems.com</a>&gt;<br>
<br>
Fixes the build for xen-image-minimal.<br></blockquote><div><br></div><div>=
What change triggered the need to update the variable ? It would be nice to=
</div><div>log that in the commit message.</div><div><br></div><div>I did a=
 quick grep and didn&#39;t find the root cause.</div><div><br></div><div>Br=
uce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.clark6@b=
aesystems.com">christopher.clark6@<wbr>baesystems.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-<wbr>image-minimal.bb</a> | 14 ++++++=
+-------<br>
=C2=A01 file changed, 7 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/recipes-extended/images/<a href=3D"http://xen-image-minimal.bb=
" rel=3D"noreferrer" target=3D"_blank">xen-<wbr>image-minimal.bb</a> b/reci=
pes-extended/images/<a href=3D"http://xen-image-minimal.bb" rel=3D"noreferr=
er" target=3D"_blank">xen-<wbr>image-minimal.bb</a><br>
index b8c2002..94240f6 100644<br>
--- a/recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-<wbr>image-minimal.bb</a><br>
+++ b/recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-<wbr>image-minimal.bb</a><br>
@@ -50,12 +50,12 @@ SYSLINUX_XEN_ARGS ?=3D &quot;loglvl=3Dall guest_loglvl=
=3Dall console=3Dcom1,vga com1=3D115200,8<br>
=C2=A0SYSLINUX_KERNEL_ARGS ?=3D &quot;ramdisk_size=3D32768 root=3D/dev/ram0=
 rw console=3Dhvc0 earlyprintk=3Dxen console=3Dtty0 panic=3D10 LABEL=3Dboot=
 debugshell=3D5&quot;<br>
<br>
=C2=A0build_syslinux_cfg () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;ALLOWOPTIONS 1&quot; &gt; ${SYSLINUX=
CFG}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;DEFAULT boot&quot; &gt;&gt; ${SYSLIN=
UXCFG}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;TIMEOUT 10&quot; &gt;&gt; ${SYSLINUX=
CFG}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;PROMPT 1&quot; &gt;&gt; ${SYSLINUXCF=
G}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;LABEL boot&quot; &gt;&gt; ${SYSLINUX=
CFG}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=C2=A0 KERNEL mboot.c32&quot; &gt;&g=
t; ${SYSLINUXCFG}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=C2=A0 APPEND /xen.gz ${SYSLINUX_XEN=
_ARGS} --- /vmlinuz ${SYSLINUX_KERNEL_ARGS} --- /initrd&quot; &gt;&gt; ${SY=
SLINUXCFG}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;ALLOWOPTIONS 1&quot; &gt; ${SYSLINUX=
_CFG}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;DEFAULT boot&quot; &gt;&gt; ${SYSLIN=
UX_CFG}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;TIMEOUT 10&quot; &gt;&gt; ${SYSLINUX=
_CFG}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;PROMPT 1&quot; &gt;&gt; ${SYSLINUX_C=
FG}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;LABEL boot&quot; &gt;&gt; ${SYSLINUX=
_CFG}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=C2=A0 KERNEL mboot.c32&quot; &gt;&g=
t; ${SYSLINUX_CFG}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=C2=A0 APPEND /xen.gz ${SYSLINUX_XEN=
_ARGS} --- /vmlinuz ${SYSLINUX_KERNEL_ARGS} --- /initrd&quot; &gt;&gt; ${SY=
SLINUX_CFG}<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.1.4<br>
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
</div></div>

--f403043c41c8fc88c6055762ba0a--
