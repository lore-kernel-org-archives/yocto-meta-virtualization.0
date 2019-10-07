Return-Path: <liu.ming50@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 692E3E009D4; Mon,  7 Oct 2019 05:10:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (liu.ming50[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.221.66 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A77FE007A2
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Oct 2019 05:10:48 -0700 (PDT)
Received: by mail-wr1-f66.google.com with SMTP id p14so14054065wro.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 07 Oct 2019 05:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5NgSV8O7YgOZ4TvUgEcc/CLwRnmn968mjfG+1PLAb+Y=;
	b=OcG8h5abF3MqxPOP1KxNxjC21nhWt9hPJFRBh7PsQCFWyTRzljEDI6OpaY8QU02BX2
	i/OE+XSROgzNQAneYCsygLZDzEWRWv8zr4PsznSjcrqKcWWNaNz2aO8T9MrTeZDtp7/w
	31Hand+Urub763w5vvlcmkZ15mRdLDsfOjU5fXjvhq0OK9Y3m7SfhsSRas/oo4xD+abs
	xDxfF97zLYx0Pi7ysvlkZFjAV4SdeUDhUbudeWfy//RVM1ZlueAEKF1nWddirKlbOLBK
	0XKSKR8N2ZJwk7nc95PLst32GrYttG6Eb42JVRBjqMxg+O3YT/IM5RsqYQaCX/zeeGTX
	zo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5NgSV8O7YgOZ4TvUgEcc/CLwRnmn968mjfG+1PLAb+Y=;
	b=GS5wp3D9WpMySf8y75GycrT5QrgJzav+MvY8pMfCTFH4fTtBNRppFJqafemsBQl2AX
	lNwvITnIxH2As/NrlsTn5iIHgozfBFoXykDdrkkcjrvoA2xP637NOtRO4wTcIdphJdct
	Ny8LE5jGsOdy7Wa5Crw7OOv8CP0DUyyqDJ7O9rhJOGkE5E1nOnjUSoMi7y5FH/+BqQ/k
	u/2MHTXglMgJJQJmfNOD/BgaMp4AAaAhj/b11anKecDyiqZXbG8Oe1STRHnscCwOvgFo
	JTH7Y6ml5n/9XLZYvYj4atXxjPDySfsRqrJgYaAi+y6Wna5C+5Klg0x7CEe+CmDP4B5r
	Kl1Q==
X-Gm-Message-State: APjAAAVs8bS7sDiocfCVYssTOQ6IP/OktIEQ+Us4mJeGwwsCYBxOkd4g
	22RSfr0Bn5CbojmFCvIXfLM6MM+ntVxU8UfZVSI=
X-Google-Smtp-Source: APXvYqxMWNOJPa8NXSAoOspaz4VtZNSHVb86HgQVMKdI9WgfSgNlgVjVlunDkLdpw8KNkT/eyHyc0wbk41Wfe0rrri8=
X-Received: by 2002:adf:afed:: with SMTP id y45mr22025697wrd.347.1570450247083;
	Mon, 07 Oct 2019 05:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <1570445149-7427-1-git-send-email-liu.ming50@gmail.com>
	<CADkTA4Ow0whOd3z65a2noYw=+axEBwoBsMmzFy5eERGLhNj3oA@mail.gmail.com>
In-Reply-To: <CADkTA4Ow0whOd3z65a2noYw=+axEBwoBsMmzFy5eERGLhNj3oA@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Mon, 7 Oct 2019 14:10:36 +0200
Message-ID: <CALatG=5Did5k_gK5L=f7=wmcKWn4daOeygLjmpbRbjsY+qCTbA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] podman: drop selinux sanity check
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
X-List-Received-Date: Mon, 07 Oct 2019 12:10:50 -0000
Content-Type: multipart/alternative; boundary="0000000000001d6a13059450f1fa"

--0000000000001d6a13059450f1fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great! Good to know that, we are currently blocked by this sanity check.

//Ming Liu

Bruce Ashfield <bruce.ashfield@gmail.com> =E6=96=BC 2019=E5=B9=B410=E6=9C=
=887=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:05=E5=AF=AB=E9=81=93=
=EF=BC=9A

> I also have a fix for this, that I hadn't pushed yet.
>
> Will push my change later today.
>
> Cheers,
>
> Bruce
>
> On Mon, Oct 7, 2019 at 6:46 AM <liu.ming50@gmail.com> wrote:
> >
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > libselinux is not a dependency of podman, drop a useless sanity check.
> >
> > Also fix some invalid comments.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  recipes-containers/podman/podman_git.bb | 10 ++--------
> >  1 file changed, 2 insertions(+), 8 deletions(-)
> >
> > diff --git a/recipes-containers/podman/podman_git.bb
> b/recipes-containers/podman/podman_git.bb
> > index 64e2672..835e4d5 100644
> > --- a/recipes-containers/podman/podman_git.bb
> > +++ b/recipes-containers/podman/podman_git.bb
> > @@ -16,18 +16,12 @@ DEPENDS =3D " \
> >
> >  python __anonymous() {
> >      msg =3D ""
> > -    # ERROR: Nothing PROVIDES 'libseccomp' (but
> /buildarea/layers/meta-virtualization/recipes-containers/cri-o/
> cri-o_git.bb DEPENDS on or otherwise requires it).
> > +    # ERROR: Nothing PROVIDES 'libseccomp' (but
> /buildarea/layers/meta-virtualization/recipes-containers/podman/
> podman_git.bb DEPENDS on or otherwise requires it).
> >      # ERROR: Required build target 'meta-world-pkgdata' has no
> buildable providers.
> > -    # Missing or unbuildable dependency chain was:
> ['meta-world-pkgdata', 'cri-o', 'libseccomp']
> > +    # Missing or unbuildable dependency chain was:
> ['meta-world-pkgdata', 'podman', 'libseccomp']
> >      if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
> >          msg +=3D "Make sure meta-security should be present as it
> provides 'libseccomp'"
> >          raise bb.parse.SkipRecipe(msg)
> > -    # ERROR: Nothing PROVIDES 'libselinux' (but
> /buildarea/layers/meta-virtualization/recipes-containers/cri-o/
> cri-o_git.bb DEPENDS on or otherwise requires it).
> > -    # ERROR: Required build target 'meta-world-pkgdata' has no
> buildable providers.
> > -    # Missing or unbuildable dependency chain was:
> ['meta-world-pkgdata', 'cri-o', 'libselinux']
> > -    elif 'selinux' not in d.getVar('BBFILE_COLLECTIONS').split():
> > -        msg +=3D "Make sure meta-selinux should be present as it provi=
des
> 'libselinux'"
> > -        raise bb.parse.SkipRecipe(msg)
> >  }
> >
> >  SRCREV =3D "00057929f5acfd98341964d85722383363376d52"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--0000000000001d6a13059450f1fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great! Good to know that, we are currently blocked by this=
 sanity check.<div><br></div><div>//Ming Liu</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a hre=
