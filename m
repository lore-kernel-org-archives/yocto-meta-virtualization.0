Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 497F9E006EA; Thu, 16 Feb 2017 15:22:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.193 listed in dnsbl.sorbs.net]
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
	*      [209.85.220.193 listed in list.dnswl.org]
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AEDBFE00510
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Feb 2017 15:22:56 -0800 (PST)
Received: by mail-qk0-f193.google.com with SMTP id e1so4560466qkh.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Feb 2017 15:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wzbQWOmCLUS0lD+NHGEPbTJsqGmD9TeqP9vi83V81Iw=;
	b=EsKXcgAS5FIGpGfjOa8in5iEpCZVO6af7g8HFP/2iYo0kDM6/GD4GKXn4/ds7Nmzru
	tWsBAl06w0rtxCPZd+R+obnmEybi4K/Ofqt1lTuYPKP13MaZJoeaXGrlOJtnyr9yM9b6
	sYY1hlxoUj63Al8/yYrLdexcK9pWMwA1IxGScJlFYmsX5QVj5Gxn30LQ2qLFxP937bOW
	Q5NfXyXXX1y3yrjHn8oLJWj5JwLzGM3uG2L3WjguIiAuKpsqa2BibOyxmv8N4KwI+AIt
	2xz6LmsWkQkiI4URrHdIAb3JJe/8j1GG8oWk1BMwJD+vup35fbZ4AVTJlilMAgFQSH4b
	rMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wzbQWOmCLUS0lD+NHGEPbTJsqGmD9TeqP9vi83V81Iw=;
	b=g7DfsmLXpf8dWj7jVF7MRZP8PqCVnKwXrrfBssHUqiQYHXEvnKBa1C9KzJDXcytajz
	CRq4KYgWEYyULzntfcnRtxu4zcH7RLl4puaFYDXMmbVtO4E89Gkin2lxeqq1I33t+ozm
	zdIjMAtwd+WMngdpye4JxX7tUivVQvUF3foDe9fCVPf4Tut5Rv936ctXBLXlP80hojiW
	hYSmnupcoG1+dvY+6CMFZrB+7R6shDNcbUtlhBWx29qwpTclMGeOtOx7EisX3ksS0JFn
	cLPU14Agh93mB57oBcSPKe1L47a9zZR2oRkIoXq7fHKwcF2L9MSuTxEOvG6gKPVkjtee
	j4Sg==
X-Gm-Message-State: AMke39kQv0dsyf8Dje2afAS1a/9kYHedZJOTfIifqqi2ONnJAHvOb0VIMuVUcUfKC6dUs4ByZ2yCPLMpB62FDw==
X-Received: by 10.55.165.131 with SMTP id o125mr4630479qke.254.1487287375229; 
	Thu, 16 Feb 2017 15:22:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Thu, 16 Feb 2017 15:22:54 -0800 (PST)
In-Reply-To: <88626e0b-e944-751e-9885-c84b74220bd0@siemens.com>
References: <91a2ecd5-1f2d-25c4-ee68-972b8920d67c@siemens.com>
	<CADkTA4NxjSQZi06Dniog3H6U5xPWq+ZP_UeA9Oigxg_L6E-cUA@mail.gmail.com>
	<88626e0b-e944-751e-9885-c84b74220bd0@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 16 Feb 2017 18:22:54 -0500
Message-ID: <CADkTA4NRM+KV8Ng0kVPtNF7=iTR=abp+ZtnxzuJyRkJb47rd1w@mail.gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] containerd: Fix build on 386
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
X-List-Received-Date: Thu, 16 Feb 2017 23:22:58 -0000
Content-Type: multipart/alternative; boundary=94eb2c06374eadf7b90548ae1364

--94eb2c06374eadf7b90548ae1364
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 14, 2017 at 4:49 AM, Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 2017-02-10 22:17, Bruce Ashfield wrote:
> > applied.
> >
> > Bruce
> >
>
> Thanks. Will it go into stable as well? At least morty.
>

I've been tied up fighting with docker .. but yes, I'll queue this up and
push it out to
the -stable branches shortly.

Bruce


