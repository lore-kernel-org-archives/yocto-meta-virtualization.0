Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFE03E00405; Mon, 23 Jan 2017 10:24:26 -0800 (PST)
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
	*      [209.85.161.169 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14BC7E0033D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 10:24:24 -0800 (PST)
Received: by mail-yw0-f169.google.com with SMTP id v200so144326489ywc.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 10:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qijq+Lt02IVWDUbcSPmcWcuCld5p4MfWdI1JUo1Ejxg=;
	b=rjOTuyHTrzF3DFp3ticWlrUjYr9e6kl/ZiWzd+TG+spzzDCONkBeZC71xM0h+qLyps
	HO6Aj8hciLmeKwhCvYfcEL5Jev46eMPFZ71gBB6YRhID4BR0fRcgXwX5i4UScFr48P3c
	SPKOCgVtyqvpcJ8N4tfS3bPvvj7IMMq5dR5omhPZYsZSYvzgygqgKUsp6cM9xSfzrLwx
	qwkvkmdDJxwPBCyMxA8pwKFBsCXT2WKaLs8Fc42jkCeTXFEFzTo0oEWoocTMeF4A3qSH
	PBruUhRKZUYflK5WYRUe/qesXdZkbX+7vSAWbaUVmeYF0ThcCLUlxfkb5QHjV/iY1Tvd
	hhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qijq+Lt02IVWDUbcSPmcWcuCld5p4MfWdI1JUo1Ejxg=;
	b=Tba7+u+UGXcYrSrlXyAWp5jDgUBKiRIniAxIepjIPOCzq1gp9pYY8urKMitxdAznBP
	+x74Q/n9wiGBJyxSMAn8YGyWjkJyeXB7WRSXQ+l50Vd5mR47Aln7wwOMOeygZC1phGy7
	rFnWdyQPn/CP1k+3uCz3drKnS7jbkbGuqtMe3+/MfgHzoR5m5XNgYbdHu94KNCJ54NHK
	IeNYvvuwp1vf7DDfV6DWNk57pP7PULI4XNURP0PaKOtcNXMhUg507urGzapBL1FmviCG
	Lkk60ZmWf/ZdmrwV4Jg0oixfFWvp7PDxYMFwk0IUW6AJDeM6jVFiayrcavhz5djYJ+zy
	e4iA==
X-Gm-Message-State: AIkVDXJQ6dIOezXooXZKEEr5VNQzgI452UtdlxyGS71kEzm9bcWB7k0KLc27dNPQUQDlbUs2PTDiZvbt910BQA==
X-Received: by 10.55.68.74 with SMTP id r71mr20442034qka.157.1485195863800;
	Mon, 23 Jan 2017 10:24:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Mon, 23 Jan 2017 10:24:22 -0800 (PST)
In-Reply-To: <CAPuovEK7wufkACFx21rz18HhhALqG_ELw31wFSei-XpCXdyBTQ@mail.gmail.com>
References: <1485162147-6734-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CAPuovEK7wufkACFx21rz18HhhALqG_ELw31wFSei-XpCXdyBTQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 23 Jan 2017 13:24:22 -0500
Message-ID: <CADkTA4MgUjaG6jRzTu=qSH5VTviQh4m37D=rZ15o9gbTp5Ar+g@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] [PATCH] python-heatclient: 0.6.0 -> 1.7.0
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
X-List-Received-Date: Mon, 23 Jan 2017 18:24:26 -0000
Content-Type: multipart/alternative; boundary=001a11488c94e2436f0546c71bd8

--001a11488c94e2436f0546c71bd8
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 23, 2017 at 9:01 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On Mon, Jan 23, 2017 at 4:02 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> wrote:
> > Upgrade python-heatclient from 0.6.0 to 1.7.0.
> >
> > Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > ---
>
> Huang, we need to ensure we stick to releases witch match
> stable/newton and not go beyond. So for this package we should be
> using the latest commit on the stable/newton branch and the version
> will be 1.5.0+git${SRCPV}. The other uprev's look fine, although as we
> proceed through the newton update we might find incompatibilities
> which might result in some tweaking.
>

