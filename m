Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97A8EE00CAA; Tue,  5 Jan 2016 08:44:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.51 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 371B9E0033E
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Jan 2016 08:44:16 -0800 (PST)
Received: by mail-vk0-f51.google.com with SMTP id f2so230158808vkb.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Jan 2016 08:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fcb/T3htcC+Q2D4iwJgi+1iUvUyFAzNOYRPKj2ypozc=;
	b=FZOsA0qJ6NBDXrEjYzwZGE2Fl7BNDdv4dj5ifCD9PABTPY4zJJcqsaRg8MOGclR8Lm
	FRMH4S+JLRCbkBZEAvECIyaGI4YDU52KQP1FI+9ZbAx/GXFI/cPMgnWiYctKj2neLvQ0
	AVeTQlNU24SqbNzymjj5sW/oG1GJvhQDwvHdjUIe4ztAL+J+Mb8BBND781J1h+C+sanu
	k2lH1VMQM39TzV2RIjyDpvMCgB8UIg5vnGJa3A+U7bi5PyeC3WBnkx3wkFGARAcWJjCV
	HO7aFdkiZRrJ9cy7+eA8yaXXHTIzFWv1DFajvuoH/O3kXMReKfN+OeGFQO0OSHBWK6aj
	NDxw==
MIME-Version: 1.0
X-Received: by 10.31.150.215 with SMTP id y206mr27348122vkd.63.1452012256098; 
	Tue, 05 Jan 2016 08:44:16 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Tue, 5 Jan 2016 08:44:16 -0800 (PST)
In-Reply-To: <CAPuovEL8oEF=+rz2N-t9aXwfr=sV8U9PrCCO4YR+NeO2T0=Qzw@mail.gmail.com>
References: <CAPuovEJA6me_M0qtm1EeN=WnzrcOZ-GwfNtHBsEym-gAKRkYng@mail.gmail.com>
	<1451959280-3349-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<CAPuovEL8oEF=+rz2N-t9aXwfr=sV8U9PrCCO4YR+NeO2T0=Qzw@mail.gmail.com>
Date: Tue, 5 Jan 2016 11:44:16 -0500
Message-ID: <CADkTA4Nzb9LtdBk7eF+wEr7RtDyw5H__ZC5fEw_NFqdeeVPSbw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH 00/21] Error fix for recipes depend on python-pbr
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
X-List-Received-Date: Tue, 05 Jan 2016 16:44:20 -0000
Content-Type: multipart/alternative; boundary=001a1140fdd8bc0028052898f2a8

--001a1140fdd8bc0028052898f2a8
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 5, 2016 at 11:36 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On Mon, Jan 4, 2016 at 9:00 PM, Li Xin <lixin.fnst@cn.fujitsu.com> wrote:
> > [PATCH 01/21] ~ [PATCH 21/21] are recipes depend on python-pbr.
> > And they will download pbr modules in the step of do_compile.
> > If your network is not very well,errors will occur as following:
> >   Download error on https://pypi.python.org/simple/pbr/:
> >   [Errno -5] No address associated with hostname -- Some packages may
> not be found!
> >   Couldn't find index page for 'pbr' (maybe misspelled?)
> >   No local packages or download links found for pbr
> > so add do_compile_prepend to fix it.
>
>
> When there was one of these I think the solution we put in place was
> sufficient but now with pbr and the dozen+ instances being fixed here
> we might want to handle this in the python bbclass. We could have the
> pbr and vcversioner recipes set a flag that will ensure the egg is
> created and then recipes which require the egg have a list of
> REQUIRED_EGGS or similar to indicate to the class that the copy needs
> to take place. Thoughts?
>


We can't have the individual packages poking around for eggs. If a DEPENDS
on python-pbr isn't sufficient, we need to fix the packaging of pbr, or
solve it
at the base level.

It's also unclear to me why we need special compile/install steps for
python-pbr
itself. Again, if that is required, the python classes should be taking
care of it,
not the recipes.

Bruce



