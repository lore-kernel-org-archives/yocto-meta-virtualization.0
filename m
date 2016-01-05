Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4130E00CBF; Tue,  5 Jan 2016 08:48:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.213.51 listed in list.dnswl.org]
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
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2FCF4E00CAE
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Jan 2016 08:48:46 -0800 (PST)
Received: by mail-vk0-f51.google.com with SMTP id k1so142354801vkb.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Jan 2016 08:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=v2/Oeq8EuLh9BFjrzb+AxDKusU9ECLou48+7WtA7CPA=;
	b=nQippBKvMNocx7ZsfEftkWAEXHfdSYUx+AgwPwMR3dS/MwTMJ6vHDjWEAJi71jbG9l
	xMNr0EDAYztqwzwhMgEhQMvhxtesXh8fv7AFGGhtD55ysaO5RM+TJB5PvRoA3OujTqKz
	bHdCGpsVkQFXHBODz+FXWs8o+MeEuajoiWMB2i6rL/UCo0BwsbTdec7TCmqszYIuYY9C
	hTWk/63WF/EZLeT/EWCpzIiSvs/KIV/+/LJ9Uk+RvsJK4VrmWfm2bM1A9k1QAduOI5EW
	vqjxKZk0x/xige0xOuj37kyp3DfP+KBCkWQasGOuMK+2HedGqyOcnlTpQ3gwQYviaxcB
	gmOw==
MIME-Version: 1.0
X-Received: by 10.31.148.144 with SMTP id w138mr60679083vkd.44.1452012525629; 
	Tue, 05 Jan 2016 08:48:45 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Tue, 5 Jan 2016 08:48:45 -0800 (PST)
In-Reply-To: <1451663657-25079-1-git-send-email-cjp256@gmail.com>
References: <1451663657-25079-1-git-send-email-cjp256@gmail.com>
Date: Tue, 5 Jan 2016 11:48:45 -0500
Message-ID: <CADkTA4Oz8b0UW1gHU7OtMDk7H4tr8LfGLMmAmOKbP2hP1P09Dw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen: add libnl to DEPENDS
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
X-List-Received-Date: Tue, 05 Jan 2016 16:48:49 -0000
Content-Type: multipart/alternative; boundary=001a11408c44ccc0290528990286

--001a11408c44ccc0290528990286
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Fri, Jan 1, 2016 at 10:54 AM, Chris Patterson <cjp256@gmail.com> wrote:

> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-extended/xen/xen.inc |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 6bc85fe..d3a8b10 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -35,6 +35,7 @@ DEPENDS = " \
>      gettext \
>      glib-2.0 \
>      iproute2 \
> +    libnl \
>      ncurses \
>      openssl \
>      pciutils \
> --
> 1.7.10.4
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

--001a11408c44ccc0290528990286
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Fri, Jan 1, 2016 at 10:54 AM, C=
hris Patterson <span dir=3D"ltr">&lt;<a href=3D"mailto:cjp256@gmail.com" ta=
rget=3D"_blank">cjp256@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:cjp256@g=
mail.com">cjp256@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc |=C2=A0 =C2=A0 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index 6bc85fe..d3a8b10 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -35,6 +35,7 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0gettext \<br>
=C2=A0 =C2=A0 =C2=A0glib-2.0 \<br>
=C2=A0 =C2=A0 =C2=A0iproute2 \<br>
+=C2=A0 =C2=A0 libnl \<br>
=C2=A0 =C2=A0 =C2=A0ncurses \<br>
=C2=A0 =C2=A0 =C2=A0openssl \<br>
=C2=A0 =C2=A0 =C2=A0pciutils \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for cha=
os and madness await thee at its end&quot;</div>
</div>

--001a11408c44ccc0290528990286--
