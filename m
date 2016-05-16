Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0ACF0E006B3; Mon, 16 May 2016 08:37:37 -0700 (PDT)
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
	*      [209.85.218.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2BC0FE004F1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 May 2016 08:37:34 -0700 (PDT)
Received: by mail-oi0-f65.google.com with SMTP id t140so17312734oie.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 May 2016 08:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=5wpUACwu2xElH7kRm4R11LuR29eLH24aLyK4op+UkNQ=;
	b=YLJjUxOYA2cYd8wfql88ss2ALjAwo1yp7R2pryfKEgnxrG16kMcceLxlBbKFr0HW08
	OYSg/fvlEDJmbNWpYFhhtnIzGDRsg2bFkHzifPoNO2Mq/D+T62SbrWwvY/G61NAN/lBI
	JkQJmjfYnQw3OxjEP4QQC6N6e6XAXlhk950rE8jNpEZ8wvKo98DW4MV6eXeIw9/TgvFT
	0Lrx/eh3iBqRhr1s6JuZFpCcUt37qA9OeYUgwMO7l34BHpfEiMeX+uyH3uG8CU80KIIC
	hRgjzWY3yxP3gfvSrSd0gv9AqTqPpegwloMNQStUM4rWdKdy6scwbLl3AN/u6Jj/FlOU
	u6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=5wpUACwu2xElH7kRm4R11LuR29eLH24aLyK4op+UkNQ=;
	b=aTZ5Wn7vb3uVFGp5DM3jSGNp6hKdxi3BJzjJqf90S9iBoWkpsrGBvSpzm4z47lZgpa
	Qh5Plc0AI/oL62sYR2hi8siPFJh1CuocoDod65opok+/AIf5HnUp4Q1YacsGdHPnU4Sg
	kOh4fpMj3WQkxVBCECSMepfHsp+Kxo9GxZ5yUa8b/Pesx/XO2nxRif4fpnQXfeZTqC1t
	Ko5KBrvkz5zp0+kV4LiK96dvC2Jp/zU6sXMYQGd91xuA78vKwOxakB/a9iFXpEYsq+Gs
	yrrYPUNxbYxY1Ia234xasnSO8ce5/tAVomy3mGQtOR6/rGF5RL2/qA/HZqj6kN2LJ9Ys
	rToA==
X-Gm-Message-State: AOPr4FW03FOGabFr0Xgo80r+KG7tjkMf2SdDOUTvZxlej6pDuhXvIQDryHxRKVEKVniqSLQwre6slrlC1NSHog==
MIME-Version: 1.0
X-Received: by 10.157.2.69 with SMTP id 63mr16586938otb.159.1463413053225;
	Mon, 16 May 2016 08:37:33 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Mon, 16 May 2016 08:37:33 -0700 (PDT)
In-Reply-To: <1451775962-55892-1-git-send-email-daicy.fnst@cn.fujitsu.com>
References: <1451775962-55892-1-git-send-email-daicy.fnst@cn.fujitsu.com>
Date: Mon, 16 May 2016 11:37:33 -0400
Message-ID: <CADkTA4MKfnBpkydh1c=Xw8KqHHB7bgkOUPP7dVYCaxntfkCJuw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: Fix rootfs creation errors
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
X-List-Received-Date: Mon, 16 May 2016 15:37:37 -0000
Content-Type: multipart/alternative; boundary=94eb2c114d243280de0532f767f2

--94eb2c114d243280de0532f767f2
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Sat, Jan 2, 2016 at 6:06 PM, Dai Caiyun <daicy.fnst@cn.fujitsu.com>
wrote:

> error: file /var/run from install of openvswitch-2.1.3-r0.x86_64
>     conflicts with file from package base-files-3.0.14-r89.ubinux_x86_64
>
> Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb
> b/recipes-networking/openvswitch/openvswitch_git.bb
> index b46d5af..1c6252a 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -50,4 +50,5 @@ do_install_ptest() {
>
>  do_install_append() {
>         oe_runmake modules_install INSTALL_MOD_PATH=${D}
> +       rm -r ${D}/${localstatedir}/run
>  }
> --
> 1.8.4.2
>
>
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

--94eb2c114d243280de0532f767f2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Sat, Jan 2, 2016 at 6:06 PM,=
 Dai Caiyun <span dir=3D"ltr">&lt;<a href=3D"mailto:daicy.fnst@cn.fujitsu.c=
om" target=3D"_blank">daicy.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">error: file /var/run from install of openvswit=
ch-2.1.3-r0.x86_64<br>
=C2=A0 =C2=A0 conflicts with file from package base-files-3.0.14-r89.ubinux=
_x86_64<br>
<br>
Signed-off-by: Dai Caiyun &lt;<a href=3D"mailto:daicy.fnst@cn.fujitsu.com">=
daicy.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0recipes-networking/openvswitch/<a href=3D"http://openvswitch_git.bb" =
rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/recipes-networking/openvswitch/<a href=3D"http://openvswitch_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> b/recipe=
s-networking/openvswitch/<a href=3D"http://openvswitch_git.bb" rel=3D"noref=
errer" target=3D"_blank">openvswitch_git.bb</a><br>
index b46d5af..1c6252a 100644<br>
--- a/recipes-networking/openvswitch/<a href=3D"http://openvswitch_git.bb" =
rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
+++ b/recipes-networking/openvswitch/<a href=3D"http://openvswitch_git.bb" =
rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
@@ -50,4 +50,5 @@ do_install_ptest() {<br>
<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake modules_install INSTALL_MOD_PATH=3D$=
{D}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -r ${D}/${localstatedir}/run<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.4.2<br>
<br>
<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div>

--94eb2c114d243280de0532f767f2--
