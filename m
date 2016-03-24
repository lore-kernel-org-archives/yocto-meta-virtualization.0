Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E1FEE00B70; Thu, 24 Mar 2016 08:37:04 -0700 (PDT)
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
	*      [209.85.218.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EEC68E00AEA
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 08:37:02 -0700 (PDT)
Received: by mail-oi0-f45.google.com with SMTP id r187so66210250oih.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 08:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=lKDaAsNBiKIwi2TJBUroFni1BogKUtX0WvzfMwsePYc=;
	b=OWEjpvuLEVlJKNw3F10ICjpOukA6IYQEjMo7TdA8H6ghQTMkXgeJ/OGDo8GfXqMfWL
	y+mJ9WBlobDGBKH7P3UQMrCh831pUQYnmrGqiSQwv+nLCj/MqR62soNwhOJL5GoT0023
	yDMYNQ1hrj1766TGkxRZGY/JpQ+Ybu+qUo4HUPsthlvfpDSczaqSDwC5pUsGlzG4tqgE
	fdrwdFyuY+K07ZVtk17zRFOWbfjXEy//fKeYTKbp9bJpRkrglco5Q7LdgOjkZHKxZIgz
	9Oy61Khp1K6JMp55OW4WtFEz1gAHta/Ofo2iylDrzC+a+492V0r+lNTNcu6sEKvsftX+
	2y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=lKDaAsNBiKIwi2TJBUroFni1BogKUtX0WvzfMwsePYc=;
	b=PT7LS6rW1z4nrKiUMQum3acqHmyrJgC8zz9Us4n8zIYw7mFblx0VbGfuuOSgOR1sbk
	80KlmARZkklTqPm5nhPvWM6VTcAyYqSgY2ghG1OwdX9CA/ALq2b3Hm8vkv2TPSmvKFKk
	W8MMtnYVLu8OtnfF/n3KrHWK0IhS8Hbu7MnvZFbyXLEb3B5R5PHVcQPQq6XSjda5S9Yc
	fNSeYB5Ng6feKvAlM4mSqF39EyHLcLnjgPtBM1OZrntDc0CdXcP+pCwz3z3LYTi/uqgO
	6BrsGqLKGPTDuLqZ0M7il3XCX5Iotqc75EXqke8uny27nvdCIbzEaA8sXzKxlJqp+R+2
	64xQ==
X-Gm-Message-State: AD7BkJKKEYKcjVVqvNFeOXwceEmU+wpJMNu9/JC8OutIWgCPPbAmkQH6rIV5UKlpeNjE/82/mknKnkd0uLRgeA==
MIME-Version: 1.0
X-Received: by 10.157.7.67 with SMTP id 61mr4334313ote.186.1458833788251; Thu,
	24 Mar 2016 08:36:28 -0700 (PDT)
Received: by 10.157.8.248 with HTTP; Thu, 24 Mar 2016 08:36:28 -0700 (PDT)
In-Reply-To: <1458831674-12779-1-git-send-email-cjp256@gmail.com>
References: <1458831674-12779-1-git-send-email-cjp256@gmail.com>
Date: Thu, 24 Mar 2016 11:36:28 -0400
Message-ID: <CADkTA4NR9Y+HwJ_mFv5ubo-EjPeyMS1-Ka4p3-8EtKDpOACxzw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Chris Patterson <pattersonc@ainfosec.com>
Subject: Re: [PATCH] xen: add curl and gnutls to depends
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
X-List-Received-Date: Thu, 24 Mar 2016 15:37:04 -0000
Content-Type: multipart/alternative; boundary=001a113dda08bc3676052ecd3545

--001a113dda08bc3676052ecd3545
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Thu, Mar 24, 2016 at 11:01 AM, Chris Patterson <cjp256@gmail.com> wrote:

> From: Chris Patterson <pattersonc@ainfosec.com>
>
> Addresses QA warnings with regards to rdepends for xen-qemu.
>
> Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
> ---
>  recipes-extended/xen/xen.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 2eba012..c30988e 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -31,9 +31,11 @@ DEPENDS = " \
>      util-linux-native \
>      xz-native \
>      bridge-utils \
> +    curl \
>      dtc \
>      gettext \
>      glib-2.0 \
> +    gnutls \
>      iproute2 \
>      libnl \
>      ncurses \
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

--001a113dda08bc3676052ecd3545
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, Mar 24, 2016 at 11:01 A=
M, Chris Patterson <span dir=3D"ltr">&lt;<a href=3D"mailto:cjp256@gmail.com=
" target=3D"_blank">cjp256@gmail.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">From: Chris Patterson &lt;<a href=3D"mailto:pattersonc@ai=
nfosec.com">pattersonc@ainfosec.com</a>&gt;<br>
<br>
Addresses QA warnings with regards to rdepends for xen-qemu.<br>
<br>
Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:pattersonc@ainfosec.co=
m">pattersonc@ainfosec.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index 2eba012..c30988e 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -31,9 +31,11 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0util-linux-native \<br>
=C2=A0 =C2=A0 =C2=A0xz-native \<br>
=C2=A0 =C2=A0 =C2=A0bridge-utils \<br>
+=C2=A0 =C2=A0 curl \<br>
=C2=A0 =C2=A0 =C2=A0dtc \<br>
=C2=A0 =C2=A0 =C2=A0gettext \<br>
=C2=A0 =C2=A0 =C2=A0glib-2.0 \<br>
+=C2=A0 =C2=A0 gnutls \<br>
=C2=A0 =C2=A0 =C2=A0iproute2 \<br>
=C2=A0 =C2=A0 =C2=A0libnl \<br>
=C2=A0 =C2=A0 =C2=A0ncurses \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
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

--001a113dda08bc3676052ecd3545--
