Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4B622E00C10; Wed, 17 Feb 2016 20:26:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.50 listed in list.dnswl.org]
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 881C0E00C02
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Feb 2016 20:26:47 -0800 (PST)
Received: by mail-vk0-f50.google.com with SMTP id k196so34385194vka.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Feb 2016 20:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gBstjd+AdD6iN0Xg69BTMMIR7vA3w7NvIghUHXhhTS0=;
	b=TdR+DKxeJ2u8JEtdWHTHPTMSQtgyUCY4KOL2T7k2iencc0a5QxyAhTJtt7ujibV2bj
	rfYF7B1ZQlY6u/AaWhWXRaTeE+anI8AoIDA6LESxYPCyXqmLIn6cjsBKS5GLCRrblsoe
	ILXUL/L5Pr05kFDSWqnHkMYrNq5Ho/eKx7X///WSFbImdBBN8vPbywAtJ/ewuQnTQW5s
	E9PrSOdz0lFDBBb3ZukTZNZjIum19oxTysA4fmli5TiGdGJDjX481uimOBxUkQDf1GpO
	fTHnXqjI2pmOP2Ly3UItsmox3+1lU++WSuL12PUAdmOGoqjjfEtyuEvsXIR9komuBGJC
	SN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=gBstjd+AdD6iN0Xg69BTMMIR7vA3w7NvIghUHXhhTS0=;
	b=c0pHaHrlu1aS5fKDU4ijqxa1/QDTCwgBHDD9GZqAyRZweVpyp/zyZXBKCaPRUdGUdU
	EWPOjlHlkP0bXxJ56AKALEXZzTSWZ68I/Vj88mQ+kGnMLocmzM726bMR1N7RgCsjYe95
	rBSNWHqeLr8C0Esu7bO7JEJLNcTjBd7LyTtvRfqsOk0tETgVOBTKyjxigkvswB5lCJ48
	LB68wuij35omQe5303AG6TVyj1Q+Rb9rhINcfAYBF5QGYHdJ/1pF/09l2vZ9ztFqs7j5
	2LzDoxpFGmZeviGE62Ckqdx1f4fY7BjLM//KLCDu6R+jkkCvUTYhjh48RTsqHlZGrEKz
	VzFQ==
X-Gm-Message-State: AG10YOSj2hAo8cmTXShTaSrg0x6i6fPxuxRCRGv8EJnhF6TY97TRh+HEgEh59eqVVWvPUzP9kKKo9mSspRfVSA==
MIME-Version: 1.0
X-Received: by 10.31.192.147 with SMTP id q141mr4524910vkf.96.1455769607229;
	Wed, 17 Feb 2016 20:26:47 -0800 (PST)
Received: by 10.176.0.50 with HTTP; Wed, 17 Feb 2016 20:26:47 -0800 (PST)
In-Reply-To: <1455291269-32533-1-git-send-email-cjp256@gmail.com>
References: <1455291269-32533-1-git-send-email-cjp256@gmail.com>
Date: Wed, 17 Feb 2016 23:26:47 -0500
Message-ID: <CADkTA4MW9xP254y=tBQU33pztWGJwqqQUb+BwEApFb3UvUg8Ag@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen.inc: fix ordering of stubs task
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
X-List-Received-Date: Thu, 18 Feb 2016 04:26:50 -0000
Content-Type: multipart/alternative; boundary=001a11439d4050569f052c03c62e

--001a11439d4050569f052c03c62e
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Fri, Feb 12, 2016 at 10:34 AM, Chris Patterson <cjp256@gmail.com> wrote:

> Placing the stubs function between patch and configure steps
> breaks because it has dependencies which are not guranteed
> until the configure step.
>
> Build error:
> "fatal error: gnu/stubs-32.h: No such file or directory"
>
> This patch simply moves the step between configure and compile
> to resolve the dependency issue.
>
> Reported-by: Machon Gregory <mbgrego@tycho.nsa.gov>
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-extended/xen/xen.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 5555ed3..d35bc3f 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -782,7 +782,7 @@ do_stubs() {
>      fi
>  }
>
> -addtask stubs after do_patch before do_configure
> +addtask stubs after do_configure before do_compile
>
>  do_configure() {
>
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

--001a11439d4050569f052c03c62e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Fri, Feb 12, 2016 at 10:34 A=
M, Chris Patterson <span dir=3D"ltr">&lt;<a href=3D"mailto:cjp256@gmail.com=
" target=3D"_blank">cjp256@gmail.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">Placing the stubs function between patch and configure st=
eps<br>
breaks because it has dependencies which are not guranteed<br>
until the configure step.<br>
<br>
Build error:<br>
&quot;fatal error: gnu/stubs-32.h: No such file or directory&quot;<br>
<br>
This patch simply moves the step between configure and compile<br>
to resolve the dependency issue.<br>
<br>
Reported-by: Machon Gregory &lt;<a href=3D"mailto:mbgrego@tycho.nsa.gov">mb=
grego@tycho.nsa.gov</a>&gt;<br>
Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com">cjp2=
56@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc |=C2=A0 =C2=A0 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index 5555ed3..d35bc3f 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -782,7 +782,7 @@ do_stubs() {<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
-addtask stubs after do_patch before do_configure<br>
+addtask stubs after do_configure before do_compile<br>
<br>
=C2=A0do_configure() {<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
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
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div>

--001a11439d4050569f052c03c62e--