Agreed. I'm happy to take uprevs of the python support packages, but for
anything that is a core project, or interfaces directly with those core
projects,
I'd rather batch merge their updates .. once we've shown a fully working
system.

Bruce


>
> Just out of curiosity, what are your end goals for these
> contributions? do you have a usecase for this repo that I can keep in
> mind as I move things forward?
>
> Mark
>
>
> >  meta-openstack/recipes-devtools/python/python-heatclient_git.bb | 4
> ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-openstack/recipes-devtools/python/python-
> heatclient_git.bb b/meta-openstack/recipes-devtools/python/python-
> heatclient_git.bb
> > index 26d86be..711a36d 100644
> > --- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> > @@ -28,8 +28,8 @@ SRCNAME = "heatclient"
> >
> >  SRC_URI = "git://github.com/openstack/python-heatclient.git;branch=
> master"
> >
> > -PV = "0.6.0+git${SRCPV}"
> > -SRCREV = "7cca8394b8ab2f4dccb982ae789b1b2985627115"
> > +PV = "1.7.0+git${SRCPV}"
> > +SRCREV = "17dd3068e4d6fc10236290cc082908c439bcfead"
> >  S = "${WORKDIR}/git"
> >
> >  inherit setuptools
> > --
> > 2.7.4
> >
> >
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11488c94e2436f0546c71bd8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jan 23, 2017 at 9:01 AM, Mark Asselstine <span dir=3D"ltr">&lt;=
<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.ass=
elstine@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span class=3D"">On Mon, Jan 23, 2017 at 4:02 AM, Huang Qiyu &lt;<a href=
=3D"mailto:huangqy.fnst@cn.fujitsu.com">huangqy.fnst@cn.fujitsu.com</a>&gt;=
 wrote:<br>
&gt; Upgrade python-heatclient from 0.6.0 to 1.7.0.<br>
&gt;<br>
&gt; Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujits=
u.com">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
<br>
</span>Huang, we need to ensure we stick to releases witch match<br>
stable/newton and not go beyond. So for this package we should be<br>
using the latest commit on the stable/newton branch and the version<br>
will be 1.5.0+git${SRCPV}. The other uprev&#39;s look fine, although as we<=
br>
proceed through the newton update we might find incompatibilities<br>
which might result in some tweaking.<br></blockquote><div><br></div><div>Ag=
reed. I&#39;m happy to take uprevs of the python support packages, but for<=
br></div><div>anything that is a core project, or interfaces directly with =
those core projects, <br></div><div>I&#39;d rather batch merge their update=
s .. once we&#39;ve shown a fully working system.<br><br></div><div>Bruce<b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Just out of curiosity, what are your end goals for these<br>
contributions? do you have a usecase for this repo that I can keep in<br>
mind as I move things forward?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mark<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt;=C2=A0 meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-heatclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>he=
atclient_git.bb</a> | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"ht=
tp://python-heatclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-=
<wbr>heatclient_git.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a=
 href=3D"http://python-heatclient_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python-<wbr>heatclient_git.bb</a><br>
&gt; index 26d86be..711a36d 100644<br>
&gt; --- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-heatclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>he=
atclient_git.bb</a><br>
&gt; +++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-heatclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>he=
atclient_git.bb</a><br>
&gt; @@ -28,8 +28,8 @@ SRCNAME =3D &quot;heatclient&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/openstack/p=
ython-heatclient.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">=
github.com/openstack/<wbr>python-heatclient.git;branch=3D<wbr>master</a>&qu=
ot;<br>
&gt;<br>
&gt; -PV =3D &quot;0.6.0+git${SRCPV}&quot;<br>
&gt; -SRCREV =3D &quot;<wbr>7cca8394b8ab2f4dccb982ae789b1b<wbr>2985627115&q=
uot;<br>
&gt; +PV =3D &quot;1.7.0+git${SRCPV}&quot;<br>
&gt; +SRCREV =3D &quot;<wbr>17dd3068e4d6fc10236290cc082908<wbr>c439bcfead&q=
uot;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit setuptools<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@<wbr>yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/=
listinfo/meta-<wbr>virtualization</a><br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a11488c94e2436f0546c71bd8--
