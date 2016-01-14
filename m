Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3A25E0073D; Thu, 14 Jan 2016 12:38:16 -0800 (PST)
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
	*      [209.85.213.45 listed in list.dnswl.org]
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0FD2E00444
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Jan 2016 12:38:10 -0800 (PST)
Received: by mail-vk0-f45.google.com with SMTP id n1so133028028vkb.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Jan 2016 12:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cA+Cs4WJc+OlPSePr9/igVzzvWNRZHsHfiHZNeezG0k=;
	b=tuRaj0hun6x56wObt1Q4/JQpJv52e0gr6Mr7ch/iGXTG3hP0JGeuAW0zNeVjbZDjxg
	9tHgcEJbGYglexmkoQXcl6PhdWzt8yRN2oA75x9kWoutg27NaiJ1YZUOgXb1iXhoSHgc
	A2NQ65ecHd/3Bw0/3Hte/O+B+6vU5RmN7jrvlnEnXuXea2c0rEcwhBN3/J/e9dMHOnWd
	kV8o3laHkJBC5PSvPc58jjgJqp3sBACtZ7owoBJJWq0A5XwAyGTQmDzrVi+xWq2pL9J4
	3rN6YRunmGZgoi/S1tsxobSOoPmpomX2m9QEX/S1j9IOAOnyzh4rxkAvaJv2P6UNti8O
	selg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=cA+Cs4WJc+OlPSePr9/igVzzvWNRZHsHfiHZNeezG0k=;
	b=RL5vkXGpSbhhVD3lbWwKbKw8uVkdymksXNEcGPMbsmsaQXMXiFdOhaG6KIr3BEuiqq
	CB18uYEkDIqKKfURyXgbZlbQYxkuga/Ou+Y4bP5VJwN1AYbdcB7lGAmFF56d5R72Y2UJ
	zXhTCY0FWng4zjN6j7r9bBHqBvFpRMiXLLMNpEYz2lZ1/Y0Pt00Xec5Lxvmn/q9sYf1Y
	1vFU96sYLkcTsictEphY4S6wQdcKmkYVcKmVV8+M3NmAHItyGIhF1wu3KCiKmViq6o3y
	GkeISM/TKrWb0ct1K1MPS8laiVhSYFD+83je1PWvWWwhP8Pp987BoU5MVivR/qlUsoGZ
	jclA==
X-Gm-Message-State: ALoCoQniF02/e/KLae8GWIWpRYjqf/LyY1EAu8oDP4RqUCT3SIvUk3YTAbizLNbZky4i8W49EcQjNMl0Bju5v3SBg6zJIb8QSQ==
MIME-Version: 1.0
X-Received: by 10.31.3.169 with SMTP id f41mr4371810vki.114.1452803890093;
	Thu, 14 Jan 2016 12:38:10 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Thu, 14 Jan 2016 12:38:10 -0800 (PST)
In-Reply-To: <1452541061-26516-1-git-send-email-cjp256@gmail.com>
References: <1452541061-26516-1-git-send-email-cjp256@gmail.com>
Date: Thu, 14 Jan 2016 15:38:10 -0500
Message-ID: <CADkTA4N0krq=GS90Lo94uF4u9c-7JH=vxERnNYEaMXNz15fWnA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen.cfg: enable CONFIG_HYPERVISOR_GUEST by default
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
X-List-Received-Date: Thu, 14 Jan 2016 20:38:16 -0000
Content-Type: multipart/alternative; boundary=001a1142894acc22640529514368

--001a1142894acc22640529514368
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Mon, Jan 11, 2016 at 2:37 PM, Chris Patterson <cjp256@gmail.com> wrote:

> Required dependency for CONFIG_XEN.
>
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-kernel/linux/linux-yocto/xen.cfg |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg
> b/recipes-kernel/linux/linux-yocto/xen.cfg
> index 096bea0..4780311 100644
> --- a/recipes-kernel/linux/linux-yocto/xen.cfg
> +++ b/recipes-kernel/linux/linux-yocto/xen.cfg
> @@ -1,3 +1,4 @@
> +CONFIG_HYPERVISOR_GUEST=y
>  CONFIG_PARAVIRT=y
>  CONFIG_XEN=y
>  CONFIG_XEN_DOM0=y
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

--001a1142894acc22640529514368
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Mon, Jan 11, 2016 at 2:37 PM, C=
hris Patterson <span dir=3D"ltr">&lt;<a href=3D"mailto:cjp256@gmail.com" ta=
rget=3D"_blank">cjp256@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Required dependency for CONFIG_XEN.<br>
<br>
Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com">cjp2=
56@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-kernel/linux/linux-yocto/xen.cfg |=C2=A0 =C2=A0 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg b/recipes-kernel/linu=
x/linux-yocto/xen.cfg<br>
index 096bea0..4780311 100644<br>
--- a/recipes-kernel/linux/linux-yocto/xen.cfg<br>
+++ b/recipes-kernel/linux/linux-yocto/xen.cfg<br>
@@ -1,3 +1,4 @@<br>
+CONFIG_HYPERVISOR_GUEST=3Dy<br>
=C2=A0CONFIG_PARAVIRT=3Dy<br>
=C2=A0CONFIG_XEN=3Dy<br>
=C2=A0CONFIG_XEN_DOM0=3Dy<br>
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

--001a1142894acc22640529514368--
