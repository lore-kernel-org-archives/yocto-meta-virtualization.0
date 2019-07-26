Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4A15E00C22; Thu, 25 Jul 2019 19:40:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.128.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2979DE00B33
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 19:40:38 -0700 (PDT)
Received: by mail-wm1-f67.google.com with SMTP id w9so36974457wmd.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 19:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=37BL9WdULI5qwJSMLiSqgTccyioOt8FAVW7zj4te6BI=;
	b=r36KFrTd/+ByZid32Ep2a+th5YZfX8ky2sLJ7ybu7lWeUNqap/AfHAWeJ6uHcF5LEA
	3zwWRGjq2o0BkxKrGI9Z9WpHiilGOO4lqJIIE60dxyZoKmqTCZASIH4joZBWhoy0K6Gv
	knQUMFw0RiPLtjUW+UiUe88q2VBLpnI9z1z7ivExwJyz1Vf1oxw7uwP/UShXVnCJoyOY
	f6lzyiFBwj/W0uOFyXiQiQTDCkNBTEG4SYd873NrGetBnuxXM++d2AimjuZdxlFW8MPL
	ApLhte+schCltmH75gpD34u2kzgB9xusy5W3/5nB743LhhYEKjJ3SxG16vSMorn0woVt
	BjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=37BL9WdULI5qwJSMLiSqgTccyioOt8FAVW7zj4te6BI=;
	b=UOjBWjQSZkFqeV/shCLEJEhvejCVj1Pk9Glko7iTsZYTK+vOFrnW94REpvNQ2aI6zL
	3J5PMvssjvg5cQUO8L0+OVwiarrEZoR/d35/nM4/W4cde5F8kg3wqi3yUiBB++AMuhba
	J0gTqOkpWPayxeKkAAa0rXcWoKX3wOnyBkTzgyHuD9Izk80ypm8g7hzpQ6SPhWLS3SAb
	blPiO+n9CDaonDppLnzAkbjx4aBSBOkhBnq3FHwpcSL8lEsXEUKo8cwO6yY+PxureJ2W
	MNLUTvjVwJU9oFH9fmF/tPU0+rm8iu2k2tuFaT7OV9Tj6eDK3C0fBVQt5Udt2ydwSbkx
	EkVg==
X-Gm-Message-State: APjAAAXwB+SLZLYZCFLyGAKsZEGaGR+TBVnBWUQabME/Bd6eZB4arDxm
	M7Mb174GVex2qwpZ1t/s7Ju5e++BE0oVR+TruMS139UA
X-Google-Smtp-Source: APXvYqya5ZKMjSFjGe51gurjxf9twV9b4hcoN4Q8lRMY9jwbfhm3O+ohsD+B/53J+zpSvFwUedejskeif8k9ejyL878=
X-Received: by 2002:a1c:b457:: with SMTP id d84mr86674901wmf.153.1564108837118;
	Thu, 25 Jul 2019 19:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <1564046870-85566-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1564046870-85566-1-git-send-email-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Jul 2019 22:40:26 -0400
Message-ID: <CADkTA4PLFg4zd1OSXtjk2Y_+tjq4p8qkpe4zqiz2RaJwbbjjFg@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] libbsd: remove bbappend
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
X-List-Received-Date: Fri, 26 Jul 2019 02:40:38 -0000
Content-Type: multipart/alternative; boundary="000000000000a0696c058e8c771f"

--000000000000a0696c058e8c771f
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Jul 25, 2019 at 5:27 AM <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> The bbappend only has below logic:
> inherit autotools-brokensep
>
> Actually libbsd can build successfully with a
> separate build directory which also means B != S,
> so no need to switch to inherit autotools-brokensep
> from the default autotools class.
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta-openstack/recipes-support/libbsd/libbsd_0.9.%.bbappend | 1 -
>  1 file changed, 1 deletion(-)
>  delete mode 100644
> meta-openstack/recipes-support/libbsd/libbsd_0.9.%.bbappend
>
> diff --git a/meta-openstack/recipes-support/libbsd/libbsd_0.9.%.bbappend
> b/meta-openstack/recipes-support/libbsd/libbsd_0.9.%.bbappend
> deleted file mode 100644
> index 7447c56..0000000
> --- a/meta-openstack/recipes-support/libbsd/libbsd_0.9.%.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -inherit autotools-brokensep
> --
> 2.7.4
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a0696c058e8c771f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Ju=
l 25, 2019 at 5:27 AM &lt;<a href=3D"mailto:mingli.yu@windriver.com">mingli=
.yu@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">From: Mingli Yu &lt;<a href=3D"mailto:Mingli.Yu@windriver.=
com" target=3D"_blank">Mingli.Yu@windriver.com</a>&gt;<br>
<br>
The bbappend only has below logic:<br>
inherit autotools-brokensep<br>
<br>
Actually libbsd can build successfully with a<br>
separate build directory which also means B !=3D S,<br>
so no need to switch to inherit autotools-brokensep<br>
from the default autotools class.<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:Mingli.Yu@windriver.com" tar=
get=3D"_blank">Mingli.Yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-support/libbsd/libbsd_0.9.%.bbappend | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
=C2=A0delete mode 100644 meta-openstack/recipes-support/libbsd/libbsd_0.9.%=
.bbappend<br>
<br>
diff --git a/meta-openstack/recipes-support/libbsd/libbsd_0.9.%.bbappend b/=
meta-openstack/recipes-support/libbsd/libbsd_0.9.%.bbappend<br>
deleted file mode 100644<br>
index 7447c56..0000000<br>
--- a/meta-openstack/recipes-support/libbsd/libbsd_0.9.%.bbappend<br>
+++ /dev/null<br>
@@ -1 +0,0 @@<br>
-inherit autotools-brokensep<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--000000000000a0696c058e8c771f--