>
> Mark
>
> >
> > Li Xin (21):
> >   python-pbr: Error fix for recipes depend on python-pbr
> >   python-cliff: Error fix
> >   python-fixtures: Error fix
> >   python-glanceclient: Error fix
> >   python-heat: Error fix
> >   python-heatclient: Error fix
> >   python-keystoneclient: Error fix
> >   python-lockfile: Error fix
> >   python-mox3: Error fix
> >   python-oslo.config: Error fix
> >   python-oslo.context: Error fix
> >   python-oslo.i18n: Error fix
> >   python-oslo.log: Error fix
> >   python-oslo.serialization: Error fix
> >   python-oslo.utils: Error fix
> >   python-sqlalchemy-migrate: Error fix
> >   python-stevedore: Error fix
> >   python-swiftclient: Error fix
> >   python-testscenarios: Error fix
> >   python-testtools: Error fix
> >   python-wsme: Error fix
> >
> >  meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb  |  7
> +++++++
> >  .../recipes-devtools/python/python-fixtures_1.3.1.bb           |  6
> ++++++
> >  .../recipes-devtools/python/python-glanceclient_git.bb         |  7
> +++++++
> >  meta-openstack/recipes-devtools/python/python-heat_git.bb      |  7
> +++++++
> >  .../recipes-devtools/python/python-heatclient_git.bb           |  7
> +++++++
> >  .../recipes-devtools/python/python-keystoneclient_git.bb       |  7
> +++++++
> >  .../recipes-devtools/python/python-lockfile_0.10.2.bb          |  6
> ++++++
> >  meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb    |  6
> ++++++
> >  .../recipes-devtools/python/python-oslo.config_1.14.0.bb       |  7
> +++++++
> >  .../recipes-devtools/python/python-oslo.context_git.bb         |  6
> ++++++
> >  .../recipes-devtools/python/python-oslo.i18n_1.6.0.bb          |  6
> ++++++
> >  meta-openstack/recipes-devtools/python/python-oslo.log_git.bb  |  7
> +++++++
> >  .../recipes-devtools/python/python-oslo.serialization_git.bb   |  6
> ++++++
> >  .../recipes-devtools/python/python-oslo.utils_git.bb           |  6
> ++++++
> >  meta-openstack/recipes-devtools/python/python-pbr_1.4.0.bb     | 10
> ++++++++++
> >  .../recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb |  6
> ++++++
> >  .../recipes-devtools/python/python-stevedore_1.6.0.bb          |  6
> ++++++
> >  .../recipes-devtools/python/python-swiftclient_git.bb          |  7
> +++++++
> >  .../recipes-devtools/python/python-testscenarios_0.5.0.bb      |  6
> ++++++
> >  .../recipes-devtools/python/python-testtools_1.8.0.bb          |  7
> +++++++
> >  meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb    |  6
> ++++++
> >  21 files changed, 139 insertions(+)
> >
> > --
> > 1.8.4.2
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

--001a1140fdd8bc0028052898f2a8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jan 5, 2016 at 11:36 AM, Mark Asselstine <span dir=3D"ltr">&lt;=
<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.ass=
elstine@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span>On Mon, Jan 4, 2016 at 9:00 PM, Li Xin &lt;<a href=3D"mailto:lixin=
.fnst@cn.fujitsu.com" target=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&gt; w=
rote:<br>
&gt; [PATCH 01/21] ~ [PATCH 21/21] are recipes depend on python-pbr.<br>
&gt; And they will download pbr modules in the step of do_compile.<br>
&gt; If your network is not very well,errors will occur as following:<br>
&gt;=C2=A0 =C2=A0Download error on <a href=3D"https://pypi.python.org/simpl=
e/pbr/" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/simple=
/pbr/</a>:<br>
&gt;=C2=A0 =C2=A0[Errno -5] No address associated with hostname -- Some pac=
kages may not be found!<br>
&gt;=C2=A0 =C2=A0Couldn&#39;t find index page for &#39;pbr&#39; (maybe miss=
pelled?)<br>
&gt;=C2=A0 =C2=A0No local packages or download links found for pbr<br>
&gt; so add do_compile_prepend to fix it.<br>
<br>
<br>
</span>When there was one of these I think the solution we put in place was=
<br>
sufficient but now with pbr and the dozen+ instances being fixed here<br>
we might want to handle this in the python bbclass. We could have the<br>
pbr and vcversioner recipes set a flag that will ensure the egg is<br>
created and then recipes which require the egg have a list of<br>
REQUIRED_EGGS or similar to indicate to the class that the copy needs<br>
to take place. Thoughts?<br></blockquote><div><br><br></div><div>We can&#39=
;t have the individual packages poking around for eggs. If a DEPENDS<br></d=
iv><div>on python-pbr isn&#39;t sufficient, we need to fix the packaging of=
 pbr, or solve it<br></div><div>at the base level.<br><br></div><div>It&#39=
