Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CED76E00D19; Fri,  1 Dec 2017 18:49:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87599E00CEF
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Dec 2017 18:49:57 -0800 (PST)
Received: by mail-qk0-f194.google.com with SMTP id z203so15584904qkb.5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 01 Dec 2017 18:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lok5wf8dxXlxUJGG5DOIpUO8adaOo6PYFzKuTqn4osg=;
	b=Vul8aP6o+emPrppjqgd+Qpmkd6tVTCFrTfXsDl3TJy7qKWw3wxTbYPwO6CRoBCvDIl
	HlbMy3HYxSkKVWC2pkPk4Z8/AdTUzTE2r1F+j9BzGfIQhjOsNELEnkwRlF0Uqi+zZ3GW
	7VO/Uqc0TgzFKAhmZuipWIB+rSO6ndeREHoiAJK8hcbiEjS4g8YFoXNuiaq36ZVJ6QaA
	p8e+lqy9tm8uTakG2U2JGIShxEPIgB+SYgLlQITDXtAPFML/HVXeOjRXPA7T5vbxBwrc
	y+w72M26VrAfXwEXdpfXghcDtZyQdrAtf1DxanWR5h+ibsR5SbZYQkiN8fc8MJZHEJAO
	lSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lok5wf8dxXlxUJGG5DOIpUO8adaOo6PYFzKuTqn4osg=;
	b=Ilx/D2ZZR2sVGa3ko5abNIVZ0q4a2ybXHDv0uWzf4PnOrUYCag8FtYLg49fYtvRj+I
	1FA4z7chk1r1JVQ8f5aPeMhJH8VNlJRUcwh01eYCCDskHm8t5ziihFcymAF/59Gfe2vv
	dAuJ7I6/Vxv348rrk6idEeQlfJ9m+4pLIGlGlCWgPQDNGi2TfkXc+w2s4R8Z9l2S4U34
	jtupvHy5lx0acUy/642P+gazqhZfYyI7nqhMoOxfH8gJAfWp6iktXOKStVt0TAr5olJy
	f8TqlPMdU8aJkiZgQStWgQ3DyrYqo++mn5+Xs/w0c5UG6msp/QWTgLeAaEf0c14Zs80X
	0t4Q==
X-Gm-Message-State: AKGB3mJ6P9pqhHhojUEGYnwVu69X5FbcMLTd1z57nGaDF1ClAskRJrRH
	YE/Yu/c3I3LaVZ1lZrsEUuN5sA9dO5v9C7xPaC8=
X-Google-Smtp-Source: AGs4zMadxS/oGexURRp1bkid4ldfeL8If2WqPrl8tLlQlvoxgaolL7A3iO9NJJlJlXs9EZgCoqWMtvF/LO5mEoiyDfM=
X-Received: by 10.55.160.69 with SMTP id j66mr10079303qke.94.1512182997395;
	Fri, 01 Dec 2017 18:49:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Fri, 1 Dec 2017 18:49:56 -0800 (PST)
In-Reply-To: <20171127081004.6317-1-jackie.huang@windriver.com>
References: <20171127081004.6317-1-jackie.huang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 1 Dec 2017 21:49:56 -0500
Message-ID: <CADkTA4NsjOkcntyLPka2knHSxhJKmigm3A25s_XSpMhaZB=CCw@mail.gmail.com>
To: "Huang, Jie (Jackie)" <jackie.huang@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: add back the rdepends on glibc-utils
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
X-List-Received-Date: Sat, 02 Dec 2017 02:49:59 -0000
Content-Type: multipart/alternative; boundary="94eb2c070900652c4e055f528a53"

--94eb2c070900652c4e055f528a53
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Nov 27, 2017 at 3:10 AM, <jackie.huang@windriver.com> wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>
> The rdepends on glibc-utils was removed without reason
> in the following commit:
> """
> e73608d56e498a7075e7a3e5550aafd76987d7aa
> lxc: 2.0.0 -> 2.0.8
> """
>
> And it causes failure:
> /usr/libexec/lxc/lxc-net: line 125: getent: command not found
>
> So add the dependency back.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  recipes-containers/lxc/lxc_2.0.8.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/
> lxc_2.0.8.bb
> index 93d5a10..c9ce5f0 100644
> --- a/recipes-containers/lxc/lxc_2.0.8.bb
> +++ b/recipes-containers/lxc/lxc_2.0.8.bb
> @@ -22,6 +22,9 @@ RDEPENDS_${PN} = " \
>                 gnutls \
>                 nettle \
>  "
> +
> +RDEPENDS_${PN}_append_libc-glibc = " glibc-utils"
> +
>  RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash"
>
>  SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
> --
> 2.11.0
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

--94eb2c070900652c4e055f528a53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, Nov 27, 2017 at 3:10 AM=
,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jackie.huang@windriver.com" targ=
et=3D"_blank">jackie.huang@windriver.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">From: Jackie Huang &lt;<a href=3D"mailto:jackie.huang=
@windriver.com">jackie.huang@windriver.com</a>&gt;<br>
<br>
The rdepends on glibc-utils was removed without reason<br>
in the following commit:<br>
&quot;&quot;&quot;<br>
e73608d56e498a7075e7a3e5550aaf<wbr>d76987d7aa<br>
lxc: 2.0.0 -&gt; 2.0.8<br>
&quot;&quot;&quot;<br>
<br>
And it causes failure:<br>
/usr/libexec/lxc/lxc-net: line 125: getent: command not found<br>
<br>
So add the dependency back.<br>
<br>
Signed-off-by: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.co=
m">jackie.huang@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.<wbr>0.8.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a> b/recipes-containers/lx=
c/<a href=3D"http://lxc_2.0.8.bb" rel=3D"noreferrer" target=3D"_blank">lxc_=
<wbr>2.0.8.bb</a><br>
index 93d5a10..c9ce5f0 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a><br>
@@ -22,6 +22,9 @@ RDEPENDS_${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nettle \<br>
=C2=A0&quot;<br>
+<br>
+RDEPENDS_${PN}_append_libc-<wbr>glibc =3D &quot; glibc-utils&quot;<br>
+<br>
=C2=A0RDEPENDS_${PN}-ptest +=3D &quot;file make gmp nettle gnutls bash&quot=
;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org/downloads/${B=
PN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://linuxcontaine=
rs.org/<wbr>downloads/${BPN}-${PV}.tar.gz</a> \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
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

--94eb2c070900652c4e055f528a53--
