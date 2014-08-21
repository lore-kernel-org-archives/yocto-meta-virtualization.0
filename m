Return-Path: <bobadeshrikant@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4147E00807; Thu, 21 Aug 2014 02:07:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bobadeshrikant[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F5C0E004F5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Aug 2014 02:07:00 -0700 (PDT)
Received: by mail-ig0-f177.google.com with SMTP id hn18so12553519igb.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Aug 2014 02:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jKxQiu/4VDGjlTFf6E2eBFRdRrpGxLQDdtXNQSkcZXc=;
	b=I2+CQA2glbm5Hu09rnuf+Spz645m48i/Mc8nc7w3HqpUT5DF6Xz0TtFuLcJjmMkwJs
	wR/3qsuK1NGz0EFJoU92kYMaWA6NaoYeyr2Xq0lBJfewIrvpipuSBw6p8/pOyEoID54U
	Hy0aXq4uVduu02Hdx/1qXX6wIUzdoztQOEpJW79Ne7+NL0XbGR6wNxbjZdvjWdLrbZ8G
	9CdMbuMLjI/gIlxrJLmOd63dsctVdjw7uKFpMvktiupxJHbXzP8Aulk84AzuRERLPVNQ
	AqZDsvT1pRja/yG4FZl0cJT/JqaOirkcee94wgkElDhDkL9JLapQ2expufIMwbZ+qxsf
	8ZyA==
MIME-Version: 1.0
X-Received: by 10.50.114.38 with SMTP id jd6mr2785809igb.25.1408612019921;
	Thu, 21 Aug 2014 02:06:59 -0700 (PDT)
Received: by 10.50.13.10 with HTTP; Thu, 21 Aug 2014 02:06:59 -0700 (PDT)
In-Reply-To: <CADkTA4MCXjFKLd=+c5NQzJG2Ev9Dw=VNpsgqUQEED4swVnY2vA@mail.gmail.com>
References: <1407827345-8097-1-git-send-email-bobadeshrikant@gmail.com>
	<CADkTA4MCXjFKLd=+c5NQzJG2Ev9Dw=VNpsgqUQEED4swVnY2vA@mail.gmail.com>
Date: Thu, 21 Aug 2014 14:36:59 +0530
Message-ID: <CALwQErrEvTA7uSCkvSoU4AHfgzAGgXDPxOLJaR-r+FaVzhkDgQ@mail.gmail.com>
From: Shrikant Bobade <bobadeshrikant@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Shrikant Bobade <Shrikant_Bobade@mentor.com>
Subject: Re: [daisy][PATCH] libvirt: set path to pkcheck
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
X-List-Received-Date: Thu, 21 Aug 2014 09:07:04 -0000
Content-Type: multipart/alternative; boundary=047d7b3a959812eabb0501200bc8

--047d7b3a959812eabb0501200bc8
Content-Type: text/plain; charset=UTF-8

Thanks ! Bruce for applying it on daisy & master.


Regard's
Shrikant


On Mon, Aug 18, 2014 at 11:29 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Tue, Aug 12, 2014 at 3:09 AM, Shrikant Bobade
> <bobadeshrikant@gmail.com> wrote:
> > From: Shrikant Bobade <Shrikant_Bobade@mentor.com>
> >
> > The libvirt build would fail whenever x11 was in DISTRO_FEATURES and the
> host
> > didn't have polkit installed (either no polkit/policykit at all, or just
> old
> > policykit).
> >
> > Ensure that libvirt uses polkit rather than policykit, whether the host
> has
> > pkcheck installed or not, and ensure the path is correct per our config.
>
>
> Sorry for the delay, I was out of the office.
>
> I applied the patch to daisy and master, let me know if anyone has
> problems!
>
> Cheers,
>
> Bruce
>
> >
> > Signed-off-by: Christopher Larson <kergoth@gmail.com>
> > Signed-off-by: Shrikant Bobade <Shrikant_Bobade@mentor.com>
> > ---
> >  recipes-extended/libvirt/libvirt_1.2.2.bb |    5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-extended/libvirt/libvirt_1.2.2.bb
> b/recipes-extended/libvirt/libvirt_1.2.2.bb
> > index 0cd6b99..a14d465 100644
> > --- a/recipes-extended/libvirt/libvirt_1.2.2.bb
> > +++ b/recipes-extended/libvirt/libvirt_1.2.2.bb
> > @@ -67,6 +67,10 @@ ac_cv_path_LVS=/usr/sbin/lvs \
> >  ac_cv_path_PARTED=/usr/sbin/parted \
> >  ac_cv_path_DMSETUP=/usr/sbin/dmsetup"
> >
> > +# Ensure that libvirt uses polkit rather than policykit, whether the
> host has
> > +# pkcheck installed or not, and ensure the path is correct per our
> config.
> > +CACHED_CONFIGUREVARS += "ac_cv_path_PKCHECK_PATH=${bindir}/pkcheck"
> > +
> >  # Some other possible paths we are not yet setting
> >  #ac_cv_path_RPCGEN=
> >  #ac_cv_path_XSLTPROC=
> > @@ -75,7 +79,6 @@ ac_cv_path_DMSETUP=/usr/sbin/dmsetup"
> >  #ac_cv_path_EBTABLES_PATH=
> >  #ac_cv_path_PKG_CONFIG=
> >  #ac_cv_path_ac_pt_PKG_CONFIG
> > -#ac_cv_path_PKCHECK_PATH=
> >  #ac_cv_path_POLKIT_AUTH=
> >  #ac_cv_path_DTRACE=
> >  #ac_cv_path_ISCSIADM=
> > --
> > 1.7.9.5
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
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>