;s also unclear to me why we need special compile/install steps for python-=
pbr<br></div><div>itself. Again, if that is required, the python classes sh=
ould be taking care of it,<br></div><div>not the recipes.<br><br></div><div=
>Bruce<br></div><div><br>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span><font color=3D"#888888"><br>
Mark<br>
</font></span><div><div><br>
&gt;<br>
&gt; Li Xin (21):<br>
&gt;=C2=A0 =C2=A0python-pbr: Error fix for recipes depend on python-pbr<br>
&gt;=C2=A0 =C2=A0python-cliff: Error fix<br>
&gt;=C2=A0 =C2=A0python-fixtures: Error fix<br>
&gt;=C2=A0 =C2=A0python-glanceclient: Error fix<br>
&gt;=C2=A0 =C2=A0python-heat: Error fix<br>
&gt;=C2=A0 =C2=A0python-heatclient: Error fix<br>
&gt;=C2=A0 =C2=A0python-keystoneclient: Error fix<br>
&gt;=C2=A0 =C2=A0python-lockfile: Error fix<br>
&gt;=C2=A0 =C2=A0python-mox3: Error fix<br>
&gt;=C2=A0 =C2=A0python-oslo.config: Error fix<br>
&gt;=C2=A0 =C2=A0python-oslo.context: Error fix<br>
&gt;=C2=A0 =C2=A0python-oslo.i18n: Error fix<br>
&gt;=C2=A0 =C2=A0python-oslo.log: Error fix<br>
&gt;=C2=A0 =C2=A0python-oslo.serialization: Error fix<br>
&gt;=C2=A0 =C2=A0python-oslo.utils: Error fix<br>
&gt;=C2=A0 =C2=A0python-sqlalchemy-migrate: Error fix<br>
&gt;=C2=A0 =C2=A0python-stevedore: Error fix<br>
&gt;=C2=A0 =C2=A0python-swiftclient: Error fix<br>
&gt;=C2=A0 =C2=A0python-testscenarios: Error fix<br>
&gt;=C2=A0 =C2=A0python-testtools: Error fix<br>
&gt;=C2=A0 =C2=A0python-wsme: Error fix<br>
&gt;<br>
&gt;=C2=A0 meta-openstack/recipes-devtools/python/<a href=3D"http://python-=
cliff_1.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python-cliff_1.13.0.b=
b</a>=C2=A0 |=C2=A0 7 +++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python-fixtures_1.=
3.1.bb" rel=3D"noreferrer" target=3D"_blank">python-fixtures_1.3.1.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python-glanceclien=
t_git.bb" rel=3D"noreferrer" target=3D"_blank">python-glanceclient_git.bb</=
a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++++<br>
&gt;=C2=A0 meta-openstack/recipes-devtools/python/<a href=3D"http://python-=
heat_git.bb" rel=3D"noreferrer" target=3D"_blank">python-heat_git.bb</a>=C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python-heatclient_=
git.bb" rel=3D"noreferrer" target=3D"_blank">python-heatclient_git.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python-keystonecli=
ent_git.bb" rel=3D"noreferrer" target=3D"_blank">python-keystoneclient_git.=
bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python-lockfile_0.=
10.2.bb" rel=3D"noreferrer" target=3D"_blank">python-lockfile_0.10.2.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++++++<br>
&gt;=C2=A0 meta-openstack/recipes-devtools/python/<a href=3D"http://python-=
mox3_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python-mox3_0.9.0.bb</a=
>=C2=A0 =C2=A0 |=C2=A0 6 ++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python-oslo.config=
_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.config_1.14.0.=
bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python-oslo.contex=
t_git.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.context_git.bb</=
a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python-oslo.i18n_1=
.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.i18n_1.6.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++++++<br>
&gt;=C2=A0 meta-openstack/recipes-devtools/python/<a href=3D"http://python-=
oslo.log_git.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.log_git.b=
b</a>=C2=A0 |=C2=A0 7 +++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python-oslo.serial=
ization_git.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.serializat=
ion_git.bb</a>=C2=A0 =C2=A0|=C2=A0 6 ++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python-oslo.utils_=
git.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.utils_git.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++++<br>
&gt;=C2=A0 meta-openstack/recipes-devtools/python/<a href=3D"http://python-=
pbr_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-pbr_1.4.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0| 10 ++++++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python-sqlalchemy-=
migrate_0.9.7.bb" rel=3D"noreferrer" target=3D"_blank">python-sqlalchemy-mi=
grate_0.9.7.bb</a> |=C2=A0 6 ++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python-stevedore_1=
.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-stevedore_1.6.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python-swiftclient=
_git.bb" rel=3D"noreferrer" target=3D"_blank">python-swiftclient_git.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python-testscenari=
os_0.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-testscenarios_0.5.=
0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python-testtools_1=
.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python-testtools_1.8.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++++++<br>
&gt;=C2=A0 meta-openstack/recipes-devtools/python/<a href=3D"http://python-=
wsme_0.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python-wsme_0.7.0.bb</a=
>=C2=A0 =C2=A0 |=C2=A0 6 ++++++<br>
&gt;=C2=A0 21 files changed, 139 insertions(+)<br>
&gt;<br>
&gt; --<br>
&gt; 1.8.4.2<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_bla=
nk">meta-virtualization@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listi=
nfo/meta-virtualization</a><br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div>&quot;=
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end&quot;</div>
</div></div>

--001a1140fdd8bc0028052898f2a8--
