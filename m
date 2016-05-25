Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A833DE00CF0; Wed, 25 May 2016 06:40:35 -0700 (PDT)
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
	*      [209.85.218.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7ACD8E00CBA
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 May 2016 06:40:32 -0700 (PDT)
Received: by mail-oi0-f65.google.com with SMTP id r64so11514655oie.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 May 2016 06:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=cRkNbhbBLJAPHQh+YuxpIWAv4vzLnPfi9P35Wkr+NZU=;
	b=o5bwZbslzgtfXm4d7f/8Ra/VNFmCG7RkvPI8p+jaL2f/pwYjBHzL5qlNo93qLEB6YA
	yZjX3T3LZT3q9fc66YYgduOMJL9JuXyC+66XCM8VD9+awV7tCWfiGDyjgszliaVbTt/T
	XL3TXY7oyuMu2rnrH1XVtDk1rM3Px8k9Nj+iTqcnrNxnlqlEeR/MTPawt5b/IOd7YKO5
	R+AEPSmWFShDvH0kWcF6/lXO5GO6WWaY19Bmx/Ebko+MGogZiC5tXc5LxBpIVrud9+TU
	9NfTGnDOKLbk4SJZbq+0zn0XMhmh7gTnIhJTa1XpkqKCiH1oIMZhpRy9YTNcjEbkWW2M
	PsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=cRkNbhbBLJAPHQh+YuxpIWAv4vzLnPfi9P35Wkr+NZU=;
	b=f+rBFJs654P3a5zsNNqJFQyemjhYoxQojXGp3NbFTPW7g0zYtE+Et7sjHG6gMNA+RG
	Rpt/yXooosgeWhVJxvSDbqN6xAQiQx9O0d0je3KantUf/D/FTbrUXrG21qWGalauYk5f
	QovX0iaIny6QtVDpe6mkpFyjEQplrg8Gh1fQ9ujafSbIbHm+tKxjM0bFW0R5uikJnZPD
	kqg0AMS09fGY/j0CkVGlM4KXafqyRH61cAIPrkqd89bGaet0orlubradXN1xg/XG6B+5
	yjJFghPieEzkwdWFPhrwMne1xQm757HmF3r2WhdHZkhdRLSFWC7GABt8Owo1LB2SHo7A
	sNsQ==
X-Gm-Message-State: ALyK8tIOPIgnoMvY0wz8QARuKtX45ne8jwnyDYzbmkTBzwiar+bFAnnqYp6Ckpo0ew49gfFCq0dWU1LEkUaLSQ==
MIME-Version: 1.0
X-Received: by 10.202.196.136 with SMTP id u130mr2030011oif.116.1464183631225; 
	Wed, 25 May 2016 06:40:31 -0700 (PDT)
Received: by 10.157.32.198 with HTTP; Wed, 25 May 2016 06:40:31 -0700 (PDT)
In-Reply-To: <1463973343-4258-1-git-send-email-zhe.he@windriver.com>
References: <1463973343-4258-1-git-send-email-zhe.he@windriver.com>
Date: Wed, 25 May 2016 09:40:31 -0400
Message-ID: <CADkTA4O-JDnoevfiopRJkrs6x5OVMhDu1YCUFmFf2vomFawAKA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] protobuf: Add RDEPENDS for ptest
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
X-List-Received-Date: Wed, 25 May 2016 13:40:35 -0000
Content-Type: multipart/alternative; boundary=001a113e26bc39a9150533aad1a6

--001a113e26bc39a9150533aad1a6
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Sun, May 22, 2016 at 11:15 PM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> This patch adds bash and python to ptest's RDEPENDS to avoid the following
> warning:
> "WARNING: QA Issue: /usr/lib64/protobuf/ptest/run-ptest_protobuf-ptest
> contained
> in package protobuf-ptest requires /bin/bash, but no providers found in its
> RDEPENDS [file-rdeps]"
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-devtools/protobuf/protobuf_2.5.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-devtools/protobuf/protobuf_2.5.0.bb
> b/recipes-devtools/protobuf/protobuf_2.5.0.bb
> index e1c7254..23b74a7 100644
> --- a/recipes-devtools/protobuf/protobuf_2.5.0.bb
> +++ b/recipes-devtools/protobuf/protobuf_2.5.0.bb
> @@ -22,6 +22,7 @@ EXTRA_OECONF += "
> --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
>  inherit autotools setuptools ptest
>
>  DEPENDS += "protobuf-native"
> +RDEPENDS_${PN}-ptest = "bash python"
>
>  PYTHON_SRC_DIR="python"
>  TEST_SRC_DIR="examples"
> --
> 1.9.1
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113e26bc39a9150533aad1a6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Sun, May 22, 2016 at 11:15 P=
M,  <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D=
"_blank">zhe.he@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@=
windriver.com</a>&gt;<br>
<br>
This patch adds bash and python to ptest&#39;s RDEPENDS to avoid the follow=
ing<br>
warning:<br>
&quot;WARNING: QA Issue: /usr/lib64/protobuf/ptest/run-ptest_protobuf-ptest=
 contained<br>
in package protobuf-ptest requires /bin/bash, but no providers found in its=
<br>
RDEPENDS [file-rdeps]&quot;<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/protobuf/<a href=3D"http://protobuf_2.5.0.bb" rel=3D=
"noreferrer" target=3D"_blank">protobuf_2.5.0.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/recipes-devtools/protobuf/<a href=3D"http://protobuf_2.5.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">protobuf_2.5.0.bb</a> b/recipes-devto=
ols/protobuf/<a href=3D"http://protobuf_2.5.0.bb" rel=3D"noreferrer" target=
=3D"_blank">protobuf_2.5.0.bb</a><br>
index e1c7254..23b74a7 100644<br>
--- a/recipes-devtools/protobuf/<a href=3D"http://protobuf_2.5.0.bb" rel=3D=
"noreferrer" target=3D"_blank">protobuf_2.5.0.bb</a><br>
+++ b/recipes-devtools/protobuf/<a href=3D"http://protobuf_2.5.0.bb" rel=3D=
"noreferrer" target=3D"_blank">protobuf_2.5.0.bb</a><br>
@@ -22,6 +22,7 @@ EXTRA_OECONF +=3D &quot; --with-protoc=3D${STAGING_BINDIR=
_NATIVE}/protoc&quot;<br>
=C2=A0inherit autotools setuptools ptest<br>
<br>
=C2=A0DEPENDS +=3D &quot;protobuf-native&quot;<br>
+RDEPENDS_${PN}-ptest =3D &quot;bash python&quot;<br>
<br>
=C2=A0PYTHON_SRC_DIR=3D&quot;python&quot;<br>
=C2=A0TEST_SRC_DIR=3D&quot;examples&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div>

--001a113e26bc39a9150533aad1a6--
