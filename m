Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB529E00D5F; Wed,  9 May 2018 07:51:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6150BE00D53
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 May 2018 07:51:00 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id t129-v6so12073028lff.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 09 May 2018 07:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TN5jgGVH40YdMCYnj86vxNNE1uMdj5crwjGNhhzxniM=;
	b=jn2kUXSFWk25qUvnqRaNkTj0UMS0FQwPn2PH5y6NTstNj/UN5L7LWE4Qy7/9uOmnwD
	pnI9DFsrOXIzMKGy47OONqpRENC5lJ5F6wP1WfsuKgH0AJlLZ9WmLZEITm7wj/u1IYZW
	e7fdGoVMAGXmdjkgSQJkDcWfVIXKGT/cOUt1c+S+E5RPHmX2JSeHgrxzpNJM9H6XbeTB
	SWYKSUIl1FSBh1MIQP3oI//uoNiXZbnSTg2JsnZf4f996YbZZ/RLR511z48lwdNhsC4y
	3B/tsKNIEw+EuYu+XKZ/CB2vrMgoqXd9wAQyk9+r2ZZNccK2ZHbTW2bmG2OCWYCaryQv
	BK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TN5jgGVH40YdMCYnj86vxNNE1uMdj5crwjGNhhzxniM=;
	b=uU1TuaTn+Ovh76UqUn96NEUV2Q6oEaaM/i7BffkCc4Z+V2AwvXrlVOwm+R+uuQwe+G
	pYB73qGEx5O6RVOAXSFUoT4asqgkzhRj97qZ52twLqqoVqjf9SWOihDKblFfeD4TEFvN
	CLFo0WwJUud8yqsJ8Iu2Az2BkIVnK5XJfGjBwTrwGV2M8TmbLvK/x1o2EQ+E7j0OHFco
	sVOFZ2QEnNp87BtKwv7Wiv6FXBeeMdmiqNfwKfEsHpCTqiwTPJwl2TS7HsZyCqJC4nr1
	xohXhwqDnbLFOanpKWUNlMZy5sr9Td1znbIc5D0E2z8EvPsfyt1Y+kPcvLN/cdrIScur
	mPPQ==
X-Gm-Message-State: ALKqPwcKOFvPXUuQn85ero2GLKTKWZNmzfdjSFy/Aai+/9rjQnLtogZc
	Bmw25wGk0B38u3CXG/XEyfIO2WTOFMo3IZ93+ws=
X-Google-Smtp-Source: AB8JxZq2MG6XVCCJUi/IEwfxlMq9f+kMHbwgLhydZCZNnpI6ntYzXjDnPVBXTyUdDiG+XDSKMwfaWC0wALm0ukZisLg=
X-Received: by 2002:a19:8e:: with SMTP id 136-v6mr5520937lfa.94.1525877459302; 
	Wed, 09 May 2018 07:50:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Wed, 9 May 2018 07:50:58 -0700 (PDT)
In-Reply-To: <20180508102812.25246-1-costamagnagianfranco@yahoo.it>
References: <20180508102812.25246-1-costamagnagianfranco@yahoo.it>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 9 May 2018 10:50:58 -0400
Message-ID: <CADkTA4Pw-8M=g0R+Ggcqbg-wngK220FOXO0gO_r-L7mn02d=ig@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	meta-virtualization@yoctoproject.org,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: Re: [PATCH] lxc: enable fix apparmor feature name. A typo called it "apparmour", back in commit 7a62620ea09f01c1f2a730cbb1264202276f2b87 Changing the default to the right value
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
X-List-Received-Date: Wed, 09 May 2018 14:51:02 -0000
Content-Type: multipart/alternative; boundary="000000000000eebfa6056bc7079b"

--000000000000eebfa6056bc7079b
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, May 8, 2018 at 6:28 AM, Gianfranco Costamagna <
costamagna.gianfranco@gmail.com> wrote:

> Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
> ---
>  recipes-containers/lxc/lxc_2.0.8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/
> lxc_2.0.8.bb
> index d8607f8..c87b875 100644
> --- a/recipes-containers/lxc/lxc_2.0.8.bb
> +++ b/recipes-containers/lxc/lxc_2.0.8.bb
> @@ -65,7 +65,7 @@ PACKAGECONFIG ??= "templates \
>  "
>  PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc
> --disable-api-docs,,"
>  PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
> -PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-
> apparmor,apparmor,apparmor"
> +PACKAGECONFIG[apparmor] = "--enable-apparmor,--disable-
> apparmor,apparmor,apparmor"
>  PACKAGECONFIG[templates] = ",,, ${PN}-templates"
>  PACKAGECONFIG[selinux] = "--enable-selinux,--disable-
> selinux,libselinux,libselinux"
>  PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-
> seccomp,libseccomp,libseccomp"
> --
> 2.14.1
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

--000000000000eebfa6056bc7079b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, May 8, 2018 at 6:28 AM,=
 Gianfranco Costamagna <span dir=3D"ltr">&lt;<a href=3D"mailto:costamagna.g=
ianfranco@gmail.com" target=3D"_blank">costamagna.gianfranco@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Gianfran=
co Costamagna &lt;<a href=3D"mailto:gianfranco.costamagna@abinsula.com">gia=
nfranco.costamagna@<wbr>abinsula.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.<wbr>0.8.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a> b/recipes-containers/lx=
c/<a href=3D"http://lxc_2.0.8.bb" rel=3D"noreferrer" target=3D"_blank">lxc_=
<wbr>2.0.8.bb</a><br>
index d8607f8..c87b875 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a><br>
@@ -65,7 +65,7 @@ PACKAGECONFIG ??=3D &quot;templates \<br>
=C2=A0&quot;<br>
=C2=A0PACKAGECONFIG[doc] =3D &quot;--enable-doc --enable-api-docs,--disable=
-<wbr>doc --disable-api-docs,,&quot;<br>
=C2=A0PACKAGECONFIG[rpath] =3D &quot;--enable-rpath,--disable-<wbr>rpath,,&=
quot;<br>
-PACKAGECONFIG[apparmour] =3D &quot;--enable-apparmor,--disable-<wbr>apparm=
or,apparmor,apparmor&quot;<br>
+PACKAGECONFIG[apparmor] =3D &quot;--enable-apparmor,--disable-<wbr>apparmo=
r,apparmor,apparmor&quot;<br>
=C2=A0PACKAGECONFIG[templates] =3D &quot;,,, ${PN}-templates&quot;<br>
=C2=A0PACKAGECONFIG[selinux] =3D &quot;--enable-selinux,--disable-<wbr>seli=
nux,libselinux,libselinux&quot;<br>
=C2=A0PACKAGECONFIG[seccomp] =3D&quot;--enable-seccomp,--disable-<wbr>secco=
mp,libseccomp,libseccomp&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.14.1<br>
<br>
-- <br>
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

--000000000000eebfa6056bc7079b--
