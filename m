Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B745AE00AAB; Tue, 19 Jan 2016 05:49:56 -0800 (PST)
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
	*      [209.85.213.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0FF9E008F5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Jan 2016 05:49:51 -0800 (PST)
Received: by mail-vk0-f43.google.com with SMTP id e185so9017057vkb.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Jan 2016 05:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=z7td2pyK4+8KGTM2yssOKb+hawNF9sW/1D2CMblSW4M=;
	b=EsFNyR0TAKelMenwubigRT3c9kb7j4lJKE9tIcLZ3KJ/yvjnoIrjSE5YS0zuzRGb6E
	xdYwxpX8Ss2mRfHi9rvN0loITePH8Qv1+jg+Vj/3UBXz0rAsNfeSKlk+iwEUwiHFxSwi
	/a4mkvA3GhT4oimPcOq4E+8eUlORRFNAUPEXjnU06+kurXIx9EOocysBxmrlFJ6GkaBv
	PIsVRyYN9o4viVTfwNbuQ2Ap9rMWqeixmzJHl0SNnLZxKWWU6UtJQaSSN9UvlPdZLkBh
	1xAp0i46mXhGLSkOEi9YevKoh0MaWT/5X/aHIq3XblaRCesvo2XDWoY53X8240a3FGgp
	qTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=z7td2pyK4+8KGTM2yssOKb+hawNF9sW/1D2CMblSW4M=;
	b=M2AUBePz62zYpOsifi32rGvjhuFILPVz/JNBER/QqfQwJaUfcW0Tvo7a1JXKNvhFbs
	DxSYQTAQf0XqT3vZ2b14XV4sNLDuDXJCWUcs/eWovr/MzwK9kh+ibsx7KoVjWMN5j+o7
	oQTczkgBRgo99HSOLB1n36tWBz2nuRXXixOuOOXeAX1uDYi+cc7cPP4t49EX9+tcJbh8
	bP8tLoIN83jA+Wt/orGZ27T9UV+MKWyX7baWa/DxRPEcL4azxjOwrU+VRp8L3BP5MLiA
	ODcpPtZkwaWbS2zUAVRBD9DdKkJKB7tb6mRsoFeQdy9jmnbtydS6isQ+/1AXSTDOPbe7
	ZhTA==
X-Gm-Message-State: ALoCoQkIOQsyeuk+eo7Cw53iyXyQNamzdjjcS+yuaCkN5FGZ03pv7lXzX/64lqOaPlkCK0lxd6wSNQ9X1O8nHq+xULjMYPU/9Q==
MIME-Version: 1.0
X-Received: by 10.31.150.215 with SMTP id y206mr20056983vkd.63.1453211391060; 
	Tue, 19 Jan 2016 05:49:51 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Tue, 19 Jan 2016 05:49:50 -0800 (PST)
In-Reply-To: <1453210524-20663-1-git-send-email-cjp256@gmail.com>
References: <1453210524-20663-1-git-send-email-cjp256@gmail.com>
Date: Tue, 19 Jan 2016 08:49:50 -0500
Message-ID: <CADkTA4OcWdBAUz5mZN0Opx2UFDWPyA0my9m-ca5ttpqn3x-eGA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen: add xen-devd to packages list.
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
X-List-Received-Date: Tue, 19 Jan 2016 13:49:56 -0000
Content-Type: multipart/alternative; boundary=001a1140fdd8bf72760529b02439

--001a1140fdd8bf72760529b02439
Content-Type: text/plain; charset=UTF-8

merged to master.

Bruce

On Tue, Jan 19, 2016 at 8:35 AM, Chris Patterson <cjp256@gmail.com> wrote:

> Package was configured, but never added to PACKAGES.
>
> Reported-by: Machon Gregory <mbgrego@tycho.nsa.gov>
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-extended/xen/xen.inc |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index ac9796b..c63cb2c 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -149,6 +149,7 @@ PACKAGES = "\
>      ${PN}-console \
>      ${PN}-dbg \
>      ${PN}-dev \
> +    ${PN}-devd \
>      ${PN}-doc \
>      ${PN}-flask \
>      ${PN}-fsimage \
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

--001a1140fdd8bf72760529b02439
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged to master.<br><br></div>Bruce<br><div><div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jan 19, 2016=
 at 8:35 AM, Chris Patterson <span dir=3D"ltr">&lt;<a href=3D"mailto:cjp256=
@gmail.com" target=3D"_blank">cjp256@gmail.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Package was configured, but never added to PACK=
AGES.<br>
<br>
Reported-by: Machon Gregory &lt;<a href=3D"mailto:mbgrego@tycho.nsa.gov">mb=
grego@tycho.nsa.gov</a>&gt;<br>
Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com">cjp2=
56@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc |=C2=A0 =C2=A0 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index ac9796b..c63cb2c 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -149,6 +149,7 @@ PACKAGES =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${PN}-console \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-dbg \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-dev \<br>
+=C2=A0 =C2=A0 ${PN}-devd \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-doc \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-flask \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-fsimage \<br>
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
</div></div></div></div>

--001a1140fdd8bf72760529b02439--