f=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; =E6=
=96=BC 2019=E5=B9=B410=E6=9C=887=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=
=8D=882:05=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">I also have a fix for this, that I hadn&#39;t pushed =
yet.<br>
<br>
Will push my change later today.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
On Mon, Oct 7, 2019 at 6:46 AM &lt;<a href=3D"mailto:liu.ming50@gmail.com" =
target=3D"_blank">liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_=
blank">liu.ming50@gmail.com</a>&gt;<br>
&gt;<br>
&gt; libselinux is not a dependency of podman, drop a useless sanity check.=
<br>
&gt;<br>
&gt; Also fix some invalid comments.<br>
&gt;<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a> | 10 ++--------<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt; diff --git a/recipes-containers/podman/<a href=3D"http://podman_git.bb=
" rel=3D"noreferrer" target=3D"_blank">podman_git.bb</a> b/recipes-containe=
rs/podman/<a href=3D"http://podman_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">podman_git.bb</a><br>
&gt; index 64e2672..835e4d5 100644<br>
&gt; --- a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a><br>
&gt; +++ b/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a><br>
&gt; @@ -16,18 +16,12 @@ DEPENDS =3D &quot; \<br>
&gt;<br>
&gt;=C2=A0 python __anonymous() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 msg =3D &quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 # ERROR: Nothing PROVIDES &#39;libseccomp&#39; (but /bu=
ildarea/layers/meta-virtualization/recipes-containers/cri-o/<a href=3D"http=
://cri-o_git.bb" rel=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a> DEPE=
NDS on or otherwise requires it).<br>
&gt; +=C2=A0 =C2=A0 # ERROR: Nothing PROVIDES &#39;libseccomp&#39; (but /bu=
ildarea/layers/meta-virtualization/recipes-containers/podman/<a href=3D"htt=
p://podman_git.bb" rel=3D"noreferrer" target=3D"_blank">podman_git.bb</a> D=
EPENDS on or otherwise requires it).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # ERROR: Required build target &#39;meta-world-pkg=
data&#39; has no buildable providers.<br>
&gt; -=C2=A0 =C2=A0 # Missing or unbuildable dependency chain was: [&#39;me=
ta-world-pkgdata&#39;, &#39;cri-o&#39;, &#39;libseccomp&#39;]<br>
&gt; +=C2=A0 =C2=A0 # Missing or unbuildable dependency chain was: [&#39;me=
ta-world-pkgdata&#39;, &#39;podman&#39;, &#39;libseccomp&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if &#39;security&#39; not in d.getVar(&#39;BBFILE_=
COLLECTIONS&#39;).split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg +=3D &quot;Make sure meta-securi=
ty should be present as it provides &#39;libseccomp&#39;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(msg)<br>
&gt; -=C2=A0 =C2=A0 # ERROR: Nothing PROVIDES &#39;libselinux&#39; (but /bu=
ildarea/layers/meta-virtualization/recipes-containers/cri-o/<a href=3D"http=
://cri-o_git.bb" rel=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a> DEPE=
NDS on or otherwise requires it).<br>
&gt; -=C2=A0 =C2=A0 # ERROR: Required build target &#39;meta-world-pkgdata&=
#39; has no buildable providers.<br>
&gt; -=C2=A0 =C2=A0 # Missing or unbuildable dependency chain was: [&#39;me=
ta-world-pkgdata&#39;, &#39;cri-o&#39;, &#39;libselinux&#39;]<br>
&gt; -=C2=A0 =C2=A0 elif &#39;selinux&#39; not in d.getVar(&#39;BBFILE_COLL=
ECTIONS&#39;).split():<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg +=3D &quot;Make sure meta-selinux sho=
uld be present as it provides &#39;libselinux&#39;&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(msg)<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;00057929f5acfd98341964d85722383363376d52&quot;<=
br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_bla=
nk">meta-virtualization@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listi=
nfo/meta-virtualization</a><br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--0000000000001d6a13059450f1fa--
