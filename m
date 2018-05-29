Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C7B9E00C61; Tue, 29 May 2018 07:31:21 -0700 (PDT)
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
	*      [209.85.128.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 516BFE009D4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:31:19 -0700 (PDT)
Received: by mail-wr0-f193.google.com with SMTP id j1-v6so25910928wrm.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c/Joh0dBpoZikz0jPsP7OZ9qrhln6a7n/Jr4/QgQ8vg=;
	b=adkd/4cmf//6A7/ClPSkJGxvPVTp2Jf2+VK0hjb60Fb5gt8sdNcDDtJt2r+PWS6UL/
	S+LGKgyVCT7XkRS4+FqKD1BnviyDpORwJeXpfgoC/xIYfQkYS3AwPY+6iIZ7LYp/KMwh
	5DXfdhf3xkls/5AfBr50eVMxd+l6c5BlR50ef+tQAjhpwD/SNmZ+pXE0y732hHtP1A2h
	029GeibWOWfduSU98b8X5pdfvguA2UBI2MEubR5D9Scdg1HS2gfB91O0qucoJ7EEXram
	nrq47LD++rMNfzvjS4O9iv/S6d2w/+3CEgcNbJjmzpHcBNRzn0nUk/W6/hx7YGoCCEw0
	O1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c/Joh0dBpoZikz0jPsP7OZ9qrhln6a7n/Jr4/QgQ8vg=;
	b=RdjTeN0k/NK8VlV6Ze9vb9h95bH6l4NA0HmxXCrJCE/pr+3NjeirEyyolaZheLPMDU
	iflgFM/MlxPKom2etF53j+6wOW94lOquRpMY939uvD016jduKPQbBKCu/FOt1AdyRr4X
	efOzNoG7D3/HejX0BSUlrHbYLHjHQjtbSxf5gPGpJJxRWI1z6qlJprXeOyfp/tNggZR0
	UolUf7r7zf0OT8XVcM6eKcnP5HQ9WIFEmRYtJknx6nuaXDz0fbbeKgM+ZT5cup5VJZUk
	/7CsWsav5atXDWD9POfJZz0n98dLdhlgcIG0lBND2VP/B31Rh4eMto1TKDE64iKcldim
	Iimg==
X-Gm-Message-State: ALKqPweHiU9BIwOBDnxRAzGKI2z6NNt1CkjhbVhcARjh5R5EGwcffFrd
	nrgx8zzOubaTUqJkEbLHQ0SE2iJO0NuJFn1BRvU=
X-Google-Smtp-Source: ADUXVKLbNMwRpF6p/AkS1qgVFYeEUgUWnSKO23zJzLsznyA0Pt7YYXAInIQwo87yzsY4rMGOUXGDxLnkWWGZLLTRJ/4=
X-Received: by 2002:a19:14ca:: with SMTP id
	71-v6mr9349992lfu.126.1527604279099; 
	Tue, 29 May 2018 07:31:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3307:0:0:0:0:0 with HTTP; Tue, 29 May 2018 07:31:18
	-0700 (PDT)
In-Reply-To: <1526766501-31809-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1526766501-31809-1-git-send-email-leimaohui@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 May 2018 10:31:18 -0400
Message-ID: <CADkTA4OtYq1wOyDjU3oB2MmG+6m5h3MPSzftMdwTFxbeRgV83w@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [oe-virtualization][meta-cloud-services][PATCH] python-manilaclient: Fix build error as following:
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
X-List-Received-Date: Tue, 29 May 2018 14:31:21 -0000
Content-Type: multipart/alternative; boundary="00000000000069c748056d591645"

--00000000000069c748056d591645
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Sat, May 19, 2018 at 5:48 PM, Lei Maohui <leimaohui@cn.fujitsu.com>
wrote:

> "distutils.errors.DistutilsError: Could not find suitable distribution
> for Requirement.parse('pbr>=2.0.0')"
>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-manilaclient_git.bb | 5
> +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-
> manilaclient_git.bb b/meta-openstack/recipes-devtools/python/python-
> manilaclient_git.bb
> index 5cabf2e..d547717 100644
> --- a/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
> @@ -9,6 +9,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  RDEPENDS_${PN} +=" \
>          python-pbr \
>          python-iso8601 \
> --
> 1.9.1
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

--00000000000069c748056d591645
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Sat, May 19, 2018 at 5:48 PM=
, Lei Maohui <span dir=3D"ltr">&lt;<a href=3D"mailto:leimaohui@cn.fujitsu.c=
om" target=3D"_blank">leimaohui@cn.fujitsu.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">&quot;distutils.errors.<wbr>DistutilsError: Cou=
ld not find suitable distribution for Requirement.parse(&#39;pbr&gt;=3D2.0.=
0&#39;<wbr>)&quot;<br>
<br>
Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.com">l=
eimaohui@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
manilaclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>manil=
aclient_git.bb</a> | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-manilaclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wb=
r>manilaclient_git.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a =
href=3D"http://python-manilaclient_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python-<wbr>manilaclient_git.bb</a><br>
index 5cabf2e..d547717 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
manilaclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>manil=
aclient_git.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
manilaclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>manil=
aclient_git.bb</a><br>
@@ -9,6 +9,11 @@ DEPENDS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-pbr \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+# Satisfy setup.py &#39;setup_requires&#39;<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr-native \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
=C2=A0RDEPENDS_${PN} +=3D&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-pbr \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-iso8601 \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
1.9.1<br>
<br>
<br>
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

--00000000000069c748056d591645--