--047d7b3a959812eabb0501200bc8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Thanks ! Bruce for applying it on daisy &amp; ma=
ster. <br><br><br></div>Regard&#39;s<br></div>Shrikant<br><div><div><div><d=
iv class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon, Aug 18,=
 2014 at 11:29 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:b=
ruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;=
</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Tue, Aug 12, 2014 at 3:09=
 AM, Shrikant Bobade<br>
&lt;<a href=3D"mailto:bobadeshrikant@gmail.com">bobadeshrikant@gmail.com</a=
>&gt; wrote:<br>
&gt; From: Shrikant Bobade &lt;<a href=3D"mailto:Shrikant_Bobade@mentor.com=
">Shrikant_Bobade@mentor.com</a>&gt;<br>
&gt;<br>
&gt; The libvirt build would fail whenever x11 was in DISTRO_FEATURES and t=
he host<br>
&gt; didn&#39;t have polkit installed (either no polkit/policykit at all, o=
r just old<br>
&gt; policykit).<br>
&gt;<br>
&gt; Ensure that libvirt uses polkit rather than policykit, whether the hos=
t has<br>
&gt; pkcheck installed or not, and ensure the path is correct per our confi=
g.<br>
<br>
<br>
</div>Sorry for the delay, I was out of the office.<br>
<br>
I applied the patch to daisy and master, let me know if anyone has problems=
!<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.=
com">kergoth@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Shrikant Bobade &lt;<a href=3D"mailto:Shrikant_Bobade@m=
entor.com">Shrikant_Bobade@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-extended/libvirt/<a href=3D"http://libvirt_1.2.2.bb" tar=
get=3D"_blank">libvirt_1.2.2.bb</a> |=C2=A0 =C2=A0 5 ++++-<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.2.2.=
bb" target=3D"_blank">libvirt_1.2.2.bb</a> b/recipes-extended/libvirt/<a hr=
ef=3D"http://libvirt_1.2.2.bb" target=3D"_blank">libvirt_1.2.2.bb</a><br>
&gt; index 0cd6b99..a14d465 100644<br>
&gt; --- a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.2.2.bb" tar=
get=3D"_blank">libvirt_1.2.2.bb</a><br>
&gt; +++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_1.2.2.bb" tar=
get=3D"_blank">libvirt_1.2.2.bb</a><br>
&gt; @@ -67,6 +67,10 @@ ac_cv_path_LVS=3D/usr/sbin/lvs \<br>
&gt;=C2=A0 ac_cv_path_PARTED=3D/usr/sbin/parted \<br>
&gt;=C2=A0 ac_cv_path_DMSETUP=3D/usr/sbin/dmsetup&quot;<br>
&gt;<br>
&gt; +# Ensure that libvirt uses polkit rather than policykit, whether the =
host has<br>
&gt; +# pkcheck installed or not, and ensure the path is correct per our co=
nfig.<br>
&gt; +CACHED_CONFIGUREVARS +=3D &quot;ac_cv_path_PKCHECK_PATH=3D${bindir}/p=
kcheck&quot;<br>
&gt; +<br>
&gt;=C2=A0 # Some other possible paths we are not yet setting<br>
&gt;=C2=A0 #ac_cv_path_RPCGEN=3D<br>
&gt;=C2=A0 #ac_cv_path_XSLTPROC=3D<br>
&gt; @@ -75,7 +79,6 @@ ac_cv_path_DMSETUP=3D/usr/sbin/dmsetup&quot;<br>
&gt;=C2=A0 #ac_cv_path_EBTABLES_PATH=3D<br>
&gt;=C2=A0 #ac_cv_path_PKG_CONFIG=3D<br>
&gt;=C2=A0 #ac_cv_path_ac_pt_PKG_CONFIG<br>
&gt; -#ac_cv_path_PKCHECK_PATH=3D<br>
&gt;=C2=A0 #ac_cv_path_POLKIT_AUTH=3D<br>
&gt;=C2=A0 #ac_cv_path_DTRACE=3D<br>
&gt;=C2=A0 #ac_cv_path_ISCSIADM=3D<br>
&gt; --<br>
&gt; 1.7.9.5<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion</a><br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</font></span></blockquote></div><br></div></div></div></div></div>

--047d7b3a959812eabb0501200bc8--