>
> Jan
>
> > On Fri, Feb 10, 2017 at 7:14 AM, Jan Kiszka <jan.kiszka@siemens.com
> > <mailto:jan.kiszka@siemens.com>> wrote:
> >
> >     Go only understands "386" as target arch, not "i586". Adjust this.
> >
> >     Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com
> >     <mailto:jan.kiszka@siemens.com>>
> >     ---
> >
> >     Found while building meta-virtualization for an Intel Quark target.
> >
> >      recipes-containers/containerd/containerd_git.bb
> >     <http://containerd_git.bb> | 3 +++
> >      1 file changed, 3 insertions(+)
> >
> >     diff --git a/recipes-containers/containerd/containerd_git.bb
> >     <http://containerd_git.bb>
> >     b/recipes-containers/containerd/containerd_git.bb
> >     <http://containerd_git.bb>
> >     index c257355..5b94dde 100644
> >     --- a/recipes-containers/containerd/containerd_git.bb
> >     <http://containerd_git.bb>
> >     +++ b/recipes-containers/containerd/containerd_git.bb
> >     <http://containerd_git.bb>
> >     @@ -35,6 +35,9 @@ do_compile() {
> >             if [ "${TARGET_ARCH}" = "aarch64" ]; then
> >                     export GOARCH="arm64"
> >             fi
> >     +       if [ "${TARGET_ARCH}" = "i586" ]; then
> >     +               export GOARCH="386"
> >     +       fi
> >
> >             # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
> >             # docker to download its dependencies but rather
> >
> >     --
> >     _______________________________________________
> >     meta-virtualization mailing list
> >     meta-virtualization@yoctoproject.org
> >     <mailto:meta-virtualization@yoctoproject.org>
> >     https://lists.yoctoproject.org/listinfo/meta-virtualization
> >     <https://lists.yoctoproject.org/listinfo/meta-virtualization>
> >
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end"
>
> --
> Siemens AG, Corporate Technology, CT RDA ITP SES-DE
> Corporate Competence Center Embedded Linux
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c06374eadf7b90548ae1364
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Feb 14, 2017 at 4:49 AM, Jan Kiszka <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 2017-02-10 22=
:17, Bruce Ashfield wrote:<br>
&gt; applied.<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
<br>
Thanks. Will it go into stable as well? At least morty.<br></blockquote><di=
v><br></div><div>I&#39;ve been tied up fighting with docker .. but yes, I&#=
39;ll queue this up and push it out to</div><div>the -stable branches short=
ly.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Jan<br>
<span class=3D""><br>
&gt; On Fri, Feb 10, 2017 at 7:14 AM, Jan Kiszka &lt;<a href=3D"mailto:jan.=
kiszka@siemens.com">jan.kiszka@siemens.com</a><br>
</span><span class=3D"">&gt; &lt;mailto:<a href=3D"mailto:jan.kiszka@siemen=
s.com">jan.kiszka@siemens.com</a><wbr>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Go only understands &quot;386&quot; as target arch,=
 not &quot;i586&quot;. Adjust this.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Jan Kiszka &lt;<a href=3D"mailto:jan=
.kiszka@siemens.com">jan.kiszka@siemens.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@siem=
ens.com">jan.kiszka@siemens.com</a><wbr>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Found while building meta-virtualization for an Int=
el Quark target.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 recipes-containers/containerd/<a href=3D"http://co=
ntainerd_git.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>containerd_git.b=
b</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://containerd_git.bb" rel=
=3D"noreferrer" target=3D"_blank">http://containerd_git.bb</a>&gt; | 3 +++<=
br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0 1 file changed, 3 insertions(+)<b=
r>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/recipes-containers/<wbr>containerd/<a =
href=3D"http://containerd_git.bb" rel=3D"noreferrer" target=3D"_blank">cont=
ainerd_git.bb</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://containerd_git.bb" rel=
=3D"noreferrer" target=3D"_blank">http://containerd_git.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/recipes-containers/<wbr>containerd/<a href=3D"htt=
p://containerd_git.bb" rel=3D"noreferrer" target=3D"_blank">containerd_git.=
bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://containerd_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://containerd_git.bb</a>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0index c257355..5b94dde 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/recipes-containers/<wbr>containerd/<a href=3D=
"http://containerd_git.bb" rel=3D"noreferrer" target=3D"_blank">containerd_=
git.bb</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://containerd_git.bb" rel=
=3D"noreferrer" target=3D"_blank">http://containerd_git.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/recipes-containers/<wbr>containerd/<a href=3D=
"http://containerd_git.bb" rel=3D"noreferrer" target=3D"_blank">containerd_=
git.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://containerd_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://containerd_git.bb</a>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0@@ -35,6 +35,9 @@ do_compile() {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${TARGET_ARC=
H}&quot; =3D &quot;aarch64&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0export GOARCH=3D&quot;arm64&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${TARGET_ARC=
H}&quot; =3D &quot;i586&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0export GOARCH=3D&quot;386&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Set GOPATH. See &#39;=
PACKAGERS.md&#39;. Don&#39;t rely on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# docker to download it=
s dependencies but rather<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0______________________________<wbr>________________=
_<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-virtualization mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:meta-virtualization@yoctoproject.=
org">meta-virtualization@<wbr>yoctoproject.org</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:meta-virtualiza=
tion@yoctoproject.org">meta-virtualization@<wbr>yoctoproject.org</a>&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.yoctoproject.org/listinfo/=
meta-virtualization" rel=3D"noreferrer" target=3D"_blank">https://lists.yoc=
toproject.<wbr>org/listinfo/meta-<wbr>virtualization</a><br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listinfo/met=
a-<wbr>virtualization</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt; thee at its end&quot;<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Siemens AG, Corporate Technology, CT RDA ITP SES-DE<br>
Corporate Competence Center Embedded Linux<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--94eb2c06374eadf7b90548ae1364--
