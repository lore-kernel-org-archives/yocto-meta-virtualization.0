Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE7C4E00B81; Mon,  6 May 2019 12:48:31 -0700 (PDT)
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
	*      [209.85.208.176 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3852AE0096F
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 May 2019 12:48:31 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id d15so12173377ljc.7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 May 2019 12:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9XergggQtVZreVwW0r3nALAV2Nr/V8tvVk79+oIBwVA=;
	b=HAxaR0naPxa/u9fibDW+CuGvTi+geLNN57aCav9gi0DHACOtH0RGmTmk7dsLFTH0jr
	5gYqV4wKMwQeBpJVDrktjOSjRhOkvxtIyDuLq4owYRab2NA03Y73me3WAmfOhsLXAHkz
	Xp3BcHtmTHXeP0I1PkcMcJpMndIzN9kIxtc/HwT0VBw9bjijHZ4wuTChgavEZnTWbiby
	/G0Si3WTKljhj656b9RT8+MyUUwCHLIBQ7UQWGLh8KSHF5i+HoJAOZZbqOzvftK1igb/
	Zu5CZlPSQ0kd1mLADkgN8CIWTaxp3pFYFmnxr2vs8KnMV1sJExpvFVeniC2JWEGMnFgA
	aKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9XergggQtVZreVwW0r3nALAV2Nr/V8tvVk79+oIBwVA=;
	b=tP5SUNj/P3XEm3BKCYCT4Lq9XyejdW/nd8OXiMxF5eLokP8APxM2V07nDBLRoX+0yc
	xscZbKPtzVa2b/vHz09gnm48PqOu4SymP8jOZNU+2Y7zfI9nbEggkGhP0jzdBJHHStGg
	tROMtIl5P5pkUwsUQlWw3z05rcZdWCPcYo4hACHOgWdJMPueKADz9p7zK9iGDCbKbOKu
	gZ3F4cgabBY2FMlp42e2PIQhfMpvHtrs3j3GnIBAAX688KvdQy4Emy1tF+4U+eQBkM0a
	ZeYC6WwrDnBNjn8w/YLpeNkgRpcwG+kTM9q7XzMFDTTF5oJms6rqOa04M456NcV9E2wI
	97Hw==
X-Gm-Message-State: APjAAAUcdp0WmBjfjXzer5QLK/Qww0ZGfnkuqj2zh61Lsha+8CJ35M4r
	j5ApXQr4AqH81HTpjaI5V7JxNjKloVt3V88nNqmzFFVC
X-Google-Smtp-Source: APXvYqy52vcmy7xVvJCDgmf7fmzcHFuDqCv8hHl2NtZUYFiWbsLx5i3cQWmrpmkcYcf3XOfMFEO1veRqL88R9ptseRA=
X-Received: by 2002:a2e:9c89:: with SMTP id x9mr14527645lji.28.1557172110059; 
	Mon, 06 May 2019 12:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <1557034993-10056-1-git-send-email-Qi.Chen@windriver.com>
In-Reply-To: <1557034993-10056-1-git-send-email-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 May 2019 15:48:18 -0400
Message-ID: <CADkTA4OzgQp=SEDPE=J1arVgV6FT4ii0wp=Pnq2Nt1-ohNQZ9Q@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] ceph: set CVE_PRODUCT
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
X-List-Received-Date: Mon, 06 May 2019 19:48:31 -0000
Content-Type: multipart/alternative; boundary="000000000000796bcd05883d6205"

--000000000000796bcd05883d6205
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Sun, May 5, 2019 at 1:54 AM Chen Qi <Qi.Chen@windriver.com> wrote:

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-extended/ceph/ceph_14.1.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-extended/ceph/ceph_14.1.0.bb b/recipes-extended/ceph/
> ceph_14.1.0.bb
> index 0005d3b..55a6d7d 100644
> --- a/recipes-extended/ceph/ceph_14.1.0.bb
> +++ b/recipes-extended/ceph/ceph_14.1.0.bb
> @@ -102,3 +102,5 @@ PACKAGES += " \
>  INSANE_SKIP_${PN}-python += "ldflags"
>  INSANE_SKIP_${PN} += "dev-so"
>  CCACHE_DISABLE = "1"
> +
> +CVE_PRODUCT = "ceph ceph_storage ceph_storage_mon ceph_storage_osd"
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
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000796bcd05883d6205
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Ma=
y 5, 2019 at 1:54 AM Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Q=
i.Chen@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@wi=
ndriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/ceph/<a href=3D"http://ceph_14.1.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">ceph_14.1.0.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/recipes-extended/ceph/<a href=3D"http://ceph_14.1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">ceph_14.1.0.bb</a> b/recipes-extended/ceph/<=
a href=3D"http://ceph_14.1.0.bb" rel=3D"noreferrer" target=3D"_blank">ceph_=
14.1.0.bb</a><br>
index 0005d3b..55a6d7d 100644<br>
--- a/recipes-extended/ceph/<a href=3D"http://ceph_14.1.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">ceph_14.1.0.bb</a><br>
+++ b/recipes-extended/ceph/<a href=3D"http://ceph_14.1.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">ceph_14.1.0.bb</a><br>
@@ -102,3 +102,5 @@ PACKAGES +=3D &quot; \<br>
=C2=A0INSANE_SKIP_${PN}-python +=3D &quot;ldflags&quot;<br>
=C2=A0INSANE_SKIP_${PN} +=3D &quot;dev-so&quot;<br>
=C2=A0CCACHE_DISABLE =3D &quot;1&quot;<br>
+<br>
+CVE_PRODUCT =3D &quot;ceph ceph_storage ceph_storage_mon ceph_storage_osd&=
quot;<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--000000000000796bcd05883d6205--
